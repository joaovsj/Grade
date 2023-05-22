

const inputs = document.querySelectorAll("input");
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

inputs.forEach(input => {
    input.addEventListener('focus', () => {input.style.outline="1px solid rgba(3, 172, 191, 1)"});
    input.addEventListener('focusout', () => {input.style.outline="1px solid #cfcfcf"});
});