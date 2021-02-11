window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.trunc(inputValue * 0.1)
    addTaxDom.innerHTML = tax
    profit.innerHTML = inputValue - tax

  })
});