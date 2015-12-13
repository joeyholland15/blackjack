class window.CardView extends Backbone.View
  className: 'card'

  template: _.template ''
  # template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png"></img>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    if @$el.hasClass 'covered' 
      @$el.css({'background-image': 'url(img/card-back.png'})
    else 
     @$el.css({'background-image': 'url(img/cards/' + @model.get('rankName') + '-' + @model.get('suitName') + ".png"})    

