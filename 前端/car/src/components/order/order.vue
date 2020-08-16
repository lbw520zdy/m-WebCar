<template>
    <div>
      <transition name="ortransistion">
      <div v-show="orderShow" class="order" ref="buy">
        <div class="order-content">
          <div class="image-header">
            <img  :src="car.mainImage">
          </div>
          <div class="name">选择车型：{{car.name}}</div>
          <div class="selectway">取车方式：
            <el-dropdown trigger="click">
          <span class="el-dropdown-link" style="color: black">
            {{hireway}}<i class="el-icon-arrow-down el-icon--right"></i>
          </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item @click.native="switchhireway('到店取车',$event)">到店取车</el-dropdown-item>
                <el-dropdown-item @click.native="switchhireway('上门取车',$event)">上门取车</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
          <div class="hire-where" v-if="daodianorshangmen">
            取车地点：
            <el-cascader
              :options="optionss"
              v-model="selectedOptions"
              @change="handleChange">
            </el-cascader>
          </div>
          <div class="hire-where1"v-else>
            取车地点：
            <el-input
              placeholder="请输入上门地址 市/区/路（街道）"
              v-model="input10" style="width: 270px"
              clearable>
            </el-input>
          </div>
          <div class="returnway">
            还车方式：
            <el-dropdown trigger="click">
          <span class="el-dropdown-link" style="color: black">
            {{returnway}}<i class="el-icon-arrow-down el-icon--right"></i>
          </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item @click.native="switchreturnway('到店还车',$event)">到店还车</el-dropdown-item>
                <el-dropdown-item @click.native="switchreturnway('上门还车',$event)">上门还车</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
          <div class="return-where" v-if="daodianorshangmen1">
            还车地点：
            <el-cascader
              :options="optionss"
              v-model="selectedOptions1"
              @change="handleChange">
            </el-cascader>
          </div>
          <div class="return-where1"v-else>
            还车地点：
            <el-input
              placeholder="请输入上门地址 市/区/路（街道）"
              v-model="input11" style="width: 270px"
              clearable>
            </el-input>
          </div>
          <div class="shuliang">
            数量：
            <el-button type="success" icon="el-icon-minus" @click.stop.prevent="desc" size="medium" circle></el-button>
            <span class="shuliangtext">{{this.shuliang}}</span>
            <el-button type="success" icon="el-icon-plus" @click.stop.prevent="add" size="medium" circle></el-button>
          </div>
          <div class="timelong">
            租车时长：
            <div class="date">
              <el-date-picker
                class="input-class"
                v-model="value1"
                type="date"
                placeholder="选择日期" :picker-options="pickerOptions" @change="selectTime2">
              </el-date-picker>
              <i class="iconfont icon-youjiantou"><div class="tianshu">{{hiredate}}天</div></i>
              <el-date-picker
                class="input-class1"
                v-model="value2"
                type="date"
                placeholder="选择日期" :picker-options="pickerOptions1" @change="selectTime3">
              </el-date-picker>
            </div>
          </div>
          <div class="amount">
            <div class="amount-right">
              <div class="money"><h1 class="totalsay">合计金额：</h1>￥{{total}}元</div>
              <div class="sumitbtn"><el-button type="success" size="medium" :disabled="kean1" @click.stop.prevent="sumitorder($event)">提交订单</el-button></div>
            </div>
          </div>
        </div>
        <div class="title">
          <h1 class="biaoti">确认订单</h1>
          <div class="back" @click="hide"><i class="iconfont icon-zuojiantou"></i></div>
        </div>
      </div>
      </transition>
      <orderdetail :no="no"  ref="qt"></orderdetail>
    </div>
</template>

<script type="text/ecmascript-6">
  import BScroll from 'better-scroll'
  import orderdetail from '../../components/orderdetail/orderdetail'
