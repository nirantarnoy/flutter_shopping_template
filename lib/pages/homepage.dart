import 'package:flutter/material.dart';
import 'package:flutter_shopping_template/pages/detailpage.dart';
import 'package:flutter_shopping_template/widgets/mainappbar.dart';
import 'package:flutter_shopping_template/widgets/searchbox.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabController _tabController;
    int _currentIndex = 0;

    void _onTaped(int index) {
      print(index);
      // setState(() {
      //   _currentIndex = index;
      //   if (index == 0) {
      //     appTitle = '';
      //   }
      //   if (index == 1) {
      //     // Navigator.push(context,
      //     //     MaterialPageRoute(builder: (context) => JournalissuePage()));
      //     appTitle = 'สรุปข้อมูล ATK';
      //     _currentIndex = 1;
      //   }
      //   if (index == 2) {
      //     // Navigator.push(context,
      //     //     MaterialPageRoute(builder: (context) => JournalissuePage()));
      //     appTitle = 'สรุปข้อมูลวัคซีน';
      //     _currentIndex = 2;
      //   }
      // });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MainAppBar(),
      body: BodyPage(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber,
            currentIndex: _currentIndex,
            onTap: _onTaped,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active),
                  label: 'การแจ้งเตือน'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'ข้อมูลของฉัน')
            ],
          ),
        ],
      ),
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
        SearchBox(),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryItem(
                        title: "ขายดี",
                        isActive: true,
                        press: _pressFunction,
                        index: 1,
                      ),
                      CategoryItem(
                        title: "จานด่วน",
                        isActive: false,
                        press: _pressFunction,
                        index: 1,
                      ),
                      CategoryItem(
                        title: "เครื่องดื่ม",
                        isActive: false,
                        press: _pressFunction,
                        index: 2,
                      ),
                      CategoryItem(
                        title: "พรีเมี่ยมเซ็ต",
                        isActive: false,
                        press: _pressFunction,
                        index: 3,
                      ),
                      CategoryItem(
                        title: "ส่งฟรี",
                        isActive: false,
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
                        title: "Burger & Cola",
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ItemCard(
                        title: "Burger & Cola",
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
            ),
          ),
        ),
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
            "ข้อเสนอส่วนลดพิเศษ",
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
                image: AssetImage("assets/images/rice.jpg"),
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
    // if (widget.index != null) {
    //   current_is_active = true;
    //   //  current_index = widget.index;
    // } else {
    //   current_is_active = false;
    //   //  current_index = widget.index;
    // }

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
                if (widget.isActive == true)
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
