import 'package:console_shop/Models/product.dart';

class ShoppingMall {
  List<Product> productList = [];
  int totalPrice = 0;
  Map<Product, int> cart = {};

  ShoppingMall() {
    productList.add(Product("셔츠", 45000));
    productList.add(Product("원피스", 30000));
    productList.add(Product("반팔티", 35000));
    productList.add(Product("반바지", 38000));
    productList.add(Product("양말", 5000));
  }

  void showProducts() {
    for(int i=0; i<productList.length; i++) {
      print("${productList[i].name} / ${productList[i].price}원");
    }
  }

  void addToCart(Product product) {
    
  }

  void showTotal() {
    print("");
  }
}