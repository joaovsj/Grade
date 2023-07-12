

import {request} from "./request.js" ;
const options = document.querySelector("#options")
const tbody = document.querySelector("#content-table"); 


request('assignment', "GET", null, (response) => {
    
    const body = response.data;

    body.forEach(option => {
        options.innerHTML+=`
            <option value="${option.assignment_id}">${option.assingment_name}</option>
        `
    });
})

request('student', "GET", null, (response) => {

    const students = response.data;    

    students.forEach(student => {
        tbody.innerHTML += `
                <tr>                   
                    <td>${student.student_name}</td>
                    <td>
                        <select name="primeira" class="${student.student_id}">
                        <option value="">Nota Final</option>
                        <option value="MB">MB</option>
                        <option value="B">B</option>
                        <option value="R">R</option>
                        <option value="I">I</option>
                        </select>
                    </td>
                    <td>
                        <select name="segunda" class="${student.student_id}">
                        <option value="">Nota Final</option>
                            <option value="MB">MB</option>
                            <option value="B">B</option>
                            <option value="R">R</option>
                            <option value="I">I</option>
                    </select>
                    </td>
                    <td>
                        <select name="terceira" class="${student.student_id}">
                            <option value="">Nota Final</option>
                            <option value="MB">MB</option>
                            <option value="B">B</option>
                            <option value="R">R</option>
                            <option value="I">I</option>
                        </select>
                    </td>
                    <td>
                        <select  name="quarta" class="${student.student_id}">
                            <option value="">Nota Final</option>
                            <option value="MB">MB</option>
                            <option value="B">B</option>
                            <option value="R">R</option>
                            <option value="I">I</option>
                        </select>
                    </td>

                    <td class="last-items">
                        <button type="button" class="btn" value="1" onClick="javascript:validar(${student.student_id})">Validar</button>
                    </td>
                    <td class="show">
                        <input type="text" name="media" id="${student.student_id}" class="1">
                        <input type="hidden" name="grade" value="" class="grade-${student.student_id} notes">
                    </td>
            </tr>    
        `
    })
})




// second part

const btn = document.getElementById("save")
const form = document.getElementById("form")
const msg = document.querySelector(".message");

btn.addEventListener('click', ()=>{
    
    let data = new FormData(form);  

    const assignment = data.get('tarefa');
    
    request('student', 'GET', null, (response) => {
        

        const students = response.data
        const allContent = []
        
        students.forEach( student => {
            
            var nota = document.getElementById(student.student_id).value; 

            let contentInsert = new FormData();
            contentInsert.append("assignment_grade", nota);
            contentInsert.append("assignment_fk", assignment);
            contentInsert.append("student_fk", student.student_id);

            request('grade', "POST", contentInsert, (response) => {
                
                msg.innerHTML = "";    // zerando conteudo da div 
                let p = document.createElement("p");
        
                p.innerText = "Cadastro realizado com sucesso!";
                msg.classList.add("success", "active");
                msg.appendChild(p);                
                        

            });

        }); 
    })
})

