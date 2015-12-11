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
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    #sets appView's html to the template and initialize renders it immediately. 
    @$el.html @template()
    #provides content for player and dealer divs --> both will be collections (player hands and dealer hands)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

