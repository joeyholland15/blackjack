class window.Hand extends Backbone.Collection
  #sets its model to card model. 
  model: Card
  #initialize method with array, this.deck and this.deal as parameters. No functionality yet. 
  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @last()
    console.log(@scores())
    if @scores()[0] > 21
      alert('Bust. Refresh to play again.')
    #see if score minscore > 21
      #if so, alert dealer wins 

  hasAce: -> @reduce (memo, card) ->
    if card.get('value') is 1
      memo++ 
    memo 
  , 0

  minScore: -> @reduce (score, card) ->
    # calculate lowest possible score and return
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]



