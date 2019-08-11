<template>
  <v-app id="app">
    <v-app-bar absolute dark>
      <v-toolbar-title>
        <router-link to="/" class="toolbar-title">y97 Slack Bot</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <v-btn text><router-link to="/foo">Go to Foo</router-link></v-btn>
        <v-btn text><router-link to="/baa">Go to Bar</router-link></v-btn>
        <v-btn text>Link 3</v-btn>
      </v-toolbar-items>
    </v-app-bar>
    <v-content>
      <v-container fluid fill-height>
        <router-view></router-view>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      message: 'Hello Vuetify!'
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
