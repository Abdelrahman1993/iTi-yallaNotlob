App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    console.log("connected")

  disconnected: ->
    console.log("unfortunetly disconnected")

  received: (data) ->
    console.log(data);
    

  send_msg: (data) ->
    @perform 'send_msg', message:data
