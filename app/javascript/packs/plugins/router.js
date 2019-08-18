import Vue from 'vue'
import VueRouter from 'vue-router'

import PageNotFound from '../../pages/PageNotFound'
import Home from '../../pages/Home'
import Profile from '../../pages/Profile'
import Foo from '../../pages/Foo'
import Baa from '../../pages/Baa'

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
  routes // `routes: routes` の短縮表記
})
