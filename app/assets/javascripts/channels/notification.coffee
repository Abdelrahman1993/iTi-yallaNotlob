App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    console.log("connected")

  disconnected: ->
    console.log("unfortunetly disconnected")

  received: (data) ->
  # document.getelementbyid("notificationsBox").innerhtml = data.message;
  
    # alert(data.message)
    

  send_msg: (data) ->
    @perform 'send_msg', message:data
