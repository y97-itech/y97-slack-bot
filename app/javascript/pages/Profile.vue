<template>
  <v-layout align-center justify-center fill-height>
    <v-card>
      <v-card-title>Profile</v-card-title>
      <v-card-text>
        name: {{user.profile['display_name']}}
      </v-card-text>
      <v-card-text><v-btn text @click="signOut">Sign Out</v-btn></v-card-text>
    </v-card>
  </v-layout>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'

export default {
  name: 'Profile',
  methods: {
    signOut: function () {
      console.log('sign_out was called.')
      axios.delete('/api/session').then((response) => {
        console.log(response)
      }).catch((error) => {
        console.log(error)
      }).finally(() => {
        this.$store.dispatch('signOff')
        this.$router.push('/')
      })
    }
  },
  computed: {
    ...mapGetters(['user', 'team'])
  }
}
</script>
