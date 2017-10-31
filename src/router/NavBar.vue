<template lang="pug">
nav.navbar(role="navigation", aria-label="main navigation")
  .navbar-brand
    .navbar-item Maze
    router-link.navbar-item(to="/about", title="Home") Home
    router-link.navbar-item(to="/maze", title="About") About
</template>

<script lang="coffee">
export default
  name: "nav-bar"
</script>

<style lang="scss">
.navbar {
  background-color: black;
  router-link {
    color: white;
  }
}
</style>
