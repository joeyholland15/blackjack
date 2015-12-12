class window.Hand extends Backbone.Collection
  #sets its model to card model. 
  model: Card
  #initialize method with array, this.deck and this.deal as parameters. No functionality yet. 
  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @last()
    # console.log(@model)
    # console.log(App.dealerHand.scores()[0])
    #console.log('ph: ', @isDealer)
    if @bestScore() > 21 and @isDealer
      alert('You win!')
    else if @bestScore() > 21 and @isDealer == undefined
      alert('Dealer Wins!')
    #see if score minscore > 21
      #if so, alert dealer wins 

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    # calculate lowest possible score and return
    # console.log('reveal? ', card.get 'revealed')
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  bestScore: ->
    scoreArr = @scores()
    if scoreArr[0] > 21 and scoreArr[1] > 21
      alert('Bust. Refresh to play again.')
    if scoreArr[0] > scoreArr[1]
      if scoreArr[0] < 21
        return scoreArr[0]
      else
        scoreArr[1]

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]