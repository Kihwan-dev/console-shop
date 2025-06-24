import 'dart:convert';

import 'package:console_shop/Models/shopping_mall.dart';
import 'dart:io';

void main(List<String> arguments) {
  ShoppingMall shoppingMall = ShoppingMall();

  String? inputCommand;

  while (inputCommand != "4") {
    print(
        "--------------------------------------------------------------------------------------------------------");
    print(
        "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료");
    print(
        "--------------------------------------------------------------------------------------------------------");

    inputCommand = stdin.readLineSync(encoding: utf8);

    switch (inputCommand) {
      case "1":
        shoppingMall.showProducts();
        break;
      case "2":
        shoppingMall.addToCart();
        break;
      case "3":
        // shoppingMall.printTotalPrice();
        break;
      case "4":
        break;
      default:
        print("❗️잘못된 입력입니다. 1~4 중에서 선택해주세요.");
    }
  }

  // shoppingMall.showProducts();
}
