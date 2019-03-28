const addFriend = ()=>{
    $('.ui.dropdown')
    .dropdown({
        onAdd: function (value, text, $selectedItem) {
            let img = $(`[data-name=\"${text}\"`).data("img")
            const users = document.getElementById("users");
                users.value += `${value},`
            }
        })
}

sendInvitation = (receiverId,name) =>
{
    let message = "inv,"+receiverId+","+name
    App.notification.send_msg(message)
}

submitInvitations=()=>{
let ids = document.getElementById("users").value.split(",").filter(value => value.length >0);
let names = document.getElementById("users").dataset.names.split(",").filter(value => value.length >0);

ids.forEach(function(id) {
    sendInvitation(id,names[ids.indexOf(id)]);
  });


}
// [1,2,1,3,2,3][motaz,ahmed,mohammed]