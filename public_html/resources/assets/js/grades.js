

import {request} from "./request.js" ;
const options = document.querySelector("#options")
const tbody = document.querySelector("#content-table"); 






// for(let button of buttons){

//     console.log('teste')

// }

// for(let i=0; i< buttons.length; i++){
//     console.log(buttons[i])
// }

// console.log(buttons)
// buttons.forEach(button => {
//     console.log(button)
//     // button.addEventListener('click', () => {
        
//     //     console.log(button)
 
//     // })
// })

// buttons.forEach(button => {
   
//     button.addEventListener('click', () => {
        
//         console.log(button)
//      /*   var pessoa = button.value;
//         var selects = document.getElementsByClassName(pessoa);

//         let nota = "";
//         // pegando valores dos selects
//         for (let i = 0; i < 4; i++) {
//             // armazenando dentro de uma string
//             if(i === 3){
//                 nota +=  selects[i].options[selects[i].selectedIndex].value;
//             }else if(i == 4){
//                 break;
//             } else{
//                 nota +=  selects[i].options[selects[i].selectedIndex].value + " + ";    
//             }
        
//         }
//         getPatterns(nota, pessoa);
//       */  
//     })
// })

request('assignment', "GET", null, (response) => {
    
    const body = response.data;

    body.forEach(option => {
        options.innerHTML+=`
            <option value="">${option.assingment_name}</option>
        `
    });
})


const getPatterns = (notas, pessoa) => {

    request("pattern", "GET", null, (response)=>{
        const patterns = response.data;

        console.log(notas);
        console.log(patterns);
        console.log(pessoa);
  
        patterns.forEach(pattern => {
            var regra = pattern.pattern_formula;
            var apenasRegra = regra.split(" = ");
            
            if(notas === apenasRegra[0]){
                const notaFinal = apenasRegra[1];
                var input = document.getElementById(pessoa);
                input.value = notaFinal
            }
        })
    })
}


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
                    <td>
                        <input type="text" name="media" id="${student.student_id}" class="1">
                    </td>
            </tr>    
        `
    })
})


/*
request('student', "GET", null, (response) => {
    
    // const students = response.data;        
    const tbody = document.querySelector("#content-table");

    //  students.forEach(student => {
    
        tbody.innerHTML=`
<tr>                   
                        <td>any name</td>
                        <td>
                            <select name="primeira" class="1">
                            <option value="">Nota Final</option>
                            <option value="MB">MB</option>
                            <option value="B">B</option>
                            <option value="R">R</option>
                            <option value="I">I</option>
                            </select>
                        </td>
                        <td>
                            <select name="segunda" class="1">
                            <option value="">Nota Final</option>
                                <option value="MB">MB</option>
                                <option value="B">B</option>
                                <option value="R">R</option>
                                <option value="I">I</option>
                        </select>
                        </td>
                        <td>
                            <select name="terceira" class="1">
                                <option value="">Nota Final</option>
                                <option value="MB">MB</option>
                                <option value="B">B</option>
                                <option value="R">R</option>
                                <option value="I">I</option>
                            </select>
                        </td>
                        <td>
                            <select  name="quarta" class="1">
                                <option value="">Nota Final</option>
                                <option value="MB">MB</option>
                                <option value="B">B</option>
                                <option value="R">R</option>
                                <option value="I">I</option>
                            </select>
                        </td>
            
                        <td class="last-items">
                            <button type="button" class="btn" onclick="javascript:validar()">Validar</button>
                        </td>
                        <td>
                            <input type="text" name="media" id="1" class="1">
                        </td>
                </tr>         
        `
    })
*/




/*

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
                <button type="button" class="btn" value="${student.student_id}">Validar</button>
            </td>
            <td>
                <input type="text" name="media" id="${student.student_id}" class="${student.student_id}">
            </td>
    </tr> 

*/ 



