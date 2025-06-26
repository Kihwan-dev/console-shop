enum MenuOptions {
  showProducts,
  addToCart,
  printTotalPrice,
  exitPrompt,
  realExit,
  clearCart,
}

MenuOptions? parseMenu(String? input) {
  switch (input) {
    case "1":
      return MenuOptions.showProducts;
    case "2":
      return MenuOptions.addToCart;
    case "3":
      return MenuOptions.printTotalPrice;
    case "4":
      return MenuOptions.exitPrompt;
    case "5":
      return MenuOptions.realExit;
    case "6":
      return MenuOptions.clearCart;
    default:
      return null;
  }
}