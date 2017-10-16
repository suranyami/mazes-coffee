<template lang="pug">
  .maze
    h1 Maze
    ul
      li(v-for='name in fruit') {{name}}
    #drawing
</template>

<script lang="coffee">
  import SVG from 'svg.js'

  export default
    data: ->
      fruit: ["Apple", "Turnip", "Carrot"]
    methods:
      draw: ->
        draw = SVG('drawing').size(400, 300)
        symbol = draw.symbol()
        symbol.rect(100, 100).fill('#f09')
        use = draw.use(symbol).move(20, 60)
    mounted: ->
      this.draw()

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {color: #42b983;}

#drawing {
  width: 400px;
  height: 300px;
  background-color: black;
  margin: 0 25%;
}
</style>
