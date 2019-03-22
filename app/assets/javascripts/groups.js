addGroup =()=>{
    groupNameInp = document.getElementById("grpName");
    if(groupNameInp.value.length>0)
    {
        let groupname = document.createTextNode(groupNameInp.value);
        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        td2.classList.add("pr-0");
        let Grouph5 = document.createElement("h5");
        Grouph5.classList.add("groupName");
        let i1 = document.createElement("i");
        i1.addEventListener("click", displayGroup.bind(this, groupNameInp.value));
        td1.addEventListener("click", displayGroup.bind(this, groupNameInp.value));
        // document.getElementById('someelem').addEventListener('click', callback(x, y));

        let i2 = document.createElement("i");
        i1.classList.add("fas","fa-user-plus","fa-lg","pr-4");
        i2.classList.add("fas","fa-user-times","fa-lg");
        i1.onclick ="displayGroup('grp22')";
        let newGroup = document.createElement("tr");
        let myGroups = document.getElementById("myGroups");

        Grouph5.appendChild(groupname);
        td1.appendChild(Grouph5);
        td2.appendChild(i1);
        td2.appendChild(i2);
        newGroup.appendChild(td1);
        newGroup.appendChild(td2);
        myGroups.appendChild(newGroup);
        groupNameInp.value="";

        $('.fa-user-times').on('click',$(this), function(e){
            $(this).closest('tr').remove()
            document.getElementById("singleGroup").style.display="none";
         })
    }
}

displayGroup=(name)=>{
    document.getElementById("groupTitle").innerHTML=name;
    document.getElementById("singleGroup").style.display="block";
}

$(document).ready(function(){
    $('.fa-user-times').on('click',$(this), function(e){
        $(this).closest('tr').remove()
     })
    });
  