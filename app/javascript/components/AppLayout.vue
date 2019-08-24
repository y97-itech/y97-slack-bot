<template>
  <v-app>
    <navi-bar></navi-bar>
    <v-content>
      <v-container fluid fill-height>
        <slot></slot>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import NaviBar from './NaviBar'

export default {
  components: { NaviBar }
}
</script>
