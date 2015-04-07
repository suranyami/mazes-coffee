window.Cell = class @Cell
  constructor: (@row, @column) ->
    @links = {}

  link: (cell, bidi = true) ->
    @links[cell] = true
    cell.link(self, false) if bidi
    @

  unlink: (cell, bidi = true) ->
    @links.delete(cell)
    cell.unlink(self, false) if bidi
    @

  isLinked: (cell) ->
    @links[cell]

  getLinks: ->
    @links.keys

  neighbors: ->
    list = []
    list.push(@north) if @north
    list.push(@south) if @south
    list.push(@east)  if @east
    list.push(@west)  if @west
    list

  toString: ->
    "[#{@row}, #{@column}]"

  distances: ->
    distances = new Distances(@)
    frontier = [@]
    while frontier.any?
      new_frontier = []
      for cell in frontier
        for linked in cell.getLinks()
          next if distances[linked]
          distances[linked] = distances[cell] + 1
          new_frontier.push(linked)
      frontier = new_frontier
    distances
