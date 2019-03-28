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
