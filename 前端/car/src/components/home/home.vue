<template>
  <div class="father-home" ref="qw">
    <div class="min">
    <div>
      <el-carousel height="100px">
        <el-carousel-item v-for="item in images" :key="item">
          <img :src="item" width="100%" height="100%">
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="select">
      <div class="buy-select">
        <div class="shangjiantou" :class="{'mar': value3 == false}"><i class="iconfont icon-xiangshangjiantou"></i></div>
        <div class="list" :class="{'mar': value3 == false}">
          租车地址
        </div>
        <div class="dizi" v-if="value3"><input placeholder="请输入上门地址" size="13" v-model="shangmenquchedizi"/></div>
        <div class="dizi11" v-else><el-cascader style="width: 125px" size="mini"
          :options="optionss"
          v-model="selectedOptions1"
          @change="handleChange">
        </el-cascader>
        </div>
        <div class="kaiguan" :class="{'mar': value3 == false}">
          <el-switch
            v-model="value3"
            active-text="上门"
            inactive-text="到店">
          </el-switch>
        </div>
      </div>
      <div class="line"></div>
      <div class="return-select">
        <div class="xiajiangtou" :class="{'mar': value4 == false}"><i class="iconfont icon-xiangxiajiantoux"></i></div>
        <div class="list1" :class="{'mar': value4 == false}">
          还车地址
        </div>
        <div class="dizi1" v-if="value4"><input placeholder="请输入上门地址" size="13" v-model="shangmenhuanchedizi"  /></div>
        <div class="dizi2" v-else>
          <el-cascader style="width: 125px" size="mini"
                       :options="optionss"
                       v-model="selectedOptions2"
                       @change="handleChange1">
          </el-cascader>
        </div>
        <div class="kaiguan1" :class="{'mar': value4 == false}">
          <el-switch
            v-model="value4"
            active-text="上门"
            inactive-text="到店">
          </el-switch>
        </div>
      </div>
      <div class="line1"></div>
    </div>
    <div class="date">
      <el-date-picker
        class="input-class"
        v-model="value1"
        type="date"
        placeholder="选择日期" :picker-options="pickerOptions" @change="selectTime">
      </el-date-picker>
      <i class="iconfont icon-youjiantou"><div class="tianshu">{{hiredate}}天</div></i>
      <el-date-picker
        class="input-class1"
        v-model="value2"
        type="date"
        placeholder="选择日期" :picker-options="pickerOptions1" @change="selectTime1">
      </el-date-picker>
    </div>
    <div class="line2"></div>
    <div class="hire-button" @click="go">
      <el-button type="success" style="width: 100%" :disabled="kean">立即租车</el-button>
    </div>
    <div class="recommend">
      <div class="recommend-name">车型推荐</div>
      <div class="recommend-car">
        <div class="left-car" @click="selectFood(1,$event)">
          <img width="153" height="116" src="https://ae01.alicdn.com/kf/H458e43b449594d9dad41191cd409ea13W.jpg"/>
          <div class="left-car-name">奥迪A3<span class="left-car-price">￥150</span>/日</div>
        </div>
        <div class="right-car" @click="selectFood(3,$event)">
          <img width="153" height="116" src="https://ae01.alicdn.com/kf/Hfffd7e42ae5c441f8f71c56cdac39ea7k.jpg"/>
          <div class="right-car-name">保时捷帕纳梅拉<span class="right-car-price">￥250</span>/日</div>
        </div>
      </div>
    </div>
    </div>
    <cardetail :car="selectedCar" ref="car"></cardetail>
  </div>
</template>

