//Working need to change a bit
import 'package:flutter/material.dart';
import 'package:loginout/constants.dart';
import 'package:loginout/payments.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({
    Key? key,
    required this.image,
    required this.hotelname,
    required this.location,
    required this.price,
    required this.rating,
  }) : super(key: key);
  final String image;
  final String hotelname;
  final String location;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          image: AssetImage('$image'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "$hotelname\n$location",
                      style: TextStyle(
                          color: Constants.extraColor,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  /*Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "8.4/8.5 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Constants.buttonColor,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),*/
                  Container(
                    padding: const EdgeInsets.all(32.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('$rating'),
                                      Icon(
                                        Icons.star,
                                        color: Colors.purple,
                                      ),
                                    ],
                                  ),
                                  /*Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.location_on,
                                        size: 16.0,
                                        color: Colors.grey,
                                      )),
                                      TextSpan(text: "8 km to centrum")
                                    ]),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  )*/
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "\$ $price",
                                  style: TextStyle(
                                      color: Constants.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                Text(
                                  "/per night",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Constants.kPrimaryColor),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        PreferredSize(
                          preferredSize: Size(40, 40),
                          child: TabBar(
                              labelColor: Constants.textColor,
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w600),
                              indicatorColor: Constants.buttonColor,
                              unselectedLabelColor: Constants.textColor,
                              // indicatorSize: TabBarIndicatorSize.tab,
                              tabs: <Widget>[
                                Tab(
                                  text: 'DESCRIPTION',
                                ),
                                Tab(
                                  text: 'REVIEWS',
                                ),
                              ]),
                        ),
                        Container(
                          height: 300,
                          child: TabBarView(
                            children: [
                              Container(
                                color: Constants.background,
                                child: ProdcutSpecsContext(),
                              ),
                              Container(
                                color: Constants.background,
                                child: ProdcutDescriptionContext(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Constants.buttonColor,
                            textColor: Constants.textColor,
                            child: Text(
                              "Book Now",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentsPage(
                                            price: price,
                                          )));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "HOTEL DETAILS",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            /*Align(
            alignment: Alignment.bottomLeft,
            child: BottomNavigationBar(
              backgroundColor: Colors.white54,
              elevation: 0,
              selectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text("Search")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    title: Text("Favorites")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), title: Text("Settings")),
              ],
            ),
          )*/
          ],
        ),
      ),
    );
  }
}

class ProdcutDescriptionContext extends StatelessWidget {
  const ProdcutDescriptionContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: index == 0 ? 0 : 10),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        minRadius: 12,
                        child: Icon(Icons.person),
                        backgroundColor: Constants.textColor,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Katherine',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 22,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Hello',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'They were extremely accommodating and allowed us to check in early at like 10am. We got to hotel super early and I didn’t wanna wait. So this was a big plus. The sevice was exceptional as well. Would definitely send a friend there',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ProdcutSpecsContext extends StatelessWidget {
  const ProdcutSpecsContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 64,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            width: 0,
            bottom: 0,
            child: Container(
              height: 18,
              width: 10,
              decoration: BoxDecoration(
                color: Constants.textColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            left: 8,
            width: 0,
            bottom: 0,
            child: Container(
              height: 18,
              width: 10,
              decoration: BoxDecoration(
                color: Constants.textColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            left: 16,
            width: 0,
            bottom: 0,
            child: Container(
              height: 18,
              width: 10,
              decoration: BoxDecoration(
                color: Constants.textColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            left: 24,
            width: 0,
            bottom: 0,
            child: Container(
              height: 18,
              width: 10,
              decoration: BoxDecoration(
                color: Constants.textColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            left: 28,
            width: 0,
            bottom: 0,
            child: Container(
              height: 18,
              width: 10,
              decoration: BoxDecoration(
                color: Constants.textColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
