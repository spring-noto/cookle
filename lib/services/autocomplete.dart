import 'package:dio/dio.dart';

const _Cookle_Auto_Prefix = "http://172.30.1.26:8080/auto/cook?query=";
const _Cookle_Search_Prefix = "http://172.30.1.26:8080/search/cook?query=";

class SearchSuggestion {
  final String title;

  SearchSuggestion(this.title);
}

class AutocompleteService {
  Dio dio = new Dio();

  Future<List<SearchSuggestion>> getAutocompleteData<T>(String text) async {
    Response<Map> response;
    response = await dio.get("$_Cookle_Auto_Prefix" + text);
    Map responseBody = response.data;

    List<dynamic> list = responseBody["data"]["esautocook"];
    List<SearchSuggestion> result = [];

    list.forEach((element) {
      print(element["keyword"]);
      result.add(SearchSuggestion(element["keyword"]));
    });

    return result;
  }

/*  Future<void> getSearchReq(String text) async {
    Response<Map> response;
    Dio dio = new Dio();
    response = await dio.get("$_Cookle_Search_Prefix" + text);
    Map responseBody = response.data;
    List<dynamic> list = responseBody["data"]["essearchcook"];
    list.forEach((element) {
      print(element["title"]);
      print(element["cookTime"]);
    });
  }*/
}

AutocompleteService server = AutocompleteService();