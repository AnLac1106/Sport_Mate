import 'dart:convert';

import 'package:dio/dio.dart';

class PostAPI {
  final Dio dio = Dio();

  Future getData() async {
    // var response = await dio.get('https://41f1277d-3c5f-4abf-84aa-99c4e1de540c.mock.pstmn.io/mates');
    var response = await dio.get('https://51fca4b4-1260-4abc-aefe-b0d71b3164a8.mock.pstmn.io/sportmate');
    Map<String, dynamic> responseMap = await jsonDecode(response.data);
    // return json.decode(response.toString());
    return responseMap;
  }
}

class SPMGetNotification {
  final Dio dio = Dio();

  Future getData() async {
    var response = await dio.get('https://af833a54-79d2-425c-8a0d-544393f0a561.mock.pstmn.io/spm_notification');
    List responseList = await jsonDecode(response.data);
    return responseList;
  }
}