$(document).ready(function () {

    $('#notificationIcon').click(function () {

        // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
        $('#notificationsBox').fadeToggle('fast', 'linear', function () {
            
        });

        return false;
    });

    // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
    $(document).click(function () {
        $('#notificationsBox').hide();

    });

    $('#notificationsBox').click(function () {
        return false;       // DO NOTHING WHEN CONTAINER IS CLICKED.
    });
});

 



sendInvitation = (receiverId,name) =>
{
    let message = "inv,"+receiverId+","+name
    App.notification.send_msg(message)
}

informJoined = (receiverId,name,meal)=>
{
    let message = "inv,"+receiverId+","+name+","+meal
    App.notification.send_msg(message)
}