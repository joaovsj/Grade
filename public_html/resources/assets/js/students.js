
import {request} from "./request.js" ;
const form = document.querySelector("#form");
const msg = document.querySelector(".message");

form.addEventListener('submit', (event)=>{
    event.preventDefault();

    let data = new FormData(form); 
    request('student', 'POST', data, (response)=>{

        msg.innerHTML = "";    // zerando conteudo da div 
        let p = document.createElement("p");

        if(response.data == true){
            if(msg.classList.contains("error")){
                msg.classList.remove("error")
            }
            p.innerText = "Cadastro realizado com sucesso!";
            msg.classList.add("success", "active");
            msg.appendChild(p);                
                
        } else {

            if(msg.classList.contains("success")){
                msg.classList.remove("success")
            }

            p.innerText = "Erro ao realizar cadastro!";
            msg.classList.add("error", "active");
            msg.appendChild(p);
            
        }


    })
    
});