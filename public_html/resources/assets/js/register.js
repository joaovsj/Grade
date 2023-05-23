const form = document.querySelector("#form");

form.addEventListener('submit', (event)=>{
    event.preventDefault();

    let data = new FormData(form);
    request("POST", data, (response)=>{
        alert(response.status)
    })
});