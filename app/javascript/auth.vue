<template>
  <app-layout>
    <auth></auth>
  </app-layout>
</template>

<script>
import AppLayout from './components/AppLayout'
import Auth from './pages/Auth'

export default {
  components: { AppLayout, Auth }
}
</script>
