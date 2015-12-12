# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'game', game = new Game()

    console.log(@get('game').get('playerHand').models)
    # console.log(@get('playerHand').scores()[0])
    # console.log(@get('dealerHand').scores()[1])
    # @set 'playerScore',
    # @set 'dealerScore'

