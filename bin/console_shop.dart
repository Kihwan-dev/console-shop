import 'dart:convert';

import 'package:console_shop/Models/shopping_mall.dart';
import 'dart:io';

import 'package:console_shop/Models/menu_options.dart';

void main(List<String> arguments) {
  ShoppingMall shoppingMall = ShoppingMall();

  String? inputCommand;
  MenuOptions? selectedOption;

  while (selectedOption != MenuOptions.realExit) {
    shoppingMall.printMenu();

    inputCommand = stdin.readLineSync(encoding: utf8);
    selectedOption = parseMenu(inputCommand);

    switch (selectedOption) {
      case MenuOptions.showProducts:
        shoppingMall.showProducts();
        break;
      case MenuOptions.addToCart:
        shoppingMall.addToCart();
        break;
      case MenuOptions.printTotalPrice:
        shoppingMall.printTotalPrice();
        break;
      case MenuOptions.exitPrompt:
        print("진짜 갈꺼야?");
        var confirm = stdin.readLineSync(encoding: utf8);
        if (confirm == "5") {
          print("다음에 또와 ^^");
          selectedOption = MenuOptions.realExit;
        }
        break;
      case MenuOptions.clearCart:
        shoppingMall.clearCart();
        break;
      default:
        print("어허 눈 똑바로 뜨고 숫자를 잘 봐야지~?");
    }
  }
}
