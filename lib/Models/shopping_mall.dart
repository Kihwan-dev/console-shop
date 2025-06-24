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
    print("뭐 담을래?");
    String? productName = stdin.readLineSync(encoding: utf8);
    print("몇개 담을래?");
    String? productCount = stdin.readLineSync(encoding: utf8);
    try {
      if (!(productName == null || productCount == null)) {
        if (!productList.map((p) => p.name).toList().contains(productName)) {
          throw FormatException("");
        } else {
          cart[productName] = int.parse(productCount);

          totalPrice += (productList.firstWhere((p) => p.name == productName).price * int.parse(productCount));
          // cart[Product(productName!, productList.firstWhere((p) => p.name == productName).price)] = int.parse(productCount!);
        }
      }
    } on FormatException {
      print("입력 똑바로 ㅡㅡ");
    } catch (e) {
      print("");
    }
  }

  void printTotalPrice() {
    if (cart.isEmpty) {
      print("아무것도 없는데?");
    } else {
      print("${cart.entries.map((e) => "${e.key} ${e.value}개").join(", ")} 담겨있네");
      print("다 해서 $totalPrice원");
    }
  }

  void clearCart() {
    if (cart.isEmpty) {
      print("이미 아무것도 없어~");
    }
    cart.clear();
  }
}
