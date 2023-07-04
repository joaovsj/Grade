

import {request} from "./request.js" ;
const form = document.querySelector("#form");
const msg = document.querySelector(".message");


// analisa uma string json e retorna um objeto
const data = JSON.parse(localStorage.getItem("person"))
const title = document.getElementById("title");
title.innerText = "Bem vindo(a) "+ data.teacher_name;


const id = data.teacher_id
form.addEventListener('submit', (event)=>{
    event.preventDefault();

    let data = new FormData(form);
    const teacher_id = data.teacher_id;    
    data.append("id", id)

    request('pattern', 'POST', data, (response)=>{

        let p = document.createElement("p");
        if(response.status == true){
            
            p.innerHTML = "Fórmula cadastrada com sucesso!"
            msg.classList.add("success", "active");
            msg.appendChild(p);
            
        
        }else{ 
            p.innerHTML = "Erro ao realizar cadastro!";
            msg.classList.add("error", "active");
            msg.appendChild(p);
        }

    })
    
});