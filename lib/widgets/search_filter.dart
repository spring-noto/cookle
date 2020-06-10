import 'package:cookle/models/filter_item.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  final List<String> searchFilterList;

  const SearchFilter (this.searchFilterList);
  @override
  _SearchFilterState createState() => _SearchFilterState(this.searchFilterList);
}

class _SearchFilterState extends State<SearchFilter> {
  List<String> searchFilterList;

  _SearchFilterState(this.searchFilterList);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: createSearchItem(this.searchFilterList),
      ),
    );
  }

  List<Widget> createSearchItem(List<String> searchFilterList) {
    List<Widget> searchFilter = List<Widget>();
    searchFilterList.asMap().forEach((index, filterItem) {
      searchFilter.add(FilterItem(filterItem, onDelete: () => removeItem(index)));
    });
    return searchFilter;
  }

  void removeItem(int index) {
    setState(() {
      searchFilterList = List.from(searchFilterList)
        ..removeAt(index);
    });
  }
}





