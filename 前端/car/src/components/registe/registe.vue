<template>
  <transition name="registetransition">
    <div class="registe1" v-show="registeshow">
      <div class="registetitle">注册</div>
      <div class="tianxie1">
        <el-form :model="ruleForm1" status-icon :rules="rules" ref="ruleForm1" label-width="100px" class="demo-ruleForm">
          <el-form-item label="用户名" prop="name1">
            <el-input v-model="ruleForm1.name1" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="pass1">
            <el-input type="password" v-model="ruleForm1.pass1" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="checkPass1">
            <el-input type="password" v-model="ruleForm1.checkPass1" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="电话" prop="phone">
            <el-input  v-model="ruleForm1.phone"  style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="问题" prop="question">
            <el-input  v-model="ruleForm1.question"  style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="答案" prop="answer">
            <el-input  v-model="ruleForm1.answer"  style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm1('ruleForm1')">注册</el-button>
            <el-button @click="resetForm1('ruleForm1')">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
      <div class="backhire" @click="falseshow"><i class="iconfont icon-zuojiantou"></i></div>
    </div>
  </transition>
</template>

<script type="text/ecmascript-6">
  export default {
    data(){
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.ruleForm1.checkPass1 !== '') {
            this.$refs.ruleForm1.validateField('checkPass1');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm1.pass1) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      var checkphone = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('手机不能为空'));
        }else if (value.length < 11 && value.length >11) {
          callback(new Error('请输入11位手机号'));
        } else {
          callback();
        }
      };
      var checkquestion = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('问题不能为空'));
        }else if (value.length > 20) {
          callback(new Error('问题太长'));
        } else {
          callback();
        }
      };
      var checkanswer = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('答案不能为空'));
        }else if (value.length > 20) {
          callback(new Error('答案太长'));
        } else {
          callback();
        }
      };
      var checkname = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('用户名不能为空'));
        }else if (value.length > 15) {
          callback(new Error('用户名太长'));
        } else {
          callback();
        }
      };
      return{
        registeshow: false,
        ruleForm1: {
          name1: '',
          pass1:'',
          checkPass1:'',
          phone:'',
          question:'',
          answer:""
        },
        rules: {
          name1: [
            {validator: checkname, trigger: 'blur'}
          ],
          pass1: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass1: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          phone:[
            {validator: checkphone, trigger: 'blur'}
          ],
          question:[
            {validator: checkquestion, trigger: 'blur'}
            ],
          answer:[
            {validator: checkanswer, trigger: 'blur'}
          ]
        },
      }
    },
    methods:{
      show(){
        this.registeshow = true
      },
      falseshow(){
        this.registeshow = false
      },
      submitForm1(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            let postData = this.$qs.stringify({
              username:this.ruleForm1.name1,
              password:this.ruleForm1.pass1,
              phone:this.ruleForm1.phone,
              question:this.ruleForm1.question,
              answer:this.ruleForm1.answer
            })
            this.$axios.post('http://localhost:8083/car/user/register',postData).then((response) => {
              response = response.data
              let code = response.status
              let msg = response.msg
              if (code == 0){
                alert(msg)
                this.registeshow = false
              } else {
                alert(msg)
              }
            })
          } else {
            alert('error');
            return false;
          }
        });
      },
      resetForm1(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .registe1
    position fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 30
    width: 100%
    background: #fff
    .registetitle
      font-size 19px
      margin-top 120px
      margin-left 20px
    .tianxie1
      position relative
      margin-top 40px
      margin-left -20px
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
  .registetransition-enter
    transform: translate3d(100%,0,0)
  .registetransition-enter-active
    transition: all 0.2s linear
  .registetransition-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
</style>
