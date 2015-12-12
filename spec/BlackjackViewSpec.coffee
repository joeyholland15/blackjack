assert = chai.assert

describe "player minimum score", ->
  app = null
  deck = null
  hand = null
  beforeEach ->
    app = new App()

  it "should properly calculate player minimum score", ->
    minScoreTest = app.get('game').get('playerHand').minScore()

    minScore = app.get('game').get('playerHand').models.reduce (acc, item) ->
      acc = acc + item.attributes.value
      acc
    , 0
    assert.strictEqual minScoreTest, minScore