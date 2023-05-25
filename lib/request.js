
// Sending a request
export default function request(method, url, data){
    axios({
        method: method,
        url: url,
        data: data,
      }).then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.error(error);
      });
}
