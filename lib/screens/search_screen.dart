import 'package:cookle/constants/constants.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:cookle/services/autocomplete.dart';

AutocompleteService autocomplete = new AutocompleteService();


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBarController<SearchSuggestion> _searchBarController = SearchBarController();

  Future<List<SearchSuggestion>> _getSuggestionResult(String text) async {
    await Future.delayed(Duration(milliseconds: 350));
    if(text == "에러") throw Error();
    if (text == "없음") return [];
    List<SearchSuggestion> result = List();
    result.add(SearchSuggestion('가지'));
    result.add(SearchSuggestion('오이'));
    return result;
//    return autocomplete.getAutocompleteData(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<SearchSuggestion>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getSuggestionResult,
          searchBarController: _searchBarController,
//          placeHolder: Text("placeholder"),
          hintText: "검색어를 입력하세요",
          cancellationWidget: Text("취소"),
          emptyWidget: Center(
            child: Text("찾는 검색어가 없습니다"),
          ),
          loader: Center(
            child: Text("loading..."),
          ),
          debounceDuration: Duration(milliseconds: 800),
          onCancelled: () {
            print("Cancelled triggered");
          },
          minimumChars: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          onItemFound: (SearchSuggestion suggestion, int index) {
            return Container(
              color: kPrimaryColor,
              child: ListTile(
                title: Text(suggestion.title),
                isThreeLine: false,
                onTap: () {
                  Navigator.pop(context, suggestion.title);
                },
              ),
            );
          },
          onError: (error) {
            return Center(
              child: Text("Error occurred : $error"),
            );
          },
        ),
      ),
    );
  }
}