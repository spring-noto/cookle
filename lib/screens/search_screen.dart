import 'package:cookle/constants/constants.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchSuggestion {
  final String title;

  SearchSuggestion(this.title);
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBarController<SearchSuggestion> _searchBarController = SearchBarController();

  Future<List<SearchSuggestion>> _getALlPosts(String text) async {
    await Future.delayed(Duration(seconds: 1));
    List<SearchSuggestion> suggestions = [];

    for (int i = 0; i < 10; i++) {
      suggestions.add(SearchSuggestion("$text $i"));
    }
    return suggestions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<SearchSuggestion>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlPosts,
          searchBarController: _searchBarController,
          placeHolder: Text("placeholder"),
          cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
          onCancelled: () {
            print("Cancelled triggered");
          },
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