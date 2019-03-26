$(document).ready(function () {

    $('#notificationIcon').click(function () {

        // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
        $('#notificationsBox').fadeToggle('fast', 'linear', function () {
            document.getElementById('notificationsCount').innerHTML='0';
        count=0;
        });

        return false;
    });

    // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
    $(document).click(function () {
        $('#notificationsBox').hide();
        

    });

    // $('#notificationsBox').click(function () {
    //     return false;       // DO NOTHING WHEN CONTAINER IS CLICKED.
    // });
});

 



sendInvitation = (receiverId,name,orderLink) =>
{
    let message = "inv,"+receiverId+","+name+","+orderLink
    App.notification.send_msg(message)
}

informJoined = (receiverId,name,meal,orderLink)=>
{
    let message = "join,"+receiverId+","+name+","+meal+","+orderLink
    App.notification.send_msg(message)
}


let count = 0;

App.notification.received = (data)=>{
    let message = data['message'].split(',')
    if(message[0] === 'inv')
    {
        let newNotificationMessage = document.createTextNode(message[1]+" has invited you to his order")
        let newNotifications = document.createElement('li');
        let joinLink = document.createElement('a')
        joinLink.setAttribute('target','_blank')
        
        joinLink.setAttribute('href', message[3]);
        joinLink.innerHTML = 'Join'
        joinLink.addEventListener('click', function clickEvent(){
            let name = document.getElementById('name').innerHTML;
            informJoined(message[2],name,'Breakfast',message[3])
            joinLink.removeEventListener('click',clickEvent)
        })
        let joinBtn = document.createElement('button');

        let container = document.getElementById("notifications");
        
        joinBtn.appendChild(joinLink);
        newNotifications.appendChild(newNotificationMessage);
        newNotifications.appendChild(joinBtn);
        container.appendChild(newNotifications);

        count++;
        document.getElementById('notificationsCount').innerHTML=count;
        // console.log(data);
    }else if(message[0] === 'join'){
        let newNotificationMessage = document.createTextNode(message[1]+" Joined to your ")
        let joinLink = document.createElement('a')
        joinLink.setAttribute('href', message[3]);
        joinLink.innerHTML = 'order'
        let newNotifications = document.createElement('li');
       
     
        let container = document.getElementById("notifications");
        
        newNotifications.appendChild(newNotificationMessage);
        newNotifications.appendChild(joinLink);
        container.appendChild(newNotifications);

        count++;
        document.getElementById('notificationsCount').innerHTML=count;
    }
    
}

