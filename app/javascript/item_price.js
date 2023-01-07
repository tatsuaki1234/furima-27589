// window.addEventListener('load', () => {
//   const priceInput = document.getElementById("item-price");
  

//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;

//     const addTaxDom = document.getElementById("add-tax-price")
//     addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

//     const profit = document.getElementById("profit")
//     profit.innerHTML = (Math.floor(inputValue - inputValue * 0.1));
// })
// })



    window.addEventListener('load', () => {
      const priceInput = document.getElementById("item-price");
       priceInput.addEventListener("input", () => {
         const addTaxDom = document.getElementById("add-tax-price");
         addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
         const addPofitDom = document.getElementById("profit");
         addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
     })
    });