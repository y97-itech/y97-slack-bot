<template>
  <div>
    <v-app-bar absolute dark v-if="isLoggedIn">
      <v-toolbar-title>
        <router-link to="/" class="toolbar-title">y97 slack bot</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <v-btn text><router-link to="/foo">Go to Foo</router-link></v-btn>
        <v-btn text><router-link to="/baa">Go to Bar</router-link></v-btn>
        <v-btn text>{{ team.name }} / {{ user.profile.display_name }}</v-btn>
        <v-btn text @click="logout">logout</v-btn>
      </v-toolbar-items>
    </v-app-bar>
    <v-app-bar absolute dark v-else>
      <v-toolbar-title>y97 slack bot</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <v-btn text><router-link to="/auth">Auth</router-link></v-btn>
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
      user: {},
      team: {},
      isLoggedIn: false
    }
  },
  created: function () {
    axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name=csrf-token]').getAttribute('content')
    axios.get('/session.json').then((res) => {
      if (res.data.auth) {
        this.user = res.data.user
        this.team = res.data.team
        this.isLoggedIn = true
      }
    })
    .catch((err) => {
      console.log(err)
    })
  },
  computed: {
  },
  methods: {
    logout: function () {
      console.log('logout?')
      axios.delete('/session').then((res) => {
        console.log(res)
      })
      .catch((err) => {
        console.log(err)
      })
      .finally(() => {
        this.user = {}
        this.isLoggedIn = false
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
