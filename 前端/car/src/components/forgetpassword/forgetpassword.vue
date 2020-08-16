<template>
  <transition name="forgettransition">
    <div class="forget" v-show="forgetshow">
      <div class="forgettitle">找回密码</div>
      <div class="tianxie2">
        <el-form :model="ruleForm2" status-icon :rules="rules" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
          <el-form-item label="用户名" prop="name2">
            <el-input v-model="ruleForm2.name2" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="答案" prop="answerquestion">
            <el-input v-model="ruleForm2.answerquestion" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="新密码" prop="pass2">
            <el-input type="password" v-model="ruleForm2.pass2" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="checkPass2">
            <el-input type="password" v-model="ruleForm2.checkPass2" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm2')">确定</el-button>
            <el-button @click="resetForm('ruleForm2')">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
      <div class="backhire" @click="falsexianshi"><i class="iconfont icon-zuojiantou"></i></div>
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
          if (this.ruleForm2.checkPass2 !== '') {
            this.$refs.ruleForm2.validateField('checkPass2');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm2.pass2) {
          callback(new Error('两次输入密码不一致!'));
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
      var checkanswer = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('答案不能为空'));
        }else if (value.length > 20) {
          callback(new Error('答案太长'));
        } else {
          callback();
        }
      };
      return{
        forgetshow: false,
        ruleForm2:{
          name2:'',
          answerquestion:'',
          pass2:'',
          checkPass2:''
        },
        rules: {
          name2: [
            {validator: checkname, trigger: 'blur'}
          ],
          pass2: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass2: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          answerquestion:[
            {validator: checkanswer, trigger: 'blur'}
          ]
        },
      }
    },
    methods:{
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            let postData1 = this.$qs.stringify({
              username:this.ruleForm2.name2
            })
            this.$axios.post('http://localhost:8083/car/user/forgetgetquestion',postData1).then((response) =>{
              response = response.data
              let a = response.data
              let w = response.msg
              let b = response.status
              if(b == 0){
                let postData2 = this.$qs.stringify({
                  username:this.ruleForm2.name2,
                  question: a,
                  answer: this.ruleForm2.answerquestion
                })
                this.$axios.post('http://localhost:8083/car/user/forgetcheckanswer',postData2).then((response) => {
                  response = response.data
                  let c = response.status
                  let f = response.msg
                  let d = response.data
                  if (c == 0){
                    let postData3 = this.$qs.stringify({
                      username: this.ruleForm2.name2,
                      passwordNew: this.ruleForm2.pass2,
                      forgetToken: d
                    })
                    this.$axios.post('http://localhost:8083/car/user/forgetrestpassword',postData3).then((response) =>{
                      response = response.data
                      let e = response.status
                      let g = response.msg
                      if (e == 0){
                        alert(g)
                        this.forgetshow = false
                      }else {
                        alert(g)
                      }
                    })
                  }else {
                    alert(f)
                  }
                })
              }else {
                alert(w)
              }
            })
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      show(){
        this.forgetshow = true
      },
      falsexianshi(){
        this.forgetshow = false
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .forget
    position fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 30
    width: 100%
    background: #fff
    .forgettitle
      font-size 19px
      margin-top 120px
      margin-left 20px
    .tianxie2
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
  .forgettransition-enter
    transform: translate3d(100%,0,0)
  .forgettransition-enter-active
    transition: all 0.2s linear
  .forgettransition-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
</style>
