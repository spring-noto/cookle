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
    return autocomplete.getAutocompleteData(text);
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
          placeHolder: Text("placeholder"),
          cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
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
        ),
      ),
    );
  }
}