{View} = require 'atom'
fs = require 'fs'
exec = require('child_process').exec
# require('grunt').cli()

module.exports =
class NationbuilderStyleguideView extends View
  @content: ->
    @div class: 'nationbuilder-styleguide overlay from-top', =>
      @div "The NationbuilderStyleguide package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "nationbuilder-styleguide:toggle", => @toggle()
    fs.readFile '/etc/hosts', 'utf8', (err,data) ->
      if (err)
        return console.log(err)
      console.log(data);
    exec 'cd ~/workspace/nbuild; ls -la', (err, stdout, stderr) ->
      console.log(stdout)


  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "NationbuilderStyleguideView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
