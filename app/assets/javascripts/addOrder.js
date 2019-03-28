const loadJs = ()=>{

let friendInvite = document.getElementById("friendInvite");
let addFriend = document.getElementById("addFriend");
let fieldset = document.getElementsByClassName("the-fieldset")[0];
let errorMsg = document.getElementById("errorMsg");
let friendsArr = [];
addFriend.addEventListener("click", () => {
    let friendName = friendInvite.value;
    friendInvite.value = "";
    let found = friendsArr.indexOf(friendName);

    if (friendName.length !== 0 && found === -1) {
        friendsArr.push(friendName);
        let friendDiv = document.createElement("div");
        friendDiv.setAttribute("class", "card")
        friendDiv.style.width = "100px";
        friendDiv.style.cssFloat = "left";
        friendDiv.style.marginLeft = "3%";
        friendDiv.style.marginTop = "2%";
        friendDiv.style.textAlign = "center";
        let friendImg = document.createElement("img");
        friendImg.setAttribute("src", "../images/person.png");
        friendImg.setAttribute("width", "100%");
        friendImg.setAttribute("class", "card-img-top");
        let dataDiv = document.createElement("div");
        dataDiv.setAttribute("class", "card-body");

        let friend = document.createElement("a");
        friend.setAttribute("href", "#");
        friend.setAttribute("class", "card-title");
        friend.setAttribute("class", "friendName");
        friend.style.textAlign = "center";
        friend.appendChild(document.createTextNode(friendName));
        dataDiv.appendChild(friend);
        let removeBtn = document.createElement('Button');
        removeBtn.setAttribute('type', 'button');
        removeBtn.setAttribute('class', 'btn btn-danger btn-sm');
        removeBtn.appendChild(document.createTextNode("Remove"));
        dataDiv.appendChild(removeBtn);
        friendDiv.appendChild(friendImg);
        friendDiv.appendChild(dataDiv);
        fieldset.appendChild(friendDiv);
        removeBtn.addEventListener("click", (event) => {
            let index = friendsArr.indexOf(event.target.parentElement.parentElement.childNodes[1].innerHTML);
            friendsArr.splice(index, 1);
            console.log(friendsArr);
            event.target.parentElement.parentElement.remove();
        });
    }
});
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
