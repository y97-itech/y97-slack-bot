<template>
  <div>
    <v-app-bar absolute dark v-if="isSignedIn">
      <v-toolbar-title>
        <router-link to="/" class="toolbar-title">y97 slack bot</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <v-btn text link to="/foo">Foo</v-btn>
        <v-btn text link to="/baa">Bar</v-btn>
        <v-btn text>{{ teamName }} / {{ userName }}</v-btn>
        <v-btn text @click="signOut">Sign Out</v-btn>
      </v-toolbar-items>
    </v-app-bar>
    <v-app-bar absolute dark v-else>
      <v-toolbar-title>y97 slack bot</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <v-btn text link to="/auth">Auth</v-btn>
      </v-toolbar-items>
    </v-app-bar>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'AppBar',
  data: function () {
    return {
    }
  },
  created: function () {

  },
  computed: {
    isSignedIn: function () {
      return this.$store.state.status
    },
    userName: function () {
      return this.$store.state.user.profile.display_name
    },
    teamName: function () {
      return this.$store.state.team.name
    }
  },
  methods: {
    signOut: function () {
      console.log('sign_out was called.')
      axios.delete('/session').then((res) => {
        console.log(res)
      }).catch((err) => {
        console.log(err)
      }).finally(() => {
        this.$store.commit('onSignOff')
        this.$router.push('/auth')
      })
    }
  }
}
</script>

<style scoped>
.toolbar-title {
  color: inherit;
  text-decoration: inherit;
}
</style>
