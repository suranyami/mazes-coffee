window.BinaryTree = class BinaryTree

  @on: (grid) ->
    grid.eachCell (cell) ->
      neighbors = []
      neighbors.push cell.north if cell.north
      neighbors << cell.east if cell.east
      
      neighbor = _.sample(neighbors)
      cell.link(neighbor) if neighbor
    grid