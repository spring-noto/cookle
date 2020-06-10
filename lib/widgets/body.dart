import 'package:cookle/screens/search_screen.dart';
import 'package:cookle/widgets/search_box.dart';
import 'package:cookle/widgets/search_filter.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> searchFilterList = List<String>();
  Widget searchFilter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _awaitReturnValueFromScreen(context);
          },
          child: SearchBox(
            onChanged: (value) {},
          ),
        ),
        searchFilter = SearchFilter(this.searchFilterList)
      ],
    );
  }

  void _awaitReturnValueFromScreen(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(),
        ));

    setState(() {
      this.searchFilterList.add(result);
//      this.searchFilter = SearchFilter(this.searchFilterList);
    });
  }
}