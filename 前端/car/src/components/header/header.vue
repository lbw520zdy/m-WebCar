<template>
  <div class="header">
    <div class="title-wrapper">
      <div class="avatar">
        <img width="66" height="55" src="https://ae01.alicdn.com/kf/H745d3e4205054c1e9cf766ad9e0d7145W.png"/>
      </div>
      <div class="content">
        <div class="title">
          <i class="iconfont icon-pinpai"></i>
          <span class="name">维记租车</span>
        </div>
        <div class="description">
          全球租车领导品牌
        </div>
        <div class="description1">
          想怎么租就怎么租
        </div>
      </div>
      <div class="company-click" @click="showCompany">
        <i class="iconfont icon-shouyeshouye"></i>
        <i class="iconfont icon-xiayiye"></i>
      </div>
    </div>
    <div class="bulletin-wrapper" @click="showDetail">
      <i class="iconfont icon-xiaochengxu-"></i>
      <span class="buttetin-text">租车须知      ...</span>
      <i class="iconfont icon-xiayiye"></i>
    </div>
    <div class="background">
      <img width="100%" height="100%" src="https://ae01.alicdn.com/kf/H745d3e4205054c1e9cf766ad9e0d7145W.png"/>
    </div>
    <transition name="fade1">
      <div v-show="companyShow" class="company">
        <div class="company-wrapper clearfix">
          <div class="company-main">
            <h1 class="name">维记租车</h1>
            <div class="title">
              <div class="line"></div>
              <div class="text">公司简介</div>
              <div class="line"></div>
            </div>
            <div class="know"><i class="iconfont icon-gongsi"></i>维记租车有限公司(WeiJi，简称维记租车)成立于2018年12月，总部位于广东。作为中国领先的汽车租赁服务提供商，维记租车积极借鉴国际上成功的汽车租赁模式，并结合中国客户的消费习惯，为客户提供短租、长租及融资租赁等专业化的汽车租赁服务，以及全国救援、异地还车等完善的配套服务。截至2018年12月，维记租车在国内300余个主要城市设有1100余个服务网点，服务个人客户过千万、企业客户数万家，是目前中国汽车租赁行业的领跑企业。</div>
          </div>
        </div>
        <div class="company-close" @click="hideCompany">
          <i class="iconfont icon-X"></i>
        </div>
      </div>
    </transition>
    <transition name="fade">
      <div v-show="detailShow" class="notice">
        <div class="notice-wrapper clearfix">
          <div class="notice-main">
            <h1 class="name">维记租车</h1>
            <div class="title">
              <div class="line"></div>
              <div class="text">租车须知</div>
              <div class="line"></div>
            </div>
            <ul class="konw" v-for="(i,index) in supports" :key="index">
              <i class="iconfont" :class="i.image"></i>
              <span class="toutext">{{i.type}}</span>
              <li class="know-item" v-for="(y,index) in i.description">
                <span>（{{index+1}}）{{y}}</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="notice-close" @click="hideDetail">
          <i class="iconfont icon-X"></i>
        </div>
      </div>
    </transition>
  </div>

</template>

<script type="text/ecmascript-6">
  export default {
    data() {
      return {
        detailShow: false,
        companyShow: false,
        supports: [
          {
            "image": "icon-nianling",
            "type": "年龄：",
            "description": [
              "满30周岁"
              ]},
          {
            "image": "icon-shenfenzheng",
            "type": "身份证件：",
            "description":[
              "大陆居民：第二代身份证","港澳居民：港澳居民来往内地通行证（简称“回乡证/卡”）","台湾居民：居民来往大陆通行证（简称“台胞证/卡”）","其他国家居民：居住国家护照"
            ]
          },
          {
            "image": "icon-ziyuan",
            "type": "驾驶证件：",
            "description": ["中华人民共和国机动车驾照证正、副本，要求距初次领证时间必须超过6个月（含）"]
          },
          {
            "image": "icon-weibiaoti-",
            "type": "支付证件：",
            "description": ["大陆居民：国内信用卡或国内借记卡","港澳台及其他国家居民：新会员只受理国内信用卡或带芯片的国际信用卡，老会员受理国内信用卡或国际信用卡（包含带芯片及带磁条）"]
          }
        ]
      }
    },
    methods: {
      showDetail() {
        this.detailShow = true
      },
      hideDetail() {
        this.detailShow = false
      },
      showCompany(){
       this.companyShow = true
      },
      hideCompany(){
        this.companyShow = false
      }
    }
  }
</script>

