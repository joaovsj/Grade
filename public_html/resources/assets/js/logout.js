

const state = localStorage.getItem("status")

function logout(){
    localStorage.clear()
    window.location.href = "http://localhost/grade/index";
}

