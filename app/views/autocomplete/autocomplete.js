//the var of input element
let friendInvite = document.getElementById("friendName");
//the var of div element that names shown in it
let friendsBox = document.getElementsByClassName("invited")[0];
//this array has the name of invited friends
let friendsArr = [];
//this array has the name that shoud be from database to caan do auto complete
let availableFriends = ["motaz","ali"];
//function to make auto complete that take the input and the source array
$(function() {
    availableFriends;
    $( "#friendName" ).autocomplete({
        source: availableFriends
    });
} );
//function when click enter
friendInvite.addEventListener('keypress', function (e) {

    let key = e.which || e.keyCode;
    //the value of input
    let friendName = friendInvite.value;
    //search on value in 2 array to find the index of it
    let searchRes = friendsArr.indexOf(friendName);
    let searcheInAuto = availableFriends.indexOf(friendName);
    //condition check on the value of key "enter = 13" and the index of value in 2 array
    if (friendName.length > 0 && searchRes === -1 && searcheInAuto !== -1 && key === 13) {
        //push the element in friendsArr array
        friendsArr.push(friendName);
        friendInvite.value = "";
        //search on the index of the value in available
        let indexofauto = availableFriends.indexOf(friendName);
        //delete the element of the array so it will not be autocompleted
        availableFriends.splice(indexofauto, 1);
        //create the parent div element
        let friendDiv = document.createElement("div");
        friendDiv.style.cssFloat = "left";
        friendDiv.style.paddingLeft = "5px";
        friendDiv.style.marginRight = "2px";
        friendDiv.style.marginTop = "2px";
        // friendDiv.style.paddingRight = "5px";
        friendDiv.style.backgroundColor = "#abaad3";
        friendDiv.style.borderRadius = "5px";
        //create div that contain tow span element
        let dataDiv = document.createElement("div");
        //create span with name friend invited
        let friend = document.createElement("span");
        friend.appendChild(document.createTextNode(friendName));
        dataDiv.appendChild(friend);
        //create span with "x" to delete element
        let removeBtn = document.createElement('span');
        removeBtn.appendChild(document.createTextNode("x"));
        removeBtn.style.color = "red";
        removeBtn.style.cursor = 'move';
        removeBtn.style.padding= "5px";
        //append elements to div and to pareent
        dataDiv.appendChild(removeBtn);
        friendDiv.appendChild(dataDiv);
        friendsBox.appendChild(friendDiv);
        //create function on "x" span to delete the element
        removeBtn.addEventListener("click", (event) => {
            let index = friendsArr.indexOf(event.target.parentElement.childNodes[0].innerHTML);
            availableFriends.push(friendsArr[index]);
            friendsArr.splice(index, 1);
            event.target.parentElement.parentElement.remove();
        });
    }
});