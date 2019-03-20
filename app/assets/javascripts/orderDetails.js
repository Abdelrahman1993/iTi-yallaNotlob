$("#item_submit").on('click',function(event){

    event.preventDefault();
    let item_name = $("#item_name").val();
    let item_amount = $("#item_amount").val();
    let item_price = $("#item_price").val();
    let item_comment = $("#item_comment").val();
    var markup = `
    <tr>
    <th scope="row">Ali</th>
    <td>${item_name}</td>
    <td>${item_amount}</td>
    <td>${item_price}</td>
    <td>${item_comment}</td>
    <td><button type="button" class="btn btn-outline-danger btn-sm remove-item" onclick="return this.parentNode.parentNode.remove();">Remove</button></td>
    </tr>`;

    $("#table_body").append(markup);
});
