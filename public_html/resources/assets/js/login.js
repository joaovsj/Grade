
import {request} from "./request.js"
const password = document.querySelector("#password");
const icon = document.querySelector("#icon-password");
const form = document.querySelector("form");

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
        
        if(response.data == true){
            window.location.href = "panel.html";
        } else{
            alert('error')
        }
    })
});

