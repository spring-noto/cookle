
import 'package:cookle/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0, //그림자
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    title: Center(
      child: RichText(
        text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "Cook",
                style: TextStyle(color: kPrimaryColor),
              ),
              TextSpan(
                text: "le",
                style: TextStyle(color: kSecondaryColor),
              ),
            ]),
      ),
    ),
    actions: <Widget>[IconButton(icon: SvgPicture.asset("assets/icons/notification.svg"), onPressed: () {})],
  );
}