<template>
  <v-layout align-center justify-center fill-height>
    <v-card width="240" class="mx-auto">
      <v-card-text><v-icon>fab fa-slack</v-icon> slack</v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <form action="/users/auth/slack" method="post">
          <input name="authenticity_token" type="hidden" :value="csrfToken">
          <v-btn type="submit" fab large><v-icon>fas fa-link</v-icon></v-btn>
        </form>
        <v-spacer></v-spacer>
      </v-card-actions>
      <v-card-text class="text-right">authorization</v-card-text>
    </v-card>
  </v-layout>
</template>

<script>
export default {
  data: () => ({
  }),
  computed: {
    csrfToken () {
      // TODO: CSRF-Token の管理方法を考える
      return document.querySelector('meta[name=csrf-token]').getAttribute('content')
    }
  }
}
</script>
