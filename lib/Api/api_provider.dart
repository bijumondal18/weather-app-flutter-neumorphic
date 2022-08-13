import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:starter_project/Commons/constants.dart';

import '../Features/Home/Model/response_model.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<ResponseModel> fetchWeatherData() async {
    try {
      Response response = await dio.get(Constants.baseUrl);
      log('-------Response : $response');
      return response.statusCode == 200
          ? ResponseModel.fromJson(response.data)
          : throw Exception('Error Getting Data');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
