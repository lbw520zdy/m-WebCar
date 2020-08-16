<template>
  <div class="cars">
    <div class="menu-wrapper" ref="ab">
      <ul>
        <li v-for="(item,index) in cars" class="menu-item" :class="{'current': currentIndex === index}" @click="selectMenu(index,$event)">
            <span class="text">
            <i class="iconfont icon-qiche"></i>
              {{item.categoryName}}
            </span>
        </li>
      </ul>
    </div>
    <div class="cars-wrapper" ref="bc">
      <ul>
        <li v-for="(item,index) in cars" class="food-list-hook">
          <h1 class="title">{{item.categoryName}}</h1>
          <ul>
            <li @click="selectFood(car.id,$event)" v-for="(car,index) in item.productInfoVOList" class="cars-item border-1px">
              <div class="icon">
                <img width="92" height="70" :src="car.mainImage"/>
              </div>
              <div class="content">
                <h2 class="name">{{car.name}}</h2>
                <p class="desc">{{car.descrition}}</p>
                <div class="price">￥{{car.price}}/日</div>
                <i class="iconfont icon-dingdan" @click.stop.prevent="selectOrder(car.id,$event)"></i>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <cardetail :car="selectedCar" ref="car" :selectedOptions3="selectedOptions1" :selectedOptions4="selectedOptions2" :dazi3="dazi1" :dazi4="dazi2" :shijian3="shijian1" :shijian4="shijian2" :hirewayi="hireway" :returnwayi="returnway"></cardetail>
    <order :car="selectedOrder" ref="or" :selectedOptions3="selectedOptions1" :selectedOptions4="selectedOptions2" :dazi3="dazi1" :dazi4="dazi2" :shijian3="shijian1" :shijian4="shijian2" :hirewayi="hireway" :returnwayi="returnway"></order>
  </div>
</template>

<script type="text/ecmascript-6">
  import BScroll from 'better-scroll'
  import cardetail from '../../components/cardetail/cardetail'
  import order from '../../components/order/order'
export default {
  data(){
    return{
      cars:[],
      listHeight: [],
      scrollY: 0,
      selectedCar:{},
      selectedOrder:{}
    }
  },
  props:{
    selectedOptions1:{
      type: Array,
      default:[]
    },
    selectedOptions2:{
      type: Array,
      default:[]
    },
    dazi1:{
      type: String,
      default: ''
    },
    dazi2:{
      type: String,
      default: ''
    },
    shijian1:{
      default: ''
    },
    shijian2:{
      default: ''
    },
    hireway:{
      default:''
    },
    returnway:{
      default:''
    }
  },
  created() {
    this.$axios.get('http://localhost:8083/car/product/list').then((response) => {
      response = response.data
      this.cars = response.data
      this.$nextTick(() => {
        this._initScroll()
        this._calculateHeight()
      })
    })
  },
  methods: {
    _initScroll() {
      this.menuScroll = new BScroll(this.$refs.ab, {click: true})
      this.carsScroll = new BScroll(this.$refs.bc, {click: true,probeType: 3})
      this.carsScroll.on('scroll',(pos)=>{
        this.scrollY = Math.abs(Math.round(pos.y))
      })
    },
    _calculateHeight() {
      let foodList = this.$refs.bc.getElementsByClassName('food-list-hook')
      let height = 0
      this.listHeight.push(height)
      for (let i = 0; i < foodList.length; i++) {
        let item = foodList[i]
        height += item.clientHeight
        this.listHeight.push(height)
      }
    },
    selectMenu(index, event) {
      if (!event._constructed) {
        return
      }
      let foodList = this.$refs.bc.getElementsByClassName('food-list-hook')
      let el = foodList[index]
      this.carsScroll.scrollToElement(el, 300)
    },
    selectFood(carid,event){
      if (!event._constructed) {
        return
      }
      this.$nextTick(() => {
        this.$axios.get('http://localhost:8083/car/product/detail',{params:{productId:carid}}).then((response) => {
          response = response.data
          this.selectedCar = response.data
        })
        this.$refs.car.show()
      })
    },
    selectOrder(carid,event){
      if (!event._constructed) {
        return
      }
      this.$nextTick(() => {
        this.$axios.get('http://localhost:8083/car/product/detail',{params:{productId:carid}}).then((response) => {
          response = response.data
          this.selectedOrder = response.data
        })
        this.$refs.or.show()
      })
    }
  },
  computed: {
    currentIndex(){
      for (let i = 0; i < this.listHeight.length; i++) {
        let height1 = this.listHeight[i]
        let height2 = this.listHeight[i + 1]
        if (!height2 || (this.scrollY >= height1 && this.scrollY < height2)) {
          return i
        }
      }
      return 0
    }
  },
  components:{
    cardetail,
    order
  }
}
</script>

<style lang="stylus" rel="stylesheet/stylus">
  @import "../../stylus/mixin.styl"
  .cars
    display: flex
    position: absolute
    top: 126px
    bottom:51px
    width: 100%
    overflow: hidden
    .menu-wrapper
      flex: 0 0 80px
      width: 80px
      background: #f3f5f7
      .menu-item
        display: table
        height: 54px
        width: 56px
        padding: 0 12px
        line-height: 14px
        &.current
          position: relative
          z-index: 10
          margin-top: -1px
          background: #fff
          font-weight: 700
        .text
          display: table-cell
          width: 56px
          vertical-align: middle
          font-size: 12px
          position: relative
          &:after
            display: block
            position: absolute
            left: 0
            bottom: 0
            width: 100%
            border-top: 1px solid rgba(7,17,27,0.1)
            content: ''
    .cars-wrapper
      flex: 1
      .title
        padding-left: 14px
        height: 26px
        line-height: 26px
        border-left: 2px solid #d9dde1
        font-size: 12px
        color: rgb(147,153,159)
        background: #f3f5f7
      .cars-item
        display: flex
        margin: 18px
        padding-bottom: 18px
        border-1px(rgba(7,17,27,0.1))
        &:last-child
          border-none()
          margin-bottom 0
        .icon
          flex:0 0 92px
          margin-right: 10px
        .content
          flex 1
          .name
            margin: 2px 0 8px 0
            height  14px
            line-height: 14px
            font-size: 14px
            color: rgb(7,17,27)
          .desc
            line-height: 10px
            font-size: 10px
            color: rgb(147,153,159)
            line-height: 12px
            margin-bottom: 8px
          .price
            font-weight: 700
            line-height: 24px
            color orange
          .icon-dingdan
            position absolute
            font-size 24px
            right 0
            bottom 15px
</style>
