import 'package:starter_project/Api/api_provider.dart';

import '../Model/response_model.dart';

class WeatherRepository {
  final ApiProvider apiProvider = ApiProvider();

  Future<ResponseModel> fetchWeatherData(String query) {
    return apiProvider.fetchWeatherData(query);
  }
}
