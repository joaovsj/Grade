
import {request} from "./request"
const password = document.querySelector("#password");
const icon = document.querySelector("#icon-password");
const form = document.querySelector("form");
const msg = document.querySelector(".message");

icon.addEventListener('click', ()=>{
    
    if(password.type == "password"){
        password.setAttribute('type', 'text');
        icon.classList.add('hide');
    }else{
        password.setAttribute('type', 'password');
        icon.classList.remove('hide');
    }

});

form.addEventListener('submit', (event)=>{
    event.preventDefault();

    let data = new FormData(form);
    request("login?controller=teacher","POST", data, (response)=>{
        
        console.log(response);

        if(response.data){
            
            window.location.href = "public_html/resources/views/panel.html";
            
        }else{ 
            if(msg.innerHTML == ""){
                let p = document.createElement("p");
                p.innerHTML = "Dados inválidos!";
                msg.classList.add("active", "error");
                msg.appendChild(p);
            }
        }
    })
});

