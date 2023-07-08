





function validar(pessoa){
    
    var selects = document.getElementsByClassName(pessoa);

        let nota = "";
        // pegando valores dos selects
        for (let i = 0; i < 4; i++) {
            // armazenando dentro de uma string
            if(i === 3){
                nota +=  selects[i].options[selects[i].selectedIndex].value;
            }else if(i == 4){
                break;
            } else{
                nota +=  selects[i].options[selects[i].selectedIndex].value + " + ";    
            }
        
        }
    
    getPatterns(nota, pessoa);
}



