
$(document).ready(function() {
     getAllData();
   });

   function getAllData(){
    getAllitems();
    // getSingleitem();
    // AddNewitem();
    // getSorteditems();

    // $('button#clear').on('click', function (event) {
      event.preventDefault()
      // resetPage()
    // })
  }
  //getting all items
  function getAllitems(){
    $('#all-items').on('click', function(event) {

  
        event.preventDefault();

        $.ajax({
              url: 'http://localhost:3000/categories',
              method: 'get',
              dataType: 'json',
              success: function (data) {
        
              $("#items-data").html("") // reset the page on loading 
          
             data.forEach((section)=>{
              let categoryName="<h2>"+section["category_name"]+"</h2>";

              let table="<table><tr><th>ID</th><th>NAME</th><th>PRICE</th><th>ISBN</th><th>DESCRIPTION</th>th>Photo</th></tr>"
              table=categoryName+table
              let itemsName=section.items.forEach(function(item){
                let text=`
                  <tr>
                    <td>${item.item_name}</td>
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

       
            // document.getElementById('categories-data').innerHTML = categoriesHTML;
        
              }
          })
      })

  }

  //  //items's class
  //  class Category {
  //    constructor(obj) {
  //      this.category_name = obj.category_name
  //    }
    
   
  //  class Item {
  //   constructor(obj) {
  //   this.id = obj.id
  //   this.item_name = obj.item_name
    
  // }
//   static allCategories(categories) {
//     const categoryDivs = categories.forEach(category =>{
    
//       return( 
//         `<div id="category">
//         <p>${category.category_name}</p>
//         <div>`
//       )
//     }).join('')
//     return categoryDivs;
//   }
// }
 

  //   static allItems(items) {
  //     const itemDivs = items.map(item =>{
      
  //       return( 
  //         `<div id="item">
  //         <p>${item.item_name}</p>
  //         <div>`
  //       )
  //     }).join('')
  //     return itemDivs;
  //   }
         
  // } 
    
      
        // }
      

        // function getAllitems(){
        //   $('#all-items').on('click', function(event) {
      
        //     alert("See me!!")
        //       event.preventDefault();
      
        //       $.ajax({
        //             url: 'https://localhost:3000/categories',
        //             method: 'get',
        //             dataType: 'json',
        //             success: function (data) {
        //                 console.log(data);
      
        //           // const categoriesHTML = Category.allCategories(data[0]);
        //          for(let i = 0; i < data[i].length; i++) {
      
        //           let itemArray = data[i].child;
      
        //           for(let j = 0; j < itemArray.length; j++) {
        //           const itemsHTML = Item.allItems(itemArray);
                 
      
             
        //           // document.getElementById('categories-data').innerHTML = categoriesHTML;
        //           document.getElementById('items-data').innerHTML = itemsHTML;
        //             }
        //           }
        //         }
        //         })
        //     })
      
        // }
      
    