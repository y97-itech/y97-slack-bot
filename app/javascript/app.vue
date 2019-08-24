<template>
  <app-layout>
    <router-view v-if="isSignedIn"></router-view>
  </app-layout>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import AppLayout from './components/AppLayout'

export default {
  created: function () {
    axios.get('/api/session').then((response) => {
      if (response.data.auth) {
        this.$store.dispatch('signIn', response.data)
      } else {
        console.log('auth was false.')
        window.location = '/auth'
      }
    }).catch((error) => {
      console.log(error)
      window.location = '/auth'
    })
  },
  computed: {
    ...mapGetters(['isSignedIn'])
  },
  components: {
    AppLayout
  }
}
</script>
