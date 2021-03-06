import 'package:cookle/constants/constants.dart';
import 'package:cookle/screens/search_screen.dart';
import 'package:cookle/widgets/provider.dart';
import 'package:cookle/widgets/search_box.dart';
import 'package:cookle/widgets/search_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List items;
  List data = List();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _buildBodyView();
  }

  Widget _buildBodyView() {
    final WidgetWithSharedDataState state = WidgetWithSharedData.of(context);
    return Column(
      children: <Widget>[
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
        SearchFilter(),
        Expanded(
            child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isLoading &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              this.getJSONData();
              setState(() {
                isLoading = true;
              });
              return true;
            }
            setState(() {
              isLoading = false;
            });
            return false;
          },
          child: _buildListView(),
        )),
        Container(
          height: isLoading ? 50.0 : 0,
          color: Colors.white70,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        return _buildImageColumn(data[index]);
        return ListTile(
          title: Text("data"),
          subtitle: Text("likes: 1"),
        );
      },
    );
  }

  Widget _buildImageColumn(item) => Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: <Widget>[
          //TODO: CachedNetworkImage 위젯 사용
          Container(
            height: 300,
            width: 400,
            child: Center(
                child:
                    Text("요리이름", style: TextStyle(color: Colors.black, fontSize: 40,fontWeight: FontWeight.bold))),
//          child: Image.asset("assets/images/cheese_burger.jpg"),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage("assets/images/cheese_burger.jpg"),
              ),
            ),
          ),
          ListTile(
            title: Text("재료"),
            trailing: Icon(Icons.favorite_border),
          )
        ],
      ));

  Widget _imagePlaceHolder() {
    return Container(
      height: 200,
      child: SizedBox(
        height: 600,
      ),
    );
  }

  Future<String> getJSONData() async {
    setState(() {
      List newItems = List();
      newItems.add("data: test1");
      data.addAll(newItems);
      isLoading = false;
    });
    return "successful";
  }
}
