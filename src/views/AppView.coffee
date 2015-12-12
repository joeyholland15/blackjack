class window.AppView extends Backbone.View
  #template property for app view that creates hit and stand buttons. Also creates div elements for player container and dealer container. 
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
  #events property
  events:
    #click event for hit button, this.model.get('playerHand').hit(); 
    'click .hit-button': -> @model.get('game').get('playerHand').hit()
    'click .stand-button': -> 
      @model.get('game').get('dealerHand').models[0].flip()
      @model.get('game').get('dealerHand').hit() while @model.get('game').get('dealerHand').bestScore() < 17 
      if @model.get('game').get('dealerHand').bestScore() <= 21 and @model.get('game').get('playerHand').bestScore() <= 21
       @model.get('game').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    #sets appView's html to the template and initialize renders it immediately. 
    @$el.html @template()
    #provides content for player and dealer divs --> both will be collections (player hands and dealer hands)
    # console.log(@model.get('game').get('playerHand'))
    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el