class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
  stand: ->
    @get('dealerHand').models[0].flip()
    # console.log(@get('playerHand').scores()[0])
    # console.log(@get('dealerHand').scores()[0])
    pHand = @get('playerHand')
    dHand = @get('dealerHand')
    # dHand = @get('dealerHand').scores()[0] + @get('dealerHand').models[0].attributes.rank
    # console.log('p: ', pHand.scores()[0])
    # console.log('d: ', dHand.scores()[0])

    # if pHand.hasAce()
    #   if pHand.scores()[1] < 21 and pHand.scores()[1] > dHand.scores()[0]
    #     alert('You win suckaaaah!')
    #   else
    #     alert('Dealer wins suckaaaah!')
    # else if pHand.scores()[0] < 21 and pHand.scores()[0] > dHand.scores()[0]
    #   alert('You win suckaaaah!')

    if pHand.bestScore() > dHand.bestScore()
      alert('You win!')
    else 
      alert('Dealer Wins!')