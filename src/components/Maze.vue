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

        drawing = SVG('drawing').size(@width, @height)
        for x in [0..@columns]
          for y in [0..@rows]
            symbol = drawing.symbol()
            symbol.rect(cellWidth, cellHeight).fill('white')
            symbol.stroke({color: 'black', width: '0.5px'})
            xOff = x * cellWidth
            yOff = y * cellWidth
            use = drawing.use(symbol).move(xOff, yOff)

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
  background-color: lightyellow;
  margin: 0 25%;
}
</style>
