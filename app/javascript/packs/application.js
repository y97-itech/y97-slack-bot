/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue'
// TODO: remove plugins directory
import store from './plugins/store'
import router from './plugins/router'
import vuetify from './plugins/vuetify'
import App from '../app.vue'
import Auth from '../auth.vue'

import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name=csrf-token]').getAttribute('content')

  let elm = document.querySelector('#auth')
  if (elm) {
    new Vue({
      store,
      router,
      vuetify,
      render: h => h(Auth)
    }).$mount(elm)

    return
  }

  elm = document.querySelector('#app')
  if (elm) {
    new Vue({
      store,
      router,
      vuetify,
      render: h => h(App)
    }).$mount(elm)
  }

  // if (elm.dataset.auth === 'true') {
  //   store.commit('onSignIn', {
  //     user: {
  //       name: elm.dataset.userName,
  //       image: elm.dataset.userImage
  //     },
  //     team: {
  //       name: elm.dataset.teamName
  //     }
  //   })
  // }
})

console.log('Hello World from Webpacker')
