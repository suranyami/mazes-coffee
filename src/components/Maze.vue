<template lang="pug">
  .maze
    #drawing
</template>

<script lang="coffee">
  import SVG from 'svg.js'

  export default
    data: ->
      width: 400
      height: 300
      columns: 40
      rows: 30
    methods:
      draw: ->
        cellWidth = @width / @columns
        cellHeight = @height / @rows

        draw = SVG('drawing').size(400, 300)
        symbol = draw.symbol()
        for x in [0..@columns]
          for y in [0..@rows]
            symbol.rect(@cellWidth, @cellHeight).fill('white')
            symbol.stroke({color: 'red', width: '0.5px'})
            symbol.move(x, y)
            use = draw.use(symbol)

    mounted: ->
      this.draw()

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
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
  background-color: white;
  margin: 0 25%;
}
</style>
