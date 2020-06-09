import 'package:cookle/constants/constants.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final String title;

  const FilterItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      child: Column(
        children: <Widget>[
          Chip(
            label: Text(
              title,
              style: TextStyle(
                  color: kTextLightColor,
                  fontSize: 13
              ),
            ),
            onDeleted: () {
              print("$title 삭제");
            },
            deleteIcon: Icon(Icons.add),
            deleteIconColor: kTextLightColor,
          )
        ],
      ),
    );
  }
}