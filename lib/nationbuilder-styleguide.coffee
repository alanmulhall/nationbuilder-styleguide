NationbuilderStyleguideView = require './nationbuilder-styleguide-view'

module.exports =
  nationbuilderStyleguideView: null

  activate: (state) ->
    @nationbuilderStyleguideView = new NationbuilderStyleguideView(state.nationbuilderStyleguideViewState)

  deactivate: ->
    @nationbuilderStyleguideView.destroy()

  serialize: ->
    nationbuilderStyleguideViewState: @nationbuilderStyleguideView.serialize()
