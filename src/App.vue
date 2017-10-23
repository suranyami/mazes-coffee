<template lang="pug">
  #app
    h1 Maze
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

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
