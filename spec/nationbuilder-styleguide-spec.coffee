NationbuilderStyleguide = require '../lib/nationbuilder-styleguide'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "NationbuilderStyleguide", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('nationbuilderStyleguide')

  describe "when the nationbuilder-styleguide:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.nationbuilder-styleguide')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'nationbuilder-styleguide:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.nationbuilder-styleguide')).toExist()
        atom.workspaceView.trigger 'nationbuilder-styleguide:toggle'
        expect(atom.workspaceView.find('.nationbuilder-styleguide')).not.toExist()
