<template>
  <transition name="shezhitransition">
    <div class="shezhi" v-show="shezhishow" ref="sz">
      <div class="shezhi-content">
        <ul>
          <li class="item" @click="xiugai">修改密码<i class="iconfont icon-xiayiye"></i></li>
          <div class="split"></div>
          <li class="item">关于<i class="iconfont icon-xiayiye"></i></li>
          <li class="item">隐私<i class="iconfont icon-xiayiye"></i></li>
          <div class="split"></div>
          <li class="item">设置支付密码<i class="iconfont icon-xiayiye"></i></li>
        </ul>
      </div>
      <div class="title">
        <h1 class="biaoti">设置</h1>
        <div class="back" @click.stop.prevent="hide($event)"><i class="iconfont icon-zuojiantou"></i></div>
      </div>
      <div class="tuichu" @click="tuichu">退出登录</div>
      <rewritepassword ref="hj"></rewritepassword>
    </div>
  </transition>
</template>

<script type="text/ecmascript-6">
  import rewritepassword from '../../components/rewritepassword/rewritepassword'
  export default {
    data(){
      return{
        shezhishow: false
      }
    },
    components:{
      rewritepassword
    },
    methods:{
      hide(){
        this.shezhishow = false
      },
      show(){
        this.shezhishow = true
      },
      xiugai(){
        this.$refs.hj.show()
      },
      tuichu(){
        this.$axios.post('http://localhost:8083/car/user/logout').then((response) => {
          response = response.data
          let status = response.status
          let msg = response.msg
          if (status == 0){
            this.$emit('gaibian','')
            this.shezhishow = false
            alert(msg)
          } else {
            alert(msg)
          }
        })
      },
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../stylus/mixin.styl"
  .shezhitransition-enter
    transform: translate3d(100%,0,0)
  .shezhitransition-enter-active
    transition: all 0.2s linear
  .shezhitransition-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
  .shezhi
    position: fixed
    left: 0
    top: 0
    bottom 0
    z-index: 50
    width: 100%
    background: #fff
    overflow hidden
    .tuichu
      margin-left 20px
      width 90%
      padding-top 10px
      padding-bottom 10px
      text-align center
      position fixed
      left 0
      bottom: 70px
      z-index 50
      color white
      background-color orange
      border-radius 5px
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
    .shezhi-content
      padding-top 38px
      .item
        padding-top 20px
        font-size 14px
        padding-left 25px
        position relative
        padding-bottom 21px
        border-1px(rgba(7,17,27,0.1))
        .icon-xiayiye
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
