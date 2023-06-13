
const data = JSON.parse(localStorage.getItem("person"))
const title = document.getElementById("title");
title.innerText = "Bem vindo(a) "+ data.teacher_name;

const form = document.getElementById("form");

// form.addEventListener('submit', (event)=>{
//     event.preventDefault();

//     let data = new FormData(form);
//     request("teacher","POST", data, (response)=>{

//         if(response.status == true){
//             alert("Error");
//         }else{ 
//             alert('Success');
//         }   
//     })
// });