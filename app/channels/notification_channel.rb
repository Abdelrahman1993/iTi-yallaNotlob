class NotificationChannel < ApplicationCable::Channel


  
  def subscribed
    stream_from current_user.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_msg(data)
    info = data['message'].split(",")
    if info[0] === 'inv'
        ActionCable.server.broadcast info[1], message:info[0]+","+info[2]
    end
      
        
      
    
  end
end
