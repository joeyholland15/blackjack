#this is the first thing that happens upon page load - index html runs this file while generates an app model and appends it to the body. 
new AppView(model: new App()).$el.appendTo 'body'
