<template>
  <v-app id="app">
    <x-app-bar></x-app-bar>
    <v-content>
      <v-container fluid fill-height>
        <router-view></router-view>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import axios from 'axios'
import XAppBar from './components/AppBar'

export default {
  data: function () {
    return {
      message: 'Hello Vuetify!'
    }
  },
  created: function () {
    axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name=csrf-token]').getAttribute('content')
    this.signIn()
  },
  methods: {
    signIn: function () {
      console.log('sign_in was called.')
      axios.get('/session.json').then((res) => {
        if (res.data.auth) {
          this.$store.commit('onSignIn', res.data)
        }
      }).catch((err) => {
        console.log(err)
      })
    }
  },
  components: {
    XAppBar
  }
}
</script>
