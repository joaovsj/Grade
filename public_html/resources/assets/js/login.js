
const password = document.querySelector("#password");
const icon = document.querySelector("#icon-password");


icon.addEventListener('click', ()=>{
    
    if(password.type == "password"){
        password.setAttribute('type', 'text');
        icon.classList.add('hide');
    }else{
        password.setAttribute('type', 'password');
        icon.classList.remove('hide');
    }

});
