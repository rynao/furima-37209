function calculate (){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('input',() => {
    tax.innerHTML = price.value * 0.1;
    profit.innerHTML = price.value - tax.innerHTML;
  });
};


window.addEventListener('load',calculate);