<template>
  <app-layout>
    <div v-if="isLoading">
      <p>is loading ...</p>
    </div>
    <router-view v-else-if="isSignedIn"></router-view>
    <auth v-else></auth>
  </app-layout>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import AppLayout from './components/AppLayout'
import Auth from './pages/Auth'

export default {
  data: function () {
    return {
      isLoading: true
    }
  },
  created: function () {
    axios.get('/api/session').then((response) => {
      if (response.data.auth) {
        this.$store.dispatch('signIn', response.data)
      } else {
        console.log('no authentication.')
      }
    }).catch((error) => {
      console.log(error)
    }).finally(() => {
      this.isLoading = false
    })
  },
  computed: {
    ...mapGetters(['isSignedIn'])
  },
  components: {
    AppLayout, Auth
  }
}
</script>
