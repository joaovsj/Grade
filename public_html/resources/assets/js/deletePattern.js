


function excluir(id){
    
    const object = {
        id: id
    }

    fetch('http://localhost/grade/public_html/api/pattern', {
        method: 'DELETE', 
        body: JSON.stringify(object)

    }).then(response => {

        console.log(response);
        response.json();

    }).then(jsonBody => {
        
        window.location.reload();
    });

}  
