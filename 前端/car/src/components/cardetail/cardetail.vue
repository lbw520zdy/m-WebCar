<template>
  <transition name="move">
    <div v-show="showFlag" class="car" ref="eat">
      <div class="car-content">
        <div class="image-header">
          <img  :src="car.mainImage">
        </div>
        <div class="content">
          <h1 class="title">{{car.name}}</h1>
          <div class="price">￥{{car.price}}/日</div>
          <i class="iconfont icon-dingdan" @click.stop.prevent="showorder($event)"></i>
        </div>
        <div class="split"></div>
        <div class="info">
          <h1 class="title">商品信息</h1>
          <p class="text">{{car.descrition}}</p>
        </div>
        <div class="split1"></div>
        <div class="carDetailImage">
          <h1 class="title1">商品详情</h1>
          <div class="pic-wrapper" ref="picul">
            <div class="imagebig"ref="piclist">
              <div class="image1"><img width="122" height="93" :src="car.detailImage1" preview="1"/></div>
              <div class="image2"><img width="122" height="93" :src="car.detailImage2" preview="1"/></div>
              <div class="image3"><img width="122" height="93" :src="car.detailImage3" preview="1"/></div>
            </div>
          </div>
        </div>
      </div>
      <div class="back" @click="hide"><i class="iconfont icon-zuojiantou"></i></div>
      <order ref="od" :car="car" :selectedOptions3="selectedOptions3" :selectedOptions4="selectedOptions4" :dazi3="dazi3" :dazi4="dazi4" :shijian3="shijian3" :shijian4="shijian4" :hirewayi="hirewayi" :returnwayi="returnwayi"></order>
    </div>
  </transition>
</template>

<script type="text/ecmascript-6">
  import BScroll from 'better-scroll'
  import order from '../../components/order/order'
  export default {
    props: {
      car:{
        type: Object
      },
      selectedOptions3:{
        type: Array,
        default:()=>[]
      },
      selectedOptions4:{
        type: Array,
        default:()=>[]
      },
      dazi3:{
        default: ''
      },
      dazi4:{
        default: ''
      },
      shijian3:{
        default: ''
      },
      shijian4:{
        default: ''
      },
      hirewayi:{
        default:''
      },
      returnwayi:{
        default:''
      }
    },
    watch:{
      'car'(){
        this._initPics()
      }
    },
    data(){
      return{
        showFlag: false
      }
    },
    components:{
      order
    },
    methods:{
      show(){
        this.showFlag = true
        this.$nextTick(() =>{
          if (!this.scroll) {
            this.scroll = new BScroll(this.$refs.eat, {click: true})
          }else {
            this.scroll.refresh()
          }
        })
      },
      hide(){
        this.showFlag = false
      },
      showorder(event){
        if (!event._constructed) {
          return
        }
        this.$refs.od.show()
      },
      _initPics() {
        if (this.car) {
          let picWidth = 122
          let margin = 6
          let width = (picWidth + margin) * 3 - margin
          this.$refs.piclist.style.width = width + 'px'
          this.$nextTick(() => {
            if (!this.picScroll) {
              this.picScroll = new BScroll(this.$refs.picul, { scrollX: true }, {eventPassthrough: 'vertical'})
            } else {
              this.picScroll.refresh()
            }
          })
        }
      }
    }
  }

</script>

<style lang="stylus" rel="stylesheet/stylus">
  .car
    position: fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 30
    width: 100%
    background: #fff
    .back
      position fixed
      left 0
      top: 10px
      z-index 30
      .icon-zuojiantou
        display block
        padding 10px
        font-size 20px
        color white
    .car-content
      .image-header
        position: relative
        width 100%
        height 0
        padding-top 75%
        img
          position: absolute
          top: 0
          left: 0
          width: 100%
          height 100%
      .content
        padding: 18px
        position: relative
        .title
          line-height: 14px
          margin-bottom: 8px
          font-size: 14px
          font-weight: 700
          color: rgb(7,17,27)
        .price
          font-weight: 700
          font-size 14px
          line-height: 24px
          color orange
          margin-top 25px
        .icon-dingdan
          position absolute
          font-size 24px
          right 12px
          bottom 18px
      .split
        width: 100%
        height: 16px
        border-top: 1px solid rgba(7,17,27,0.1)
        border-bottom: 1px solid rgba(7,17,27,0.1)
        background: #f3f5f7
      .info
        padding 18px
        .title
          line-height: 14px
          margin-bottom: 6px
          font-size: 14px
          color: rgb(7,17,27)
        .text
          line-height: 24px
          padding: 0 8px
          font-size: 12px
          color: rgb(77,85,93)
      .split1
        width: 100%
        height: 16px
        border-top: 1px solid rgba(7,17,27,0.1)
        border-bottom: 1px solid rgba(7,17,27,0.1)
        background: #f3f5f7
      .carDetailImage
        padding 18px
        .title1
          line-height: 14px
          margin-bottom: 10px
          font-size: 14px
          color: rgb(7,17,27)
        .pic-wrapper
          width: 100%
          overflow: hidden
          white-space: nowrap
          .imagebig
            display: flex
            padding 0 8px
            .image1
              flex 1
              margin-right 6px
            .image2
              flex: 1
              margin-right 6px
            .image3
              flex 1
  .move-enter
    transform: translate3d(100%,0,0)
  .move-enter-active
    transition: all 0.2s linear
  .move-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
</style>
