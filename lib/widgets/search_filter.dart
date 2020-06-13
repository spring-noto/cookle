import 'package:cookle/models/filter_item.dart';
import 'package:cookle/widgets/provider.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {

  @override
  Widget build(BuildContext context) {
    final WidgetWithSharedDataState state = WidgetWithSharedData.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: createSearchItem(state, state.items),
      ),
    );
  }


  List<Widget> createSearchItem(WidgetWithSharedDataState state, List<String> searchFilterList) {
    List<Widget> searchFilter = List<Widget>();
    if(searchFilterList == null) {
       return List();
    }
    searchFilterList.asMap().forEach((index, filterItem) {
      searchFilter.add(FilterItem(filterItem, onDelete: () => removeItem(state, index)));
    });
    return searchFilter;
  }

  //TODO: search_filter에서 사용하는 filter_item이 상속구조가 아니라 state 를 직접 사용하지 못해 인자로 넘겨받음. 추후에 구조를 변경해야함
  void removeItem(WidgetWithSharedDataState state, int index) {
    setState(() {
      state.removeItemByIndex(index);
    });
  }
}





