import 'package:flutter/cupertino.dart';

class _SharedData extends InheritedWidget {
  _SharedData({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final WidgetWithSharedDataState data;

  @override
  bool updateShouldNotify(_SharedData oldWidget) {
    return true;
  }
}

class WidgetWithSharedData extends StatefulWidget {
  WidgetWithSharedData({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  WidgetWithSharedDataState createState() => WidgetWithSharedDataState();

  static WidgetWithSharedDataState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_SharedData>())
        .data;
  }
}

class WidgetWithSharedDataState extends State<WidgetWithSharedData> {
  /// List of Items
  List<String> _items = <String>[];

  /// Getter (number of items)
  int get itemsCount => _items.length;

  List<String> get items => _items;

  /// Helper method to add an Item
  void addItem(String reference) {
    setState(() {
      _items.add(reference);
    });
  }

  /// Helper method to add an Item
  void removeItem(String reference) {
    setState(() {
      _items.remove(reference);
    });
  }

  /// Helper method to add an Item
  void removeItemByIndex(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _SharedData(
      data: this,
      child: widget.child,
    );
  }
}