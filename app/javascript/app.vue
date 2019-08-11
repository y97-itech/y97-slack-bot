<template>
  <v-app id="app">
    <v-content>
      <v-container fluid fill-height>
        <v-layout align-center justify-center>
          <v-card dark>
            <v-card-text>{{ message }}</v-card-text>
          </v-card>
        </v-layout>
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
</style>
