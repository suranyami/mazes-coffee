window.Grid = class @Grid
  constructor: (@rows, @columns) ->
    @grid = @prepareGrid()
    @configureCells()

  getAt: (row, column) ->
    console.log row, column
    return null unless 0 <= row <= @rows - 1
    console.log @grid[row].length
    console.log (0 <= row <= @rows - 1) && (0 <= column <= @grid[row].length - 1)
    return null unless 0 <= column <= @grid[row].length - 1
    @grid[row][column]

  prepareGrid: ->
    for row in [0...@rows]
      for column in [0...@columns]
        new window.Cell(row, column)

  configureCells: ->
    @eachCell (cell) =>
      row = cell.row
      col = cell.column

      cell.north = @getAt(row - 1, col)
      cell.south = @getAt(row + 1, col)
      cell.west  = @getAt(row, col - 1)
      cell.east  = @getAt(row, col + 1)

  randomCell: ->
    row = _.sample(@grid)
    _.sample(row)

  size: ->
    @rows * @columns

  eachRow: (func) ->
    for row in @grid
      func(row)

  eachCell: (func) ->
    @eachRow (row) ->
      for cell in row
        func(cell) if cell

  contentsOf: (cell) ->
    " "

  toString: ->
    first = ""
    for x in [1..@columns]
      first = "#{first}---+"

    output = "+#{first}\n"

    for row in @grid
      top = "|"
      bottom = "+"

      for cell in row
        cell = new window.Cell(-1, -1) unless cell
        body = " #{@contentsOf(cell)} "
        eastBoundary = if cell.isLinked(cell.east) then " " else "|"
        top = "#{top}#{body}#{eastBoundary}"
        southBoundary = if cell.isLinked(cell.south) then "   " else "---"
        corner = "+"
        bottom = "#{bottom}#{southBoundary}#{corner}"

      output = "#{output}#{top}\n#{bottom}\n"

    "<pre>#{output}</pre>"

  draw: (paper, cellSize = 20) ->
    width = cellSize * @columns
    height = cellSize * @rows

    @eachCell (cell) =>
      x1 = cell.column * cellSize
      y1 = cell.row    * cellSize
      x2 = (cell.column + 1) * cellSize
      y2 = (cell.row    + 1) * cellSize

      # console.log "cell", cell.column, cell.row
      # 
      # console.log "rect", x1, y1, x2, y2
      
      rect = paper.rect(x1 + 10, y1 + 10, cellSize, cellSize)
        .attr(fill: 'white')
        .attr(stroke: 'white')

      console.log cell
      @drawLine(paper, x1, y1, x2, y1) unless cell.linked?(cell.north)
      @drawLine(paper, x1, y1, x1, y2) unless cell.linked?(cell.west)
      @drawLine(paper, x2, y1, x2, y2) unless cell.linked?(cell.east)
      @drawLine(paper, x1, y2, x2, y2) unless cell.linked?(cell.south)

      rect.mouseover =>
        # console.log "mouseover", x1, y1, x2, y2
        rect.attr({fill: 'red'})
      rect.mouseout =>
        # console.log "mouseout", x1, y1, x2, y2
        rect.attr({fill: 'white'})


  drawLine: (paper, x1, y1, x2, y2) ->
    paper.path("M#{x1 + 10} #{y1 + 10}L#{x2 + 10} #{y2 + 10}")
      .attr({'stroke-width': 1, 'stroke': 'black'})
