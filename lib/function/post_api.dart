import 'dart:convert';

import 'package:dio/dio.dart';

class PostAPI {
  final Dio dio = Dio();

  Future getData() async {
    var response = await dio.get('https://41f1277d-3c5f-4abf-84aa-99c4e1de540c.mock.pstmn.io/mates');
    Map<String, dynamic> responseMap = await jsonDecode(response.data);
    // return json.decode(response.toString());
    return responseMap;
  }
}