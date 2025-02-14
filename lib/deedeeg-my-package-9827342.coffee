DeedeegMyPackage9827342View = require './deedeeg-my-package-9827342-view'
{CompositeDisposable} = require 'atom'

module.exports = DeedeegMyPackage9827342 =
  deedeegMyPackage9827342View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @deedeegMyPackage9827342View = new DeedeegMyPackage9827342View(state.deedeegMyPackage9827342ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @deedeegMyPackage9827342View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'deedeeg-my-package-9827342:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @deedeegMyPackage9827342View.destroy()

  serialize: ->
    deedeegMyPackage9827342ViewState: @deedeegMyPackage9827342View.serialize()

  toggle: ->
    console.log 'DeedeegMyPackage9827342 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
