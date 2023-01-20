window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(priceInput.value/10);

    const addTaxDom = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(priceInput.value - (priceInput.value/10));
  })
});