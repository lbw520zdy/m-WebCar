<template>
  <div>
    <v-header></v-header>
    <keep-alive>
      <router-view @doorhiredizi="hiredizi" @doorreturndizi="returndizi" @shuru1="fathershuru1" @shuru2="fathershuru2" @shijian1="fathertime1" @shijian2="fathertime2" @way1="way1" @way2="way2" :selectedOptions1="selectedOptions1" :selectedOptions2="selectedOptions2" :dazi1="dazi1" :dazi2="dazi2" :shijian1="time1" :shijian2="time2" :hireway="hireway" :returnway="returnway"></router-view>
    </keep-alive>
    <div class="tab">
      <div class="tab-item">
        <router-link :to="{path: '/home'}"><i class="iconfont icon-shouyeshouye"></i>首页</router-link>
      </div>
      <div class="tab-item">
        <router-link :to="{path: '/hire'}"><i class="iconfont icon-qiche"></i>商品</router-link>
      </div>
      <div class="tab-item">
        <router-link :to="{path: '/user'}"><i class="iconfont icon-wode"></i>我的</router-link>
      </div>
    </div>
  </div>
</template>

<script>
  import header from './components/header/header'
export default {
    components: {
      'v-header': header
    },
  data(){
      return{
        selectedOptions1:[],
        selectedOptions2:[],
        dazi1:'',
        dazi2: '',
        time1:'',
        time2:'',
        hireway:'',
        returnway:''
      }
  },
  methods:{
    hiredizi(val){
      this.selectedOptions1 = val
    },
    way1(val){
      this.hireway = val
    },
    way2(val){
      this.returnway = val
    },
    returndizi(val){
      this.selectedOptions2 = val
    },
    fathertime1(val){
      this.time1 = val
    },
    fathertime2(val){
      this.time2 = val
    },
    fathershuru1(val){
      this.dazi1 = val
    },
    fathershuru2(val){
      this.dazi2 = val
    }
  }
}
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .tab
    position: fixed
    left: 0
    bottom: 0
    display: flex
    width: 100%
    height: 50px
    line-height: 26px
    z-index 80
    border-top: 1px solid rgba(7,17,27,0.1)
    background-color: rgb(255,255,255)
    .tab-item
      flex: 1
      text-align: center
      .icon-shouyeshouye
        font-size: 24px
        display: block
      .icon-qiche
        font-size: 24px
        display: block
      .icon-wode
        font-size: 24px
        display:block
      & > a
        display: block
        font-size: 12px
        color: rgb(77,85,93)
        text-decoration: none
        &.active
          color: rgb(240,20,20)
</style>
