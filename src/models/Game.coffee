class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
  stand: ->
    console.log(@get('playerHand').scores()[0])
    console.log(@get('dealerHand').scores()[0])
    # console.log(@get('dealerHand'))
    #   if @hasAce()
  #     if @scores()[1] < 21 and @scores()[1] > dealerHand.scores()[0]
  #       alert('You Win suckaaaah!')
  #     else
  #       alert('Dealer Wins suckaaaah')
  #   else @scores()[0] < 21 and @scores()[1] > dealerHand.scores()[0]
  #     alert('You Win suckaaaah!')
