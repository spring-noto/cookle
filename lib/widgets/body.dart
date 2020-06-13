import 'package:cookle/screens/search_screen.dart';
import 'package:cookle/widgets/provider.dart';
import 'package:cookle/widgets/search_box.dart';
import 'package:cookle/widgets/search_filter.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    final WidgetWithSharedDataState state = WidgetWithSharedData.of(context);
    return Column(children: <Widget>[
      GestureDetector(
        child: SearchBox(),
        onTap: () async {
          //비동기로 받은 검색어 데이터를 공통으로 쓰는 state 에 추가
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
          if (result != null) {
            state.addItem(result);
          }
        },
      ),
      SearchFilter()
    ]);
  }
}