<style lang="stylus" rel="stylesheet/stylus">
  .header
    color: #fff
    background-color rgba(7,17,27,0.4)
    position: relative
    overflow: hidden
    .title-wrapper
      position: relative
      padding: 24px 12px 18px 24px
      font-size: 0
      .avatar
        display: inline-block
        vertical-align: top
        img
          border-radius: 4px
      .content
        display: inline-block
        margin-left: 16px
        font-size: 14px
        .title
          margin: 2px 0 6px 0
          .icon-pinpai
            display: inline-block
            color: red
            font-size: 16px
          .name
            margin-left: 6px
            font-size: 16px
            line-height: 18px
            font-weight: bold
      .company-click
        position: absolute
        right: 12px
        bottom: 14px
        padding: 0 8px
        height: 24px
        line-height: 24px
        border-radius: 14px
        background: rgba(0,0,0,0.2)
        text-align: center
        .description
          margin-bottom: 6px
          line-height: 12px
          font-size: 12px
        .description1
          line-height: 12px
          font-size: 10px
    .bulletin-wrapper
      position: relative
      height: 28px
      line-height: 28px;
      padding: 0 22px 0 12px
      background-color: rgba(7,17,27,0.2)
      .icon-xiaochengxu-
        display: inline-block
        vertical-align: top
        color: red
      .buttetin-text
        vertical-align: top
        margin: 0 4px
        font-size: 13px
      .icon-xiayiye
        position: absolute
        right: 10px
        top: 0px
    .background
      position: absolute
      top: 0
      left: 0
      width: 100%
      height: 100%
      z-index: -1
      filter: blur(10px)
    .fade1-enter-active, .fade1-leave-active {
        transition: opacity .5s;
      }
    .fade1-enter, .fade1-leave-to {
      opacity: 0;
    }
    .company
      position: fixed
      width: 100%
      height: 100%
      z-index: 100
      top: 0
      left: 0
      overflow: auto
      background: rgba(7,17,27,0.8)
      backdrop-filter: blur(10px)
      .clearfix
        display: inline-block
        &:after
          display:block
          content: "."
          height: 0
          line-height: 0
          clear: both
          visibility: hidden
      .company-wrapper
        width: 100%
        min-height: 100%
        .company-main
          margin-top: 64px
          padding-bottom: 124px
          .name
            line-height: 16px
            text-align: center
            font-size: 16px
            font-weight: 700
          .title
            display: flex
            width: 80%
            margin: 28px auto 24px auto
            .line
              flex: 1
              position: relative
              top: -6px
              border-bottom: 1px solid rgba(255,255,255,0.2)
            .text
              padding: 0 12px
              font-weight: 700
              font-size: 10px
          .know
            width: 80%
            margin: 0 auto 12px auto
            line-height: 32px
            .icon-gongsi
              font-size: 24px
              margin-right 5px
              color: red
      .company-close
        position: relative
        width: 32px
        height: 32px
        margin: -70px auto 0 auto
        clear: both
        .icon-X
          font-size: 32px
    .fade-enter-active, .fade-leave-active {
      transition: opacity .5s;
    }
    .fade-enter, .fade-leave-to {
      opacity: 0;
    }
    .notice
      position: fixed
      width: 100%
      height: 100%
      z-index: 100
      top: 0
      left: 0
      overflow: auto
      background: rgba(7,17,27,0.8)
      backdrop-filter: blur(10px)
      .clearfix
        display: inline-block
        &:after
          display:block
          content: "."
          height: 0
          line-height: 0
          clear: both
          visibility: hidden
      .notice-wrapper
        width: 100%
        min-height: 100%
        .notice-main
          margin-top: 64px
          padding-bottom: 124px
          .name
            line-height: 16px
            text-align: center
            font-size: 16px
            font-weight: 700
          .title
            display: flex
            width: 80%
            margin: 28px auto 24px auto
            .line
              flex: 1
              position: relative
              top: -6px
              border-bottom: 1px solid rgba(255,255,255,0.2)
            .text
              padding: 0 12px
              font-weight: 700
              font-size: 10px
          .konw
            width: 80%
            margin: 0 auto 12px auto
            .toutext
              font-size: 17px
            .icon-nianling
              font-size: 24px
              color: red
            .icon-shenfenzheng
              font-size: 21px
              color: red
            .icon-ziyuan
              font-size: 24px
              color: red
            .icon-weibiaoti-
              font-size: 24px
              color: red
            .know-item
              font-size: 14px
              margin-top: 10px
              margin-bottom: 12px
              padding-left: 12px
              line-height 30px
              &:last-child
                margin-bottom: 0
      .notice-close
        position: relative
        width: 32px
        height: 32px
        margin: -70px auto 0 auto
        clear: both
        .icon-X
          font-size: 32px
</style>
