import 'package:flutter/material.dart';
import 'package:flutter_shopping_template/widgets/mainappbar.dart';
import 'package:flutter_shopping_template/widgets/searchbox.dart';

class SearchPage extends StatelessWidget {
  final String? searchText;

  const SearchPage({Key? key, this.searchText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: <Widget>[
          SearchBox(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: "ผลการค้าหา",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: ' \"${this.searchText}\"',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
