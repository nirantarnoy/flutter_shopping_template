import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                height: 66,
                color: Colors.amber,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Tarek',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('Gold User',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.amber,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.alarm_rounded,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Tab(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.grey.withOpacity(0.50),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Cart is empty",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
