

function validar(pessoa){

    
    var nomeClass = "grade-"+pessoa
    var gradeStudent = document.getElementsByClassName(nomeClass)    // by class name sempre retorna HTML collection
    console.log(gradeStudent[0].value)


    var selects = document.getElementsByClassName(pessoa);

        let notas = "";
        // pegando valores dos selects
        for (let i = 0; i < 4; i++) {
            // armazenando dentro de uma string
            if(i === 3){
                notas +=  selects[i].options[selects[i].selectedIndex].value;

            }else if(i == 4){
                break;

            } else{
                notas +=  selects[i].options[selects[i].selectedIndex].value + " + ";    
            }
        
        }

        
    verifyPerson(pessoa, notas);
}



