import 'dart:convert';
import 'dart:io';

import 'package:console_shop/Models/product.dart';

class ShoppingMall {
  List<Product> productList = [];
  int totalPrice = 0;
  Map<String, int> cart = {};

  ShoppingMall() {
    productList.add(Product("셔츠", 45000));
    productList.add(Product("원피스", 30000));
    productList.add(Product("반팔티", 35000));
    productList.add(Product("반바지", 38000));
    productList.add(Product("양말", 5000));
  }

  void showProducts() {
    for (int i = 0; i < productList.length; i++) {
      print("${productList[i].name} / ${productList[i].price}원");
    }
  }

  void addToCart() {
    print("상품 이름을 입력해 주세요 !");
    String? productName = stdin.readLineSync(encoding: utf8);
    if (productName != null && productName.isNotEmpty) {
      print("선택하신 상품 : $productName");
    }
    print("상품 개수를 입력해 주세요 !");
    String? productCount = stdin.readLineSync(encoding: utf8);
    try {
      // if (!(productName == null || productCount == null)) {
      if (!productList.map((p) => p.name).toList().contains(productName)) {
        print("productName : $productName");
        throw FormatException("");
      } else {
        print(productName);
        print(productCount);
        cart[productName!] = int.parse(productCount!);
        // cart[Product(productName!, productList.firstWhere((p) => p.name == productName).price)] = int.parse(productCount!);
      }
      // }
    } on FormatException {
      print("입력값이 올바르지 않아요 !");
    } catch (e) {
      print("");
    }
  }

  void printTotalPrice() {
    print("");
  }
}
