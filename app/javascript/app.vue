<template>
  <v-app id="app">
    <x-app-bar></x-app-bar>
    <v-content>
      <v-container fluid fill-height>
        <router-view></router-view>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import XAppBar from './components/AppBar'

export default {
  data: function () {
    return {
      message: 'Hello Vuetify!'
    }
  },
  components: {
    'x-app-bar': XAppBar
  },
}
</script>
