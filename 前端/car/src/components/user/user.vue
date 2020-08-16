<template>
  <div class="user">
    <div class="user-main">
      <div class="user-content">
        <div class="nameortupian">
          <div class="imguser">
            <i class="iconfont icon-yonghu"></i>
          </div>
          <div class="nameandphone" v-if="user.length != 0">
            <div class="name">{{user.username}}</div>
            <div class="phone">{{subphone}}</div>
          </div>
          <div class="loginandregiste" v-else>
            <span class="login" @click="denglu($event)">登录</span> /
            <span class="registe" @click="zuce($event)">注册</span>
          </div>
          <i class="iconfont icon-xiayiye"></i>
        </div>
      </div>
      <ul class="list">
        <li class="item" @click="gereninfo"><i class="iconfont icon-gerenxinxi"></i>个人信息<i class="iconfont icon-xiayiye"></i></li>
        <li class="item"><i class="iconfont icon-xinxi"></i>信息<i class="iconfont icon-xiayiye"></i></li>
        <li class="item" @click="myorder"><i class="iconfont icon-dingdan"></i>我的订单<i class="iconfont icon-xiayiye"></i></li>
        <li class="item" @click="xiugaimimaandtuichu"><i class="iconfont icon-shezhi"></i>设置<i class="iconfont icon-xiayiye"></i></li>
        <li class="item"><i class="iconfont icon-kefu2"></i>客服<i class="iconfont icon-xiayiye"></i></li>
        <a href="http://localhost:8083/baby/exportexcel">导出</a>
      </ul>
      <div class="wode">我的</div>
    </div>
    <login ref="ab" @chuanuser="getuser"></login>
    <registe ref="bc"></registe>
    <orderlist ref="cd"></orderlist>
    <shezhi ref="de" @gaibian="usernull"></shezhi>
    <userinfo ref="ef"></userinfo>
  </div>
</template>

<script type="text/ecmascript-6">
  import login from '../../components/login/login'
  import registe from '../../components/registe/registe'
  import orderlist from '../../components/orderlist/orderlist'
  import shezhi from '../../components/shezhi/shezhi'
  import userinfo from '../../components/userinfo/userinfo'
  export default {
    components:{
      login,
      registe,
      orderlist,
      shezhi,
      userinfo
    },
    data(){
      return{
        user: [],
      }
    },
    methods:{
      denglu(event){
        this.$refs.ab.show()
      },
      getuser(val){
        this.$axios.get('http://localhost:8083/car/user/getuserinfo').then((response) =>{
          response = response.data
          let status = response.status
          let msg = response.msg
          if (status == 0){
            this.user = response.data
          }else {
            alert(msg)
          }
        })
      },
      usernull(){
        this.user = []
      },
      zuce(event){
        this.$refs.bc.show()
      },
      gereninfo(){
         this.$refs.ef.show()
      },
      myorder(){
        this.$refs.cd.show()
      },
      xiugaimimaandtuichu(){
        this.$refs.de.show()
      }
    },
    computed:{
      subphone(){
        return this.user.phone.substring(0,3)+'******'+ this.user.phone.substring(9,11)
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../stylus/mixin.styl"
  .user
    position absolute
    overflow hidden
    position: absolute
    top: 125px
    bottom:51px
    width 100%
    .user-main
      min-height 100%
      .wode
        color: white
        padding 10px
        width 100%
        position absolute
        top: 0
        left 0
        text-align center
        font-size 18px
        font-weight 500
        background-color: rgba(7,17,27,0.4)
      .user-content
        position absolute
        top: 36px
        width 100%
        .nameortupian
          padding-top 15px
          padding-left 20px
          padding-right 20px
          padding-bottom 15px
          position relative
          background-color: rgba(7,17,27,0.4)
          .imguser
            display inline-block
            vertical-align top
            .icon-yonghu
              color white
              font-size 45px
          .nameandphone
            margin-left 10px
            display inline-block
            vertical-align top
            .name
              margin-top 6px
              font-size 14px
              margin-bottom 5px
            .phone
              border-radius 5px
              padding 2px
              background-color rgba(7,17,27,0.1)
              font-size 12px
          .icon-xiayiye
            color white
            padding 10px
            position absolute
            top: 22px
            right 1px
          .loginandregiste
            font-size 18px
            margin-top 8px
            margin-left 20px
            display inline-block
            vertical-align top
            color orange
            .login
              display inline-block
              padding 8px
            .registe
              display inline-block
              padding 8px
      .list
        width 100%
        padding-left 20px
        padding-right 20px
        position absolute
        top 124px
        font-size 18px
        .item
          position relative
          padding-bottom 20px
          margin-bottom 10px
          border-1px(rgba(7,17,27,0.1))
          .icon-gerenxinxi
            font-size 25px
            margin-right 15px
          .icon-xinxi
            font-size 25px
            margin-right 15px
          .icon-dingdan
            font-size 25px
            margin-right 15px
          .icon-shezhi
            font-size 25px
            margin-right 15px
          .icon-kefu2
            font-size 25px
            margin-right 15px
          .icon-xiayiye
            position absolute
            top: 5px
            right 30px
</style>
