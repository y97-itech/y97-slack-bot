<template>
  <v-layout align-center justify-center fill-height>
    <v-card>
      <v-card-title>Profile</v-card-title>
      <v-card-text>Hi?</v-card-text>
      <v-card-text><v-btn text @click="signOut">Sign Out</v-btn></v-card-text>
    </v-card>
  </v-layout>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Profile',
  methods: {
    signOut: function () {
      console.log('sign_out was called.')
      axios.delete('/session').then(res => {
        console.log(res)
      })
        .catch(err => {
          console.log(err)
        })
        .finally(() => {
          this.$store.commit('onSignOff')
        })
    }
  }
}
</script>
