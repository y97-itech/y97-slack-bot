<template>
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
</template>

<style scoped>
.toolbar-title {
  color: inherit;
  text-decoration: inherit;
}
</style>
