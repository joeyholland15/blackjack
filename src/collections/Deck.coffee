class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @
  # dealer properties defined and passed from here. true represents isDealer boolean
  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

