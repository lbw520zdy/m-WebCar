<template>
  <transition name="userinfotransition">
    <div class="userinfo" v-show="userinfoshow">
      <div class="userinfo-content" v-if="user.length != 0">
        <ul>
          <div class="split"></div>
          <li class="item">用户名：<span class="name">{{this.user.username}}</span></li>
          <li class="item">手机号：<span class="phone">{{this.user.phone}}</span></li>
          <div class="split"></div>
          <li class="item">创建时间：<span class="time">{{this.user.createTime | format}}</span></li>
        </ul>
      </div>
      <div class="title">
        <h1 class="biaoti">个人信息</h1>
        <div class="back" @click.stop.prevent="hide($event)"><i class="iconfont icon-zuojiantou"></i></div>
      </div>
    </div>
  </transition>
</template>

<script type="text/ecmascript-6">
  import {formatDate} from '../../js/date'
  export default {
    data(){
      return{
        userinfoshow: false,
        user:[]
      }
    },
    methods:{
      hide(){
        this.userinfoshow = false
      },
      show(){
        this.userinfoshow = true
        this.$axios.get('http://localhost:8083/car/user/getuserinfo').then((response) =>{
          response = response.data
          let status = response.status
          let msg = response.msg
          if (status == 0){
            this.user = response.data
          } else {
            alert(msg)
          }
        })
      }
    },
    filters:{
      format(time) {
        let date = new Date(time)
        return formatDate(date, 'yyyy-MM-dd hh:mm:ss')
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../stylus/mixin.styl"
  .userinfotransition-enter
    transform: translate3d(100%,0,0)
  .userinfotransition-enter-active
    transition: all 0.2s linear
  .userinfotransition-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
  .userinfo
    position: fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 50
    width: 100%
    background: #fff
    overflow hidden
    .title
      position fixed
      top: 0
      left 0
      z-index 50
      width 100%
      padding 10px 0 10px 0
      background-color: rgba(7,17,27,0.1)
      .biaoti
        font-size 19px
        text-align center
      .back
        position absolute
        left 2px
        top: 0px
        z-index 40
        .icon-zuojiantou
          display block
          padding 10px
          font-size 20px
          color black
    .userinfo-content
      padding-top 38px
      .item
        padding-top 20px
        font-size 14px
        padding-left 25px
        position relative
        padding-bottom 21px
        border-1px(rgba(7,17,27,0.1))
        .name,.phone,.time
          position absolute
          top: 20px
          right 15px
      .split
        width: 100%
        height: 16px
        border-top: 1px solid rgba(7,17,27,0.1)
        border-bottom: 1px solid rgba(7,17,27,0.1)
        background: #f3f5f7
</style>
