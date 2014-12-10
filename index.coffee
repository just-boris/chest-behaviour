class Chest
	constructor: ->
		@drawers = [1..3].map -> new Drawer

	get: (i) ->
		@drawers[i]

	open: (drawers...) ->
		drawers.forEach (d) => do @get(d).open
		@drawers.forEach (d) -> d.locked = true if !d.opened

	close: (drawers...) ->
		drawers.forEach (d) => do @get(d).close
		if (@drawers.every (d) -> !d.opened)
			@drawers.forEach (d) -> d.locked = null

class Drawer
	consructor: ->
		@opened = false
		@locked = null

	open: ->
		@opened = true if !@locked

	close: ->
		@opened = false

module.exports = Chest
