window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  // priceInput.addEventListener("input", () => {
    // console.log(priceInput);
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // addTaxDom.innerHTML = "(inputValue)/0.1"
    // addTaxDom.innerHTML = ""
    // Math.floor
    // console.log(Math.floor(addTaxPrice));
    // add-tax-price
    // profit
    // const addTaxPrice = inputValue * 0.1;
    // console.log(addTaxPrice)  
    // console.log(Math.floor(addTaxPrice));
    // addTaxDom.innerHTML = Math.floor(addTaxPrice)

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    const profit = document.getElementById("profit")
    // profit.innerHTML = (Math.floor(inputValue * 1));
    profit.innerHTML = (Math.floor(inputValue - inputValue * 0.1));
})
})

// 金額を入力した数値をpriceInputという変数に格納する
// const priceInput = document.getElementById("金額を入力する場所のid");
// console.log(priceInput);

// const priceInput = document.getElementById("金額を入力する場所のid");
// priceInput.addEventListener("input", () => {
//    console.log("イベント発火");
// })

// const priceInput = document.getElementById("item-price");
// priceInput.addEventListener("input", () => {
//    console.log("イベント発火");
// })