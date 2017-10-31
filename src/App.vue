<template lang="pug">
  #app
    nav-bar
    router-view
</template>

<script lang="coffee">
import NavBar from './router/NavBar.vue'
export default {
  name: 'app',
  components:
    "nav-bar": NavBar
}
</script>

<style lang="scss">
@import "../static/main";

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
