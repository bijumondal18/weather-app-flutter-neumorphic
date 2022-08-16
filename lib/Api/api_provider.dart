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

  Future<List<SearchModel>> fetchSearchedLocation(String query) async {
    try {
      Response response =
          await dio.get(Constants.searchUrl + Constants.apiKey + query);
      List jsondata = response.data;
      // log('-------Searched Location Data : $jsondata');

      List<SearchModel> searchedData = [];
      for (var i = 0; i < jsondata.length; i++) {
        var data = SearchModel.fromJson(jsondata[i]);
        searchedData.add(data);
      }

      return response.statusCode == 200
          ? searchedData
          : throw Exception('Error Getting Data');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
