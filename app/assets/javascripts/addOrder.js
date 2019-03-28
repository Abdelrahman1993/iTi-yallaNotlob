const addFriend = () => {
    $('.ui.dropdown')
        .dropdown({
            onAdd: function (value, text, $selectedItem) {
                let img = $(`[data-name=\"${text}\"`).data("img")
                const users = document.getElementById("users");
                users.value += `${value},`
            }
        })
}

sendInvitation = (receiverId, name) => {
    let message = "inv," + receiverId + "," + name
    App.notification.send_msg(message)
}

submitInvitations = () => {
    const groupUsers = document.getElementsByClassName("groupUsers");
    const usersNotify = document.getElementsByClassName("usersNotify");

    let data = [];
    let dataForNotifications = [];
    [...groupUsers].forEach((group) => {
        data.push(group.dataset.users)
        let userNames = group.dataset.usernames.replace(/(\r\n|\n|\r)/gm, "").split(',');
        userNames.forEach((user) => {
            let trimmedUser = user.trim()
            dataForNotifications.push(trimmedUser);
        })
        dataForNotifications.pop()
    });
    [...usersNotify].forEach((user) => {
        dataForNotifications.push(user.dataset.name);
    })
    dataForNotifications = [...new Set(dataForNotifications)];
    // let ids = document.getElementById("users").value.split(",").filter(value => value.length >0);
    // let names = document.getElementById("users").dataset.names.split(",").filter(value => value.length >0);


    dataForNotifications.forEach((data) => {
        let id = data[0]
        let name = data.substr(1, data.length)
        console.log(id,name)
        sendInvitation(id, name);
    });


}