import Vue from 'vue'
import Router from 'vue-router'

import home from '../components/home/home'
import hire from '../components/hire/hire'
import user from '../components/user/user'

Vue.use(Router)

export default new Router({
  mode: 'history',
  linkActiveClass: 'active',
  routes: [
    {
      path:'/',
      name:'home1',
      component: home
    },
    {
      path:'/home',
      name:'home',
      component: home
    },
    {
      path:'/hire',
      name:'hire',
      component: hire
    },
    {
      path:'/user',
      name:'user',
      component: user
    }
  ]
})
