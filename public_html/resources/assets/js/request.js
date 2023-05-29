
export const request = async (path, method, data, funcCallBack) => {

    const API = "public_html/api/"+path;
    const response = await fetch(API, {
        method: method,
        body: data
    });

    const jsonBody = await response.json();
    funcCallBack(jsonBody);
}