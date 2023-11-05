import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
}
