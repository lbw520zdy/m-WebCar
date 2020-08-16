<template>
  <transition name="orderdetailtransition">
    <div class="orderdetail" v-show="orderdetailshow" ref="hg">
      <div class="orderdetail-content">
        <div class="zidongguanbi">
          <div class="left">
            <div class="desc">等待租家付款</div>
            <div class="sj">剩{{time}}分自动关闭</div>
          </div>
          <div class="right">
            <i class="iconfont icon-zhifu"></i>
          </div>
        </div>
        <div class="dizi">
          <div class="weizitubiao"><i class="iconfont icon-weizhi"></i></div>
          <div class="bigdizi">
            <div class="quche"><span v-if="orderxianxi.type1 === 0">上门取车：</span><span v-else>到店取车：</span><span>{{orderxianxi.address}}</span></div>
            <div class="huanche"><span v-if="orderxianxi.type2 === 0">上门还车：</span><span v-else>到店还车：</span><span>{{orderxianxi.address1}}</span></div>
          </div>
        </div>
        <div class="line"></div>
        <div class="cardetail">
          <div class="carimg">
            <img width="100%" height="" :src="orderitem.productImage"  />
          </div>
          <div class="carname">商品名称：{{orderxianxi.productName}}</div>
          <div class="carname">商品单价：￥{{orderitem.currentUnitPrice}}</div>
          <div class="carname">商品数量：{{orderitem.quantity}}</div>
          <div class="carname">商品天数：{{orderitem.duration}}</div>
          <div class="carname">订单总价：￥{{orderitem.totalPrice}}</div>
          <div class="carname">实付款：￥{{orderitem.totalPrice}}</div>
        </div>
        <div class="line"></div>
        <div class="xinxi">
          <div class="carname">订单编号：{{orderitem.orderNo}}</div>
          <div class="carname">创建时间：{{orderitem.createTime | format}}</div>
        </div>
        <div class="allbutton">
          <div class="button1" v-if="orderxianxi.orderStatus == 0" @click.stop.prevent="quxiao($event)"><el-button type="warning" round>取消订单</el-button></div>
          <div class="button2" v-if="orderxianxi.orderStatus  == 0" @click.stop.prevent="fukuang($event)"><el-button type="success" round>付款</el-button></div>
          <div class="button3" v-if="orderxianxi.orderStatus != 0" @click.stop.prevent="deleteorder($event)"><el-button type="warning" round>删除订单</el-button></div>
        </div>
      </div>
      <div class="title">
        <h1 class="biaoti">订单详情</h1>
        <div class="back" @click.stop.prevent="hide($event)"><i class="iconfont icon-zuojiantou"></i></div>
      </div>
    </div>
  </transition>
</template>

<script type="text/ecmascript-6">
  import {formatDate} from '../../js/date'
  import BScroll from 'better-scroll'
  export default {
    data(){
      return{
        orderdetailshow: false,
        orderxianxi:[],
        orderitem:[],
        time: 30,
        t1: ''
      }
    },
    props:{
      no:{
      }
    },
    created() {
      this.t1 = setInterval(this.dec,60000)
    },
    methods:{
      hide(event){
        if (!event._constructed) {
          return
        }
        this.orderdetailshow = false
      },
      dec() {
        this.time = this.time - 1
        console.log(this.time)
        if (this.time == 0)  {
          this.$nextTick(() => {
            this.$axios.get('http://localhost:8083/car/order/cancel',{params:{orderNo:this.no}}).then((response) =>{
              response = response.data
              let msg = response.msg
              let status = response.status
              if (status == 0) {
                this.orderxianxi.orderStatus = 2
                alert(msg)
              }else {
                alert(msg)
              }
              clearInterval(this.ti)
            })
          })
        }
      },
      deleteorder(event){
        if (!event._constructed) {
          return
        }
        this.$axios.get('http://localhost:8083/car/order/delete',{params:{orderNo:this.no}}).then((response) =>{
          response = response.data
          let msg = response.msg
          let status = response.status
          if (status == 0){
            alert(msg)
            this.orderdetailshow = false
          } else {
            alert(msg)
          }
        })
      },
      fukuang(event){
        if (!event._constructed) {
          return
        }
        this.$axios.get('http://localhost:8083/car/order/finish',{params:{orderNo:this.no}}).then((response) => {
          response = response.data
          let msg = response.msg
          let status = response.status
          if (status == 0){
            alert(msg)
            this.orderdetailshow = false
          } else {
            alert(msg)
          }
        })
      },
      show(){
        this.orderdetailshow = true
        this.$nextTick(() =>{
          this.$axios.get('http://localhost:8083/car/order/detail',{params:{orderNo:this.no}}).then((reponse) =>{
            reponse = reponse.data
            this.orderxianxi = reponse.data
            this.orderitem = reponse.data.carOrderItem
          })
          if (!this.orderdetailscroll) {
            this.orderdetailscroll = new BScroll(this.$refs.hg, {click: true})
          }else {
            this.orderdetailscroll.refresh()
          }
        })
      },
      quxiao(event){
        if (!event._constructed) {
          return
        }
        console.log(1111)
        this.$nextTick(() => {
          this.$axios.get('http://localhost:8083/car/order/cancel',{params:{orderNo:this.no}}).then((response) =>{
            response = response.data
            let msg = response.msg
            let status = response.status
            if (status == 0) {
              this.orderxianxi.orderStatus = 2
              alert(msg)
            }else {
              alert(msg)
            }
          })
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
  .orderdetailtransition-enter
    transform: translate3d(100%,0,0)
  .orderdetailtransition-enter-active
    transition: all 0.2s linear
  .orderdetailtransition-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
  .orderdetail
    position: fixed
    left: 0
    top: 38px
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
      background-color: rgb(144,144,144)
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
    .orderdetail-content
      position: relative
      top: 38px
      .zidongguanbi
        color: white
        width 100%
        height 100px
        background-color #ff6800
        position relative
        .left
          position absolute
          top: 30px
          left: 50px
          .desc
            margin-bottom 5px
          .sj
            font-size 12px
        .right
          position absolute
          top: 30px
          right 20px
          .icon-zhifu
            font-size 40px
      .dizi
        padding-left 20px
        padding-top 20px
        padding-bottom 20px
        .weizitubiao
          display inline-block
          vertical-align top
          .icon-weizhi
            font-size 35px
            color: #ff6800
        .bigdizi
          font-size 14px
          display inline-block
          vertical-align top
          .quche
            margin-bottom 5px
      .line
        width: 100%
        height: 16px
        border-top: 1px solid rgba(7,17,27,0.1)
        border-bottom: 1px solid rgba(7,17,27,0.1)
        background: #f3f5f7
      .cardetail
        margin-top 20px
        .carimg
          margin-right 10px
          margin-left 10px
          display inline-block
          vertical-align top
          img
            border-radius: 5px
        .carname
          margin-top 10px
          margin-left 20px
          padding-bottom 10px
          border-1px(rgba(7,17,27,0.1))
      .xinxi
        margin-top 20px
        .carname
          margin-top 10px
          margin-left 20px
          padding-bottom 20px
          border-1px(rgba(7,17,27,0.1))
      .allbutton
        margin-top 20px
        padding-bottom 20px
        padding-left 220px
        .button1
          display inline-block
          vertical-align top
        .button2
          display inline-block
          vertical-align top
        .button3
          padding-left 80px
          display inline-block
          vertical-align top
</style>
