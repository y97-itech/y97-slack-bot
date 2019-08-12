<template>
  <v-app>
    <navi-bar></navi-bar>
    <v-content>
      <v-container fluid fill-height>
        <router-view v-if="isSignedIn"></router-view>
        <auth v-else></auth>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import NaviBar from './components/AppBar'
import Auth from './pages/Auth'

export default {
  data: function () {
    return {
      message: 'Hello Vuetify!'
    }
  },
  computed: {
    isSignedIn: function () {
      return this.$store.state.status
    }
  },
  components: {
    NaviBar,
    Auth
  }
}
</script>
