<template>
  <div>
    <v-app-bar absolute dark>
      <v-toolbar-title>y97 slack bot</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items v-if="isSignedIn">
        <v-btn text link to="/">Home</v-btn>
        <v-btn text link to="/foo">Foo</v-btn>
        <v-btn text link to="/baa">Baa</v-btn>
        <v-btn text link to="/profile"><img :alt="userName" :src="userImage" width="48" height="48" class="avatar" /></v-btn>
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
      isSignedIn: false,
      userName: 'aaaa',
      userImage: '',
      teamName: 'bbbb'
    }
  },
  created: function () {
    console.log('navi-bar created.')
    console.log(`is-signed-in is ${this.isSignedIn}`)

    axios.get('/api/session').then((response) => {
      console.log(response)
      if (response.data.auth) {
        this.isSignedIn = true
        this.userName = response.data.user.profile.displayName
        this.userImage = response.data.user.profile.image_48
        this.teamName = response.data.team.name
      }
    }).catch((error) => {
      console.log('get session failed')
      console.log(error)
    })
  },
  methods: {
  }
}
</script>

<style scoped>
.avatar {
  border-radius: 50%;
}
</style>
