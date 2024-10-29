export default (() => {
  const products = localStorage.getItem("cart")

  const badgeCart = document.querySelector(".badge-cart")
  if (products) {
    const productsArray = JSON.parse(products)
    badgeCart.textContent = productsArray.length
  } else {
    localStorage.setItem("cart", JSON.stringify([]))
    badgeCart.textContent = 0
  }
})()