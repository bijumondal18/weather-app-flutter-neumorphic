import 'package:starter_project/Features/Search/Model/search_model.dart';

import '../../../Api/api_provider.dart';

class SearchedLocationRepository {
  final ApiProvider apiProvider = ApiProvider();

  Future<List<SearchModel>> fetchSearchedLocation(String query) {
    return apiProvider.fetchSearchedLocation(query);
  }
}