<script type="text/ecmascript-6">
  import BScroll from 'better-scroll'
  import {Dropdowm,Carousel,Switch,DatePicker} from 'iview'
  import cardetail from '../../components/cardetail/cardetail'
  import order from '../../components/order/order'

  export default {
    data() {
      let that = this
      return {
        images: ["https://fimg.zuchecdn.com/upload/web/HomePage/HeadFigure/2018/2560x500-YZTH-20181116-web.jpg", "https://fimg.zuchecdn.com/upload/web/HomePage/HeadFigure/2018/2560-500-shouri0-181108-web.jpg", "https://fimg.zuchecdn.com/upload/web/HomePage/HeadFigure/2018/2560-500-mian2-20180824-WEB.jpg", "https://fimg.zuchecdn.com/upload/web/HomePage/HeadFigure/2018/2560-500-YX-20180821-WEB.jpg"],
        value3: false,
        value4: false,
        shangmenquchedizi:'',
        shangmenhuanchedizi:'',
        startdate: '',
        enddate: '',
        value1: '',
        value2: '',
        cars:[],
        way3:'',
        way4:'',
        selectedCar:{},
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
        ],
        selectedOptions1: [],
        selectedOptions2: [],
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
        }
      }
      },
    created(){
        this.$nextTick(() => {
          this._initScroll()
        })
    },
    methods: {
      selectTime(val){
        this.startdate = val.getTime()
      },
      selectTime1(val){
        this.enddate = val.getTime()
      },
      go(){
        if (this.value3 == true){
          this.way3 = '上门取车'
        }else {
          this.way3 = '到店取车'
        }
        if (this.value4 == true){
          this.way4 = '上门还车'
        } else {
          this.way4 = '到店还车'
        }
        this.$emit('way1',this.way3)
        this.$emit('way2',this.way4)
        this.$emit('shuru2',this.shangmenhuanchedizi)
        this.$emit('shuru1',this.shangmenquchedizi)
        this.$emit('doorhiredizi',this.selectedOptions1)
        this.$emit('doorreturndizi',this.selectedOptions2)
        this.$emit('shijian1',this.startdate)
        this.$emit('shijian2',this.enddate)
        this.$router.push({path: '/hire'})
      },
      _initScroll(){
        this.homeScroll = new BScroll(this.$refs.qw, {click: true})
      },
      selectFood(carid,event){
        if (!event._constructed) {
          return
        }
        this.$nextTick(() => {
          this.$http.get('http://localhost:8083/car/product/detail',{params: {productId:carid}}).then((response) => {
            response = response.body
            this.selectedCar = response.data
          })
          this.$refs.car.show()
        })
      },
      handleChange(value) {
        console.log(this.selectedOptions1)
      },
      handleChange1(value) {
        console.log(value)
      }
      },
    computed: {
      hiredate(){
        return (this.enddate - this.startdate)/(24*3600*1000)
      },
      kean(){
        if (this.value3 == true && this.value4 == true){
          if (this.shangmenhuanchedizi != ''&& this.shangmenquchedizi != '' && this.startdate != '' && this.enddate !=''  ) {
            return false
          }else {
            return true
          }
        }if (this.value3 == true && this.value4 == false) {
          if (this.startdate != '' && this.enddate !=''&& this.shangmenquchedizi != '' && this.selectedOptions2.length > 0) {
            return false
          }else {
            return true
          }
        }if (this.value3 == false && this.value4 == true){
          if (this.startdate != '' && this.enddate !=''&& this.shangmenhuanchedizi != '' && this.selectedOptions1.length > 0){
            return false
          }else {
            return true
          }
        } if (this.value3 == false && this.value4 == false){
          if (this.startdate != '' && this.enddate !=''&& this.selectedOptions1.length > 0 && this.selectedOptions2.length > 0) {
            return false
          }else {
            return true
          }
        }
      }
    },
    components:{
      cardetail,
      order
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
.father-home
  overflow hidden
  position: absolute
  top: 125px
  bottom:51px
  width 100%
  .min
    min-height 100%
    .el-carousel__item img {
      color: #475669;
      font-size: 14px;
      opacity: 0.75;
      line-height: 150px;
      margin: 0;
    }
    .el-carousel__item:nth-child(2n) {
      background-color: #99a9bf;
    }

    .el-carousel__item:nth-child(2n+1) {
      background-color: #d3dce6;
    }
    .select
      margin-top 15px
      margin-left: 15px
      margin-right: 15px
      .buy-select
        position: relative
        margin-bottom 15px
        .shangjiantou
          display inline-block
          vertical-align top
          margin-right 3px
          &.mar
            margin-top 6px
          .icon-xiangshangjiantou
            color black
        .list
          display inline-block
          vertical-align top
          margin-right 10px
          &.mar
            margin-top 6px
        .dizi
          display inline-block
          vertical-align top
        .dizi11
          display inline-block
          vertical-align top
        .kaiguan
          position absolute
          right 0px
          top 0px
          &.mar
            margin-top 4px
      .line
        margin-left: 22px
        border-bottom: 1px solid rgba(7,17,27,0.2)
      .return-select
        position relative
        margin-top 15px
        .xiajiangtou
          display inline-block
          vertical-align top
          margin-right 3px
          &.mar
            margin-top 6px
        .list1
          display inline-block
          vertical-align top
          margin-right 10px
          &.mar
            margin-top 6px
        .dizi1
          display inline-block
          vertical-align top
        .dizi2
          display inline-block
          vertical-align top
        .kaiguan1
          position absolute
          right 0px
          top 0px
          &.mar
            margin-top 4px
      .line1
        margin-top 15px
        margin-left: 22px
        border-bottom: 1px solid rgba(7,17,27,0.2)
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
          left 30px
      .input-class
        width 139px
        flex: 1
      .input-class1
        flex 1
    .line2
      margin-top 20px
      margin-left: 34px
      margin-right 31px
      border-bottom: 1px solid rgba(7,17,27,0.2)
    .hire-button
      width: 85%
      margin-top 20px
      margin-left auto
      margin-right auto
      text-align center
    .recommend
      margin-top 25px
      margin-left 18px
      padding-bottom 20px
      .recommend-name
        font-size 16px
        font-weight bold
        margin-bottom 15px
      .recommend-car
        display flex
        .left-car
          flex 1
          display inline-block
          vertical-align top
          width 153px
          height 150px
          margin-right 15px
          .left-car-name
            margin-top 10px
            .left-car-price
              color orange
        .right-car
          flex 1
          display inline-block
          vertical-align top
          width 179px
          height 150px
          .right-car-name
            margin-top 10px
            .right-car-price
              color orange
</style>
