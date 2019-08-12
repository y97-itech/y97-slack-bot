<template>
  <div>
    <v-app-bar absolute dark>
      <v-toolbar-title>y97 slack bot</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items v-if="isSignedIn">
        <v-btn text link to="/">Home</v-btn>
        <v-btn text link to="/foo">Foo</v-btn>
        <v-btn text link to="/baa">Bar</v-btn>
        <v-btn text link to="/profile"><v-img :alt="userName" :src="userImage" width="48" height="48"></v-img></v-btn>
      </v-toolbar-items>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  name: 'AppBar',
  data: function () {
    return {}
  },
  created: function () {},
  computed: {
    isSignedIn: function () {
      return this.$store.state.status
    },
    userName: function () {
      return this.$store.state.user.name
    },
    userImage: function () {
      return this.$store.state.user.image
    },
    teamName: function () {
      return this.$store.state.team.name
    }
  },
  methods: {
  }
}
</script>
