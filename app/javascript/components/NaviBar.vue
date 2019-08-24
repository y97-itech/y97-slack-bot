<template>
  <div>
    <v-app-bar absolute dark>
      <v-toolbar-title>y97 slack bot</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items v-if="isSignedIn">
        <v-btn text link to="/">Home</v-btn>
        <v-btn text link to="/foo">Foo</v-btn>
        <v-btn text link to="/baa">Baa</v-btn>
        <v-btn text link to="/profile"><img :alt="user.profile.displayName" :src="user.profile.image_48" width="48" height="48" class="avatar" /></v-btn>
      </v-toolbar-items>
    </v-app-bar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters(['isSignedIn', 'user', 'team'])
  }
}
</script>

<style scoped>
.avatar {
  border-radius: 50%;
}
</style>
