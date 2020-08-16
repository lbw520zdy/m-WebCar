<template>
  <transition name="orderlisttransition">
    <div class="orderlist" v-show="orlistshow" ref="ty">
      <div class="orderlist-content">
        <ul v-for="(item,index) in orderlist">
          <li v-if="item.carOrderItem" class="order-item">
            <div class="picture">
              <img width="120" height="91" :src="item.carOrderItem.productImage"/>
            </div>
            <div class="content">
              <h2 class="name">{{item.carOrderItem.productName}}</h2>
              <div class="tianshu">{{item.carOrderItem.duration}}天</div>
              <div class="orderstatus" v-show="item.orderStatus == 0">待支付</div>
              <div class="orderstatus" v-show="item.orderStatus == 1">已支付</div>
              <div class="orderstatus" v-show="item.orderStatus == 2">已取消</div>
            </div>
            <div class="danjia">￥{{item.carOrderItem.currentUnitPrice}}</div>
            <div class="shuliang">x{{item.carOrderItem.quantity}}</div>
            <div class="jisuan">￥{{item.carOrderItem.currentUnitPrice}}x{{item.carOrderItem.quantity}}x{{item.carOrderItem.duration}}</div>
            <div class="shuliangqiandesc"><span class="shuliangdesc">共{{item.carOrderItem.quantity}}商品</span>    <span class="heji">合计：</span><span class="totalmoney">￥{{item.payment}}.00</span></div>
            <div class="allanniu">
              <el-button round size="mini"v-if="item.orderStatus == 0" @click.stop.prevent="quxiao1($event,index,item.orderNo)">取消订单</el-button>
              <el-button round size="mini" v-if="item.orderStatus == 1" @click.stop.prevent="zaicibuy($event)">再次租借</el-button>
              <el-button round size="mini"v-if="item.orderStatus == 2" @click.stop.prevent="deleteorder1($event,index,item.orderNo)">删除订单</el-button>
              <el-button round size="mini" v-if="item.orderStatus == 0" style="color: orange" @click.stop.prevent="fukuang1($event,index,item.orderNo)">付款</el-button>
            </div>
          </li>
        </ul>
      </div>
      <div class="title">
        <h1 class="biaoti">我的订单</h1>
        <div class="back" @click.stop.prevent="hide($event)"><i class="iconfont icon-zuojiantou"></i></div>
      </div>
    </div>
  </transition>
</template>

<script type="text/ecmascript-6">
  import BScroll from 'better-scroll'
  export default {
    data(){
      return{
        orlistshow: false,
        orderlist:[],
        orderitems:[],
        productName:''
      }
    },
    methods:{
      show(){
        this.orlistshow = true
            this.$nextTick(() =>{
              this.$axios.get('http://localhost:8083/car/order/list').then((response) =>{
                response = response.data
                let a = response.status
                let msg = response.msg
                if (a == 0){
                  this.orderlist = response.data
                }else {
                  this.orderlist = []
                  alert(msg)
                }
            })
              if (!this.orderlistscroll) {
                this.orderlistscroll = new BScroll(this.$refs.ty, {click: true})
              }else {
                this.orderlistscroll.refresh()
              }
        })

      },
      hide(){
        if (!event._constructed) {
          return
        }
        this.orlistshow = false
      },
      quxiao1(event,index,no){
        if (!event._constructed) {
          return
        }
        this.$nextTick(() => {
          this.$axios.get('http://localhost:8083/car/order/cancel',{params:{orderNo:no}}).then((response) =>{
            response = response.data
            let msg = response.msg
            let status = response.status
            if (status == 0) {
              this.orderlist[index].orderStatus = 2
              alert(msg)
            }else {
              alert(msg)
            }
          })
        })
      },
      deleteorder1(event,index,no){
        if (!event._constructed) {
          return
        }
        this.$axios.get('http://localhost:8083/car/order/delete',{params:{orderNo:no}}).then((response) =>{
          response = response.data
          let msg = response.msg
          let status = response.status
          if (status == 0){
            alert(msg)
            this.orderlist[index].carOrderItem = null
          } else {
            alert(msg)
          }
        })
      },
      fukuang1(event,index,no){
        if (!event._constructed) {
          return
        }
        this.$axios.get('http://localhost:8083/car/order/finish',{params:{orderNo:no}}).then((response) => {
          response = response.data
          let msg = response.msg
          let status = response.status
          if (status == 0){
            alert(msg)
            this.orderlist[index].orderStatus = 1
          } else {
            alert(msg)
          }
        })
      },
      zaicibuy(event){
        if (!event._constructed) {
          return
        }
        this.$router.push({path: '/hire'})
        this.orlistshow = false
      }
    },
    created(){
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .orderlisttransition-enter
    transform: translate3d(100%,0,0)
  .orderlisttransition-enter-active
    transition: all 0.2s linear
  .orderlisttransition-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
  .orderlist
    position: fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 50
    width: 100%
    background: whitesmoke
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
    .orderlist-content
      padding-top 40px
      .order-item
        position relative
        display: flex
        margin: 20px
        border-radius 5px
        padding 20px 20px 90px 20px
        background-color: white
        &:last-child
          border-none()
          margin-bottom 0
        .picture
          flex:0 0 92px
          margin-right: 10px
        .content
          flex 1
          .name
            margin: 2px 0 24px 0
            height  14px
            line-height: 14px
            font-size: 14px
            color: rgb(7,17,27)
          .tianshu
            font-size 14px
            color: rgba(7,17,27,0.5)
          .orderstatus
            margin-top 20px
            color red
        .danjia
          color orange
          font-weight 500
          font-size 14px
        .shuliang
          position absolute
          top: 42px
          right 20px
          color rgba(7,17,27,0.5)
          font-size 14px
        .jisuan
          position absolute
          top 97px
          right 20px
          color rgba(7,17,27,0.5)
          font-size 14px
        .shuliangqiandesc
          position absolute
          bottom 60px
          right 20px
          .shuliangdesc
            font-size 14px
          .heji
            font-size 14px
          .totalmoney
            font-size 16px
            font-weight 500
        .allanniu
          position absolute
          bottom 10px
          right 20px
</style>
