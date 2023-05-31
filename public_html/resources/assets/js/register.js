
import {request} from "./request.js"
const form = document.querySelector("#form");

form.addEventListener('submit', (event)=>{
    event.preventDefault();

    let data = new FormData(form);
    request("teacher","POST", data, (response)=>{
        alert(response.status)
    })
});