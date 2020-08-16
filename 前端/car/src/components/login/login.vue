<template>
  <transition name="logintransition">
    <div class="login1" v-show="loginshow">
      <div class="logintitle">登录</div>
        <div class="tianxie">
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
          <el-form-item label="用户名" prop="name">
            <el-input v-model="ruleForm.name" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="pass">
            <el-input type="password" v-model="ruleForm.pass" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="checkPass">
            <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="验证码" prop="yanzhengma">
            <el-input v-model="ruleForm.yanzhengma"style="width:150px;"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')">登录</el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </el-form-item>
        </el-form>
        <div class="yzma"><img :src="yanzhengmatupian1" @click="bianhua"/></div>
        <div class="forgetpass" @click="fogetshow">忘记密码？</div>
      </div>
      <div class="backhire" @click="falseFlag"><i class="iconfont icon-zuojiantou"></i></div>
      <forgetpassword ref="vb"></forgetpassword>
    </div>
  </transition>
</template>

<script type="text/ecmascript-6">
  import forgetpassword from '../../components/forgetpassword/forgetpassword'
  export default {
    components:{
      forgetpassword
    },
    data() {
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.ruleForm.checkPass !== '') {
            this.$refs.ruleForm.validateField('checkPass');
          }
          callback();
        }
      };
      var checkAge = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('验证码不能为空'));
        }else if (value.length < 4) {
          callback(new Error('请输入4位验证码'));
        } else {
          callback();
        }
      };
      var checkname = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('用户名不能为空'));
        }else if (value.length > 10) {
          callback(new Error('用户名太长'));
        } else {
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return{
        loginshow: false,
        ruleForm: {
          name: '',
          pass:'',
          checkPass:'',
          yanzhengma:'',
        },
        duibitu:'',
        rules: {
          name: [
            {validator: checkname, trigger: 'blur'}
          ],
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          yanzhengma:[
            {validator: checkAge, trigger: 'blur'}
          ]
        },
        yanzhengmatupian:''
      }
    },
    computed:{
      yanzhengmatupian1(){
        return 'data:image/jpg;base64,'+this.yanzhengmatupian
      }
  },
    methods:{
      show(){
        this.loginshow = true
      },
      falseFlag(){
        this.loginshow = false
      },
      fogetshow(){
        this.$refs.vb.show()
      },
      bianhua(){
        this.$axios.post('http://localhost:8083/car/user/yanzhengma').then((response) =>{
          response = response.data
          this.yanzhengmatupian = response.data
          this.duibitu = response.msg
          console.log(this.duibitu)
        })
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            if (this.ruleForm.yanzhengma === this.duibitu) {
              let postData = this.$qs.stringify({
                username:this.ruleForm.name,
                password:this.ruleForm.pass
              })
              this.$axios.post('http://localhost:8083/car/user/login',postData).then((response) => {
                response = response.data
                let a = response.status
                let b = response.msg
                let c = response.data
                if (a === 0){
                  alert('登录成功！')
                  this.$emit('chuanuser',c)
                  this.loginshow = false
                } else {
                  alert(b)
                }
              })
            }else {
              alert('验证码错误')
            }
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    },
    created(){
      this.$axios.post('http://localhost:8083/car/user/yanzhengma').then((response) =>{
        response = response.data
        this.yanzhengmatupian = response.data
        this.duibitu = response.msg
        console.log(this.duibitu)
      })
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .login1
    position fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 30
    width: 100%
    background: #fff
    .logintitle
      font-size 19px
      margin-top 120px
      margin-left 20px
    .tianxie
      position relative
      margin-top 40px
      margin-left -20px
      .yzma
        position absolute
        top:185px
        right 34px
      .forgetpass
        padding 10px
        position absolute
        top: 252px
        right 49px
    .backhire
      position absolute
      left 10px
      top: 20px
      z-index 30
      .icon-zuojiantou
        display block
        padding 10px
        font-size 20px
        color black
  .logintransition-enter
    transform: translate3d(100%,0,0)
  .logintransition-enter-active
    transition: all 0.2s linear
  .logintransition-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
</style>
