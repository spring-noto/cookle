import 'package:cookle/constants/constants.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;

  const FilterItem(this.title, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      child: Chip(
        label: Text(
          title,
          style: TextStyle(
              color: kTextLightColor,
              fontSize: 13
          ),
        ),
        onDeleted: () {
          this.onDelete();
        },
        deleteIcon: Icon(Icons.add),
        deleteIconColor: kTextLightColor,
      ),
    );
  }
}