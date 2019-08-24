import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../pages/Home'
import Profile from '../pages/Profile'
import Foo from '../pages/Foo'
import Baa from '../pages/Baa'
import PageNotFound from '../pages/PageNotFound'

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Home },
  { path: '/profile', component: Profile },
  { path: '/foo', component: Foo },
  { path: '/baa', component: Baa },
  { path: '*', component: PageNotFound, meta: { isPublic: true } }
]

export default new VueRouter({
  mode: 'history',
  routes // Note: `routes: routes` の短縮表記
})
