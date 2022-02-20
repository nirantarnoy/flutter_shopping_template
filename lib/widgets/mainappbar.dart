import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: SvgPicture.asset(
        "assets/icons/menu2.svg",
        height: 1,
        width: 1,
        fit: BoxFit.scaleDown,
      ),
      title: RichText(
        text: TextSpan(
          text: "Good",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
          children: [
            TextSpan(text: "Pos", style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              "assets/icons/shopping-cart.png",
              width: 30,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
