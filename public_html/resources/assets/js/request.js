
const API = "http://localhost/grade/public_html/api/teacher";

const request = async (method, data, funcCallBack) => {

    const response = await fetch(API, {
        method: method,
        body: data
    });

    const jsonBody = await response.json();
    funcCallBack(jsonBody);
}