
import {request} from "./request.js" ;
const form = document.querySelector("#form");
const msg = document.querySelector(".message");

form.addEventListener('submit', (event)=>{
    event.preventDefault();

    let data = new FormData(form); 
    request('student', 'POST', data, (response)=>{

        let p = document.createElement("p");
        if(response.data == true){
            
            p.innerHTML = "Cadastro realizado com sucesso!"
            msg.classList.add("success", "active");
            msg.appendChild(p);
            
        
        }else{ 
            p.innerHTML = "Erro ao realizar cadastro!";
            msg.classList.add("error", "active");
            msg.appendChild(p);
        }


    })
    
});