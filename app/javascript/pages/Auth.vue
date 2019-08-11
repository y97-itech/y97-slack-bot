<template>
  <v-layout align-center justify-center fill-height>
    <v-card width="240" class="mx-auto">
      <v-card-text><v-icon>fab fa-slack</v-icon> slack</v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer><v-btn to="/auth/slack" link fab large><v-icon>fas fa-link</v-icon></v-btn><v-spacer></v-spacer>
      </v-card-actions>
      <v-card-text class="text-right">authorization</v-card-text>
    </v-card>
  </v-layout>
</template>
