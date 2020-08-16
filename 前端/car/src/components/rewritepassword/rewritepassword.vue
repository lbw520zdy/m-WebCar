<template>
  <transition name="rewritepasswordtransistion">
    <div class="xiugaimima" v-show="xiugaimimashow">
      <div class="xiugaimimatitle">修改密码</div>
      <div class="tianxie3">
        <el-form :model="ruleForm2" status-icon :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
          <el-form-item label="旧密码" prop="oldpass">
            <el-input type="password" v-model="ruleForm2.oldpass" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="新密码" prop="pass">
            <el-input type="password" v-model="ruleForm2.pass" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="checkPass">
            <el-input type="password" v-model="ruleForm2.checkPass" autocomplete="off" style="width:300px;"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm2')">提交</el-button>
            <el-button @click="resetForm('ruleForm2')">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
      <div class="backuser" @click="falseFlag"><i class="iconfont icon-zuojiantou"></i></div>
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
          if (this.ruleForm2.checkPass !== '') {
            this.$refs.ruleForm2.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm2.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return{
        xiugaimimashow:false,
        ruleForm2: {
          oldpass:'',
          pass: '',
          checkPass: ''
        },
        rules2: {
          oldpass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ]
        }
      }
    },
    methods:{
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            let postData = this.$qs.stringify({
              passwordOld:this.ruleForm2.oldpass,
              passwordNew:this.ruleForm2.pass
            })
            this.$axios.post('http://localhost:8083/car/user/restpassword',postData).then((respone) => {
              respone = respone.data
              let status = respone.status
              let msg = respone.msg
              if (status == 0){
                alert(msg)
                this.xiugaimimashow = false
              }else {
                alert(msg)
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      show(){
        this.xiugaimimashow = true
      },
      falseFlag(){
        this.xiugaimimashow = false
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .rewritepasswordtransistion-enter
    transform: translate3d(100%,0,0)
  .rewritepasswordtransistion-enter-active
    transition: all 0.2s linear
  .rewritepasswordtransistion-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
  .xiugaimima
    position fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 50
    width: 100%
    background: #fff
    .xiugaimimatitle
      font-size 19px
      margin-top 120px
      margin-left 20px
    .tianxie3
      position relative
      margin-top 40px
      margin-left -20px
    .backuser
      position absolute
      left 10px
      top: 20px
      z-index 30
      .icon-zuojiantou
        display block
        padding 10px
        font-size 20px
        color black
</style>
