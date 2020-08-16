// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueResource from 'vue-resource'
import './style.css'
import '../static/css/reset.css'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import './stylus/index.styl'
import preview from 'vue-photo-preview'
import 'vue-photo-preview/dist/skin.css'
import axios from 'axios'
import qs from 'qs'
Vue.config.productionTip = false
Vue.use(VueResource)
Vue.use(preview)
Vue.use(ElementUI)
axios.defaults.withCredentials=true
Vue.prototype.$axios = axios
Vue.prototype.$qs = qs

/* eslint-disable no-new */

new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
