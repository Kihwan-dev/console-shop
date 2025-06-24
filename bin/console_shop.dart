import 'dart:convert';

import 'package:console_shop/Models/shopping_mall.dart';
import 'dart:io';

void main(List<String> arguments) {
  ShoppingMall shoppingMall = ShoppingMall();

  String? inputCommand;

  while (inputCommand != "5") {
    print(
        "----------------------------------------------------------------------------------------------------------------------------");
    print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화");
    print(
        "----------------------------------------------------------------------------------------------------------------------------");

    inputCommand = stdin.readLineSync(encoding: utf8);

    switch (inputCommand) {
      case "1":
        shoppingMall.showProducts();
        break;
      case "2":
        shoppingMall.addToCart();
        break;
      case "3":
        shoppingMall.printTotalPrice();
        break;
      case "4":
        print("진짜 갈꺼야?");
        inputCommand = stdin.readLineSync(encoding: utf8);
        if (inputCommand == "5") print("다음에 또와 ^^");
        break;
      case "6":
        shoppingMall.clearCart();
        break;
      default:
        print("어허 눈 똑바로 뜨고 숫자를 잘 봐야지~?");
        inputCommand = "";
    }
  }

  // shoppingMall.showProducts();
}
