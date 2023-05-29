
import {request} from "./login"
const password = document.querySelector("#password");
const icon = document.querySelector("#icon-password");
const form = document.querySelector("#form");

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
    request("teacher","POST", data, (response)=>{
        alert(response.status)
    })
});

