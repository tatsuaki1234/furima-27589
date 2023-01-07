const pay = ()=> {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY)
  const elements = payjp.elements();

  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        return false;
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("charge-form").submit();
    });
  })
}

window.addEventListener("load", pay);







// const pay = () => {
//   Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
//   const submit = document.getElementById("button");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault();

//     const formResult = document.getElementById("card_form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("order_address[number]"),
//       cvc: formData.get("order_address[cvc]"),
//       exp_month: formData.get("order_address[exp_month]"),
//       exp_year: `20${formData.get("order_address[exp_year]")}`,
//     };

//     Payjp.createToken(card, (status, response) => {
//       if (status == 200) {
//         const token = response.id;

//         const renderDom = document.getElementById("card_form");
//         const tokenObj = `<input value=${token} name='token' type="hidden"> `;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//       }

//       document.getElementById("card-number").removeAttribute("name");
//       document.getElementById("card-cvc").removeAttribute("name");
//       document.getElementById("card-exp-month").removeAttribute("name");
//       document.getElementById("card-exp-year").removeAttribute("name");

//       document.getElementById("card_form").submit();
//     });
//   });
// };

// window.addEventListener("load", pay);



