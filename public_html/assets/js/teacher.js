import request from '../../../lib/request.js'

const form = document.getElementById("send-data")

// Requests
let teacher = {
    create : (data)=>{
        request("post", "localhost/grades/public_html/api/teacher", data, 
        (response)=>{
            console.log(response)
        })
    }
}

// Actions
let teacherActions = {
    "create" : form .addEventListener("submit", (event)=>{
        event.preventDefault()

        //variables
        let data = new FormData(form)
        let values = {}

        // entries() gives the name and the value of input, so pair[0] = key, pair[1] = value 
        for(let pair of data.entries()){
            values[pair[0]] = pair[1]
        }

        teacher.create(values)
    })
}