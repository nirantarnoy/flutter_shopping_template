import 'package:flutter/material.dart';
import 'package:flutter_shopping_template/pages/detailpage.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: BodyPage(),
    );
  }

  AppBar appBar(BuildContext context) {
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
            TextSpan(text: "Food", style: TextStyle(color: Colors.amber)),
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
}

class BodyPage extends StatelessWidget {
  int category_index = 0;

  void _pressFunction(int index) {
    print('${index}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border:
                Border.all(width: 0.5, color: Colors.amber.withOpacity(0.52)),
          ),
          child: TextField(
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryItem(
                title: "Combo Set",
                isActive: true,
                press: _pressFunction,
                index: 1,
              ),
              CategoryItem(
                title: "Premium Set",
                isActive: true,
                press: _pressFunction,
                index: 2,
              ),
              CategoryItem(
                title: "Gift Set",
                isActive: true,
                press: _pressFunction,
                index: 3,
              ),
              CategoryItem(
                title: "Flash Set",
                isActive: true,
                press: _pressFunction,
                index: 4,
              ),
              CategoryItem(
                title: "Free Delivery",
                isActive: true,
                press: _pressFunction,
                index: 5,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ItemCard(
                title: "Burger & Beer",
                shopName: "McDonal",
              ),
              ItemCard(
                title: "Burger & Beer",
                shopName: "McDonal",
              ),
              ItemCard(
                title: "Burger & Beer",
                shopName: "McDonal",
              ),
              ItemCard(
                title: "Burger & Beer",
                shopName: "McDonal",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        DiscountCard(),
      ],
    );
  }
}

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Offer and Discount",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 166,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.90),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/images/01.png"),
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color(0xFFFF961F).withOpacity(0.5),
                  Colors.amber.withOpacity(0.10)
                ]),
              ),
              child: Row(children: [
                Expanded(
                  child: Text(""),
                ),
                Expanded(
                  child: RichText(
                      text: TextSpan(text: "Discount for \n", children: [
                    TextSpan(
                      text: "30%",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String? title;
  final bool? isActive;
  final Function press;
  final int index;

  const CategoryItem({
    Key? key,
    this.title,
    this.isActive,
    required this.press,
    required this.index,
  }) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool current_is_active = false;
  @override
  void initState() {
    if (widget.index != null) {
      current_is_active = true;
      //  current_index = widget.index;
    } else {
      current_is_active = false;
      //  current_index = widget.index;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            // onTap: () => widget.press(widget.index),
            onTap: () {
              //   print(widget.index);
              print('${widget.index}');
            },
            child: Column(
              children: <Widget>[
                Text(
                  '${widget.title}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                if (current_is_active == true)
                  Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // shape: BoxShape.,
                      color: Colors.amber,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String? title;
  final String? shopName;

  const ItemCard({
    Key? key,
    this.title,
    this.shopName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            // spreadRadius: 8,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(),
              ),
            );
          },
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.all(8),
                // child: SvgPicture.asset(
                //   "assets/icons/glass.svg",
                //   width: size.width * 0.20,
                // ),
                child: Image.asset(
                  "assets/images/02.png",
                  width: size.width * 0.20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("${title}"),
              SizedBox(
                height: 5,
              ),
              Text("${shopName}"),
            ],
          ),
        ),
      ),
    );
  }
}
