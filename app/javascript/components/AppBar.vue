<template>
  <div>
    <v-app-bar absolute dark v-if="hasAuth">
      <v-toolbar-title>
        <router-link to="/" class="toolbar-title">y97 slack bot</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <v-btn text><router-link to="/foo">Go to Foo</router-link></v-btn>
        <v-btn text><router-link to="/baa">Go to Bar</router-link></v-btn>
        <v-btn text>Link 3</v-btn>
      </v-toolbar-items>
    </v-app-bar>
    <v-app-bar absolute dark v-else>
      <v-toolbar-title>y97 slack bot</v-toolbar-title>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  computed: {
    hasAuth: function () {
      return false
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
