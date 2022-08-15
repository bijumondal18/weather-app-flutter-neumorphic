import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:starter_project/Commons/constants.dart';
import 'package:starter_project/Features/Search/Model/search_model.dart';

import '../Features/Home/Model/response_model.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<ResponseModel> fetchWeatherData(String query) async {
    try {
      Response response =
          await dio.get(Constants.baseUrl + Constants.apiKey + query);
      log('-------Weather Response Data : $response');
      return response.statusCode == 200
          ? ResponseModel.fromJson(response.data)
          : throw Exception('Error Getting Data');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SearchModel> fetchSearchedLocation(String query) async {
    try {
      Response response =
          await dio.get(Constants.searchUrl + Constants.apiKey + query);
      log('-------Searched Location Data : $response');
      return response.statusCode == 200
          ? SearchModel.fromJson(response.data)
          : throw Exception('Error Getting Data');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
