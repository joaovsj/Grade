const inputs = document.querySelectorAll("input");

inputs.forEach(input => {
    input.addEventListener('focus', () => {input.style.outline="1px solid rgba(3, 172, 191, 1)"});
    input.addEventListener('focusout', () => {input.style.outline="1px solid #cfcfcf"});
});