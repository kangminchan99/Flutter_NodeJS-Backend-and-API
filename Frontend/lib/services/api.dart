import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_node_front/model/product_model.dart';
import 'package:http/http.dart' as http;

class Api {
  //  클래스 내에서 사용할 API 엔드포인트의 기본 URL을 설정
  static String? baseUrl = dotenv.env['baseUrl'];

  static addproduct(Map pdata) async {
    print(pdata);
    // /add_product 경로로 요청을 보내도록 URL을 생성
    var url = Uri.parse("${baseUrl}add_product");

    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
        //
      } else {
        print("failed to get res");
        //
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get method
  static getProduct() async {
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_product");
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        // for Each - 컬렉션의 각 항목에 대한 반복 작업을 간편하게 처리하는 데 사용됩니다.
        // 람다함수식으로 표현 (익명 함수)
        data['products'].forEach(
          (value) => {
            products.add(
              Product(
                name: value['pname'],
                desc: value['pdesc'],
                price: value['pprice'],
                id: value['id'].toString(),
              ),
            ),
          },
        );
        return products;
        //
      } else {
        //
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // update put method
  static updateProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("fail to update data");
    }
  }

  // delete method

  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");

    final res = await http.post(url);
    if (res.statusCode == 204) {
      print(jsonDecode(res.body));
    } else {
      print('fail to delete');
    }
  }
}
