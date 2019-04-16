
$(document).ready(function() {
     getAllData();
   });

   function getAllData(){
    getAllItems();
    // getOneItem();
    getSingleItem();
    resetPageOnReloading();
    getFormItem();
    // nextItem();
 
    // $('button#clear').on('click', function (event) {
      // event.preventDefault()
      // resetPage()
    // })
  }

  //get all the items and populate them
  function getAllItems(){
    $('#all-items').on('click', function(event) {
      
  
        event.preventDefault();
      
        $.ajax({
              url: 'https://localhost:3000/categories',
              method: 'get',
              dataType: 'json',
              success: function (data) {
              
             data.forEach((section)=>{
               
              let categoryName="<h2>"+section["category_name"]+"</h2>";

              let table="<table><tr><th>ID </th><th>NAME </th> <th>PRICE </th><th>ISBN </th><th>DESCRIPTION</th>th>Photo</th></tr>"
              table=categoryName+table
              let itemsName=section.items.forEach(function(item){
               

                let text=`
                  <tr>
                    <td><a href='items/${item.id}'>${item.item_name}</a></td>
                    <td>${item.unit_price}</td>
                    <td>${item.tax}</td>
                    <td>${item.quantity}</td>
                    <td>${item.desc}</td>
                   
                  
                  </tr>
                `
                table+=text
              }) 
            
            table+="</table>"
            $('#items-data').append($(table));

            })
              }
          })
      })

  }


 

// reset the page on loading 
function resetPageOnReloading() {
  $("placeholders").html("") 
  }



//Get the info from rails form in json
 function getFormItem() {
$("form#new_item").on("submit", function(e){
  e.preventDefault()
  var $form = $(this);
  var action = $form.attr("action"); //+ ".json";
  var params = $form.serialize()  
  // $.post(action, params)

  $.ajax({
    url: action,
    data: params,
    dataType: "json",
    method: "POST",
  })
  .success(function(json){
    console.log(json)
  })
  .error(function(response){
    console.log("Something went wrong!!!", response)
  })
})
 }


//Get the info from rails form in json best way
function getFormItem() {
  $("form#new_item").on("submit", function(e){
    e.preventDefault()
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize()  
  
    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST",
    })
    .success(function(json){
      var item = new Item(json); //we create a new prototype for this below (takes in the attributes) *
      
      var itemAttr = item.renderSingleItem(); // we take care of this below **
      $("ul.item-list").append(itemAttr);
    })
    .error(function(response){
      console.log("Something went wrong!!!", response)
    })
  })
   }
//this function relates to "var item =new Item(json)" *
// function Item(attributes) {
//   this.id = attributes.id;
//   this.name = attributes.item_name;
//   this.description = attributes.desc;
//   this.price = attributes.unit_price;
//   this.description = attributes.desc;
// }

// //we render the list of items **
// Item.prototype.itemAttr(function() {

// }

function getSingleItem(){
  // $('#item').on('click', function(event) {
    // event.preventDefault();
    $.ajax({
      url: location.href,
      method: 'get',
      dataType: 'json',
      success: function (data) {
        const renderedItem= new Item(data);
        
        document.getElementById('item-data').innerHTML = renderedItem.itemHTML();
      
        console.log(data)
      }
    })
  // })
    
 }


   //items' class
   class Item {
    constructor(attributes) {
      this.id = attributes.id
      this.name = attributes.item_name
      this.description = attributes.desc
      this.price = attributes.unit_price
      this.quantity = attributes.quantity
      this.tax = attributes.tax
      this.photo = attributes.photo_url
  
    
  }
}
// static allItems(items) {
//   data.forEach((section)=>{
           
//     let categoryName="<h2>"+section["category_name"]+"</h2>";

//     let table="<table><tr><th>ID</th><th>NAME</th><th>PRICE</th><th>ISBN</th><th>DESCRIPTION</th>th>Photo</th></tr>"
//     table=categoryName+table
//     let itemsName=section.items.forEach(function(item){
//       let text=`
//         <tr>
//           <td><a href='items/${item.id}'>${item.item_name}</a></td>
//           <td>${item.unit_price}</td>
//           <td>${item.tax}</td>
//           <td>${item.quantity}</td>
//           <td>${item.desc}</td>
         
        
//         </tr>
//       `
//       table+=text
//     }) 
  
//   table+="</table>"
//   $('#items-data').append($(table));

//   })

// }


Item.prototype.itemHTML = function () {  
  return (`
      <h4 class="itemId>Item ID: ${this.id}</h4>
      <h4 class="itemName"> Item Name: ${this.name} </h4>
      <h4 class="itemPrice"> Price: ${this.price}$</h4>
      <h4 class="itemtax"> Tax: ${this.tax}%</h4>
      <h4 class="itemQuantity"> Quantity: ${this.quantity}</h4>
      <h4 class="itemDescription"> Description: ${this.description}</h4>
     
  `)
  
}






       