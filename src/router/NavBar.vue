<template lang="pug">
ul
  li
    router-link(to="/about") About
  li
    router-link(to="/maze") Maze
</template>

<script lang="coffee">
export default
  name: "nav-bar"
</script>

<style lang="scss">
</style>
