import 'dart:convert';
import 'dart:io';

import 'package:console_shop/Models/product.dart';

/// 쇼핑몰 기능을 담당하는 클래스
class ShoppingMall {
  /// 상품 리스트 (초기화 시 기본 상품 5개 추가)
  List<Product> productList = []; // 상품 리스트

  /// 장바구니에 담긴 상품의 총 가격
  int totalPrice = 0; // 장바구니에 담긴 총 가격

  /// 장바구니 (상품명: 수량)
  Map<String, int> cart = {}; // 장바구니

  /// 생성자: 객체 생성 시 상품 리스트에 기본 상품 추가
  ShoppingMall() {
    productList.add(Product("셔츠", 45000));
    productList.add(Product("원피스", 30000));
    productList.add(Product("반팔티", 35000));
    productList.add(Product("반바지", 38000));
    productList.add(Product("양말", 5000));
  }

  /// 메인 메뉴 출력 함수
  void printMenu() {
    int barCnt = 126;
    print("-" * barCnt);
    print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화");
    print("-" * barCnt);
  }

  /// 상품 목록을 출력하는 함수
  /// "상품 이름 / 상품 가격" 형식으로 출력
  void showProducts() {
    for (int i = 0; i < productList.length; i++) {
      print("${productList[i].name} / ${productList[i].price}원");
    }
  }

  /// 사용자가 입력한 상품명과 수량을 받아 장바구니(cart)에 추가하는 함수
  /// - 상품명과 수량을 프롬프트로 입력받음
  /// - 입력값이 유효한지(존재하는 상품명인지, 수량이 숫자인지) 확인
  /// - 유효하지 않으면 에러 메시지 출력
  /// - 유효하면 장바구니에 해당 상품과 수량을 추가하고, 총 가격(totalPrice) 갱신
  /// - 예외 발생 시 적절한 메시지 출력
  void addToCart() {
    // 상품명 입력 받기
    String? productName = makePrompt("뭐 담을래?");
    // 수량 입력 받기
    String? productCount = makePrompt("몇개 담을래?");
    try {
      // 입력값이 null이면 함수 종료
      if (productName == null || productCount == null) return;

      // 상품명이 상품 목록에 없는 경우 예외 발생
      if (!productList.any((p) => p.name == productName)) {
        throw FormatException("");
      }

      // 장바구니에 해당 상품이 없다면 상품과 수량 추가
      // 장바구니에 해당 상품이 있다면 수량만 추가
      cart[productName] = (cart[productName] ?? 0) + int.parse(productCount);

      // 총 가격 갱신
      totalPrice += (productList.firstWhere((p) => p.name == productName).price * int.parse(productCount));
    } on FormatException {
      // 입력값이 잘못된 경우 에러 메시지 출력
      print("입력 똑바로 ㅡㅡ");
    } catch (e) {
      // 기타 예외 발생 시 처리
      print("");
    }
  }

  /// 프롬프트 메시지를 출력하고 사용자 입력을 받아 반환하는 함수
  String? makePrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync(encoding: utf8);
  }

  /// 장바구니에 담긴 상품들의 총 가격을 출력하는 함수
  /// - 장바구니가 비어있으면 안내 메시지 출력
  /// - 비어있지 않으면 각 상품명, 개수, 총 가격 출력
  void printTotalPrice() {
    if (cart.isEmpty) {
      print("아무것도 없는데?");
    } else {
      print("${cart.entries.map((e) => "${e.key} ${e.value}개").join(", ")} 담겨있네");
      print("다 해서 $totalPrice원");
    }
  }

  /// 장바구니를 비우는 함수
  /// - 장바구니가 비어있으면 안내 메시지 출력
  /// - 비어있지 않으면 장바구니 비우기
  void clearCart() {
    if (cart.isEmpty) {
      print("이미 아무것도 없어~");
    }
    cart.clear();
  }
}
