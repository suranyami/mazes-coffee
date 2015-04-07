window.Grid = class @Grid
  constructor: (@rows, @columns) ->
    @grid = @prepareGrid()
    @configureCells()

  getAt: (row, column) ->
    return null unless 0 <= row <= @rows - 1
    return null unless 0 <= column <= @grid[row].count - 1
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

  random_cell: ->
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

  # to_png: (cell_size: 10, img: nil) ->
  #   img_width = cell_size * columns
  #   img_height = cell_size * rows
  #
  #   background = ChunkyPNG::Color.parse(:white)
  #   wall = ChunkyPNG::Color.parse(:black)
  #
  #   img ||= ChunkyPNG::Image.new(img_width + 1, img_height + 1, background)
  #
  #   each_cell do |cell|
  #     x1 = cell.column * cell_size
  #     y1 = cell.row    * cell_size
  #     x2 = (cell.column + 1) * cell_size
  #     y2 = (cell.row + 1) * cell_size
  #     img.line(x1, y1, x2, y1, wall) unless cell.north
  #     img.line(x1, y1, x1, y2, wall) unless cell.west
  #     img.line(x2, y1, x2, y2, wall) unless cell.linked?(cell.east)
  #     img.line(x1, y2, x2, y2, wall) unless cell.linked?(cell.south)
  #   img