export default {
  data(){
    let that = this
    return{
      num1:1,
      no: null,
      orderShow: false,
      hireway: this.hirewayi,
      returnway: this.returnwayi,
      input10: this.dazi3,
      input11: this.dazi4,
      value1: this.shijian3,
      value2: this.shijian4,
      pickerOptions: {
        disabledDate(time) {
          if (that.value2 != ''){
            return time.getTime() < Date.now() - 8.64e7 || time.getTime() >= new Date(that.value2).getTime()
          }
          return time.getTime() < Date.now() - 8.64e7
        }
      },
      pickerOptions1: {
        disabledDate(time) {
          return time.getTime() < Date.now() || time.getTime() <= new Date(that.value1).getTime()
        }
      },
      selectedOptions: this.selectedOptions3,
      selectedOptions1: this.selectedOptions4,
      optionss:[{
        value: '广州',
        label: '广州',
        children:[{
          value: '天河区',
          label: '天河区',
          children:[{
            value:'车陂店',
            label:'车陂店'
          }]
        },{
          value: '海珠区',
          label: '海珠区',
          children: [{
            value: '客村店',
            label:'客村店'
          }]
        }
        ]
      },{
        value: '深圳',
        label: '深圳',
        children:[{
          value: '福田区',
          label: '福田区',
          children:[{
            value:'香蜜湖店',
            label:'香蜜湖店'
          }]
        },{
          value: '南山区',
          label: '南山区',
          children: [{
            value: '南山科技园店',
            label:'南山科技园店'
          }]
        }
        ]
      }
      ]
    }
  },
  props:{
    car:{
      type: Object
    },
    selectedOptions3:{
      type: Array,
      default:[]
    },
    selectedOptions4:{
      type: Array,
      default:[]
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
  components:{
    orderdetail
  },
  watch:{
    'selectedOptions3'(newop,oldop){
      this.hireway = '到店取车'
      this.selectedOptions = newop
    },
    'selectedOptions4'(newop,oldop){
      this.returnway = '到店还车'
      this.selectedOptions1 = newop
    },
    'dazi3'(newop,oldop){
      this.hireway = '上门取车'
      this.input10 = newop
    },
    'dazi4'(newop,oldop){
      this.returnway = '上门还车'
      this.input11 = newop
    },
    'shijian3'(newop,oldop){
      this.value1 = newop
    },
    'shijian4'(newop,oldop){
      this.value2 = newop
    },
    'hirewayi'(newop,oldop){
      this.hireway = newop
    },
    'returnwayi'(newop,oldop){
      this.returnway = newop
    }
  },
  computed:{
    daodianorshangmen(){
      if(this.hireway === '到店取车'){
        return true
      }else {
        this.hireway = '上门取车'
        return false
      }
    },
    kean1(){
      if (this.hireway === '到店取车' && this.returnway === '到店还车') {
        if (this.selectedOptions.length === 0 || this.selectedOptions1.length === 0 || this.value1 === '' || this.value2 === ''){
          return true
        }else {
          return false
        }
      }else if (this.hireway === '上门取车' && this.returnway === '到店还车') {
        if (this.input10 === '' || this.selectedOptions1.length === 0 || this.value1 === '' || this.value2 === '') {
          return true
        } else {
          return false
        }
      }else if (this.hireway === '上门取车' && this.returnway === '上门还车') {
          if (this.input10 === '' || this.input11 === '' || this.value1 === '' || this.value2 === '') {
            return true
          } else {
            return false
          }
      }else if (this.hireway === '到店取车' && this.returnway === '上门还车') {
        if (this.selectedOptions.length === 0 || this.input11 === '' || this.value1 === '' || this.value2 === '') {
          return true
        } else {
          return false
        }
      }
    },
    daodianorshangmen1(){
      if(this.returnway === '到店还车'){
        return true
      }else {
        this.returnway = '上门还车'
        return false
      }
    },
    hiredate(){
      return (this.value2 - this.value1)/(24*3600*1000)
    },
    total(){
      return this.car.price * this.hiredate * this.num1
    },
    shuliang(){
      if (this.num1 > this.car.stock){
        return this.car.stock
      }else {
        return this.num1
      }
    }
  },
  methods:{
    show(){
      this.orderShow = true
      this.$nextTick(() =>{
        if (!this.orderscroll) {
          this.orderscroll = new BScroll(this.$refs.buy, {click: true})
        }else {
          this.orderscroll.refresh()
        }
      })
    },
    add(event){
      if (!event._constructed) {
        return
      }
      if (this.car.stock > this.num1) {
        this.num1 = this.num1+1
      }
    },
    desc(event){
      if (!event._constructed) {
        return
      }
      if (this.num1 >1) {
        this.num1 = this.num1-1
      }
    },
    sumitorder(event){
      if (!event._constructed) {
        return
      }
      console.log(555)
      var a
      var b
      var c
      var d
      if (this.hireway === '到店取车' && this.returnway === '到店还车') {
        a = this.selectedOptions[0] + this.selectedOptions[1] + this.selectedOptions[2]
        b = this.selectedOptions1[0] + this.selectedOptions1[1] + this.selectedOptions1[2]
        c = 1
        d = 1
      }else if (this.hireway === '上门取车' && this.returnway === '上门还车') {
        a = this.input10
        b = this.input11
        c = 0
        d = 0
      }else if (this.hireway === '到店取车' && this.returnway === '上门还车') {
        a = this.selectedOptions[0] + this.selectedOptions[1] + this.selectedOptions[2]
        b = this.input11
        c = 1
        d = 0
      }else if (this.hireway === '上门取车'&& this.returnway === '到店还车') {
        a = this.input10
        b = this.selectedOptions1[0] + this.selectedOptions1[1] + this.selectedOptions1[2]
        c = 0
        d = 1
      }
        this.$axios.get('http://localhost:8083/car/order/create',{params: {productId:this.car.id,address:a,address1:b,type1:c,type2:d,quantity:this.num1,duration:this.hiredate}}).then((response) => {
          response = response.data
          let msg = response.msg
          let status = response.status
          if (status == 0){
            let no = response.data.orderNo
            this.no = no
            alert(msg)
            this.$refs.qt.show()
            this.orderShow = false
          } else {
            alert(msg)
          }
        })
    },
    hide(){
      this.orderShow = false
    },
    selectTime2(val){
      this.startdate = val.getTime()
    },
    selectTime3(val){
      this.enddate = val.getTime()
    },
    switchhireway(command,event){
      this.hireway = command
      console.log(this.hireway)
    },
    switchreturnway(command,event){
      this.returnway = command
      console.log(this.returnway)
    },
    handleChange(value) {
      console.log(value)
    },
    handleChange1(value) {
      console.log(value);
    }
  }
}
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../stylus/mixin.styl"
  .order
    position: fixed
    left: 0
    top: 0
    bottom 50px
    z-index: 40
    width: 100%
    background: #fff
    .title
      position fixed
      top: 0
      left 0
      z-index 40
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
    .order-content
      position: relative
      top: 38px
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
      .name
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
      .selectway
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
      .hire-where
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
      .hire-where1
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
      .returnway
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
      .return-where
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
      .return-where1
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
      .shuliang
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
        .shuliangtext
          margin-left 10px
          margin-right 10px
      .timelong
        margin-top 20px
        padding-bottom 20px
        font-size 16px
        border-1px(rgba(7,17,27,0.1))
        .date
          display flex
          margin-top 20px
          margin-left 6px
          margin-right 6px
          .icon-youjiantou
            padding-top 10px
            padding-left 5px
            padding-right 5px
            position relative
            .tianshu
              position absolute
              top: 0px
              left 25px
          .input-class
            width 139px
            flex: 1
          .input-class1
            flex 1
      .amount
        margin-top 10px
        font-size 16px
        position relative
        padding-bottom 50px
        .amount-right
          position absolute
          right 0
          top 0
          .money
            display inline-block
            margin-right 10px
            color orange
            .totalsay
              font-size 18px
              font-weight 800
              color black
              display inline-block
          .sumitbtn
            display inline-block
  .ortransistion-enter
    transform: translate3d(100%,0,0)
  .ortransistion-enter-active
    transition: all 0.2s linear
  .ortransistion-leave-active
    transition: all 0.2s linear
    transform: translate3d(100%,0,0)
</style>
