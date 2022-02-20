import 'package:flutter/material.dart';
import 'package:flutter_shopping_template/pages/searchadvance.dart';
import 'package:flutter_shopping_template/pages/searchpage.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(width: 1, color: Colors.amber.withOpacity(0.52)),
            ),
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(
                    searchText: value,
                  ),
                ),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.amber,
                ),
                hintText: "Search Here",
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.50),
                ),
              ),
              cursorColor: Colors.amber,
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            width: 50,
            padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(width: 1, color: Colors.amber.withOpacity(0.52)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.amber,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchAdvancePage(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
