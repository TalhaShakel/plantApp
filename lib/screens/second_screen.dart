// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe

import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_counter/flutter_counter.dart';

// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

import 'home.dart';

String descText =
    "Mihi duco adfero, puer pasco homo aduro missa. Tametsi esse pia illa, renuo uter. Premo picea. Loci letum demum abbas ceterum puteus suus metuo. Suus autus abeo queso > putus faenum. Corrigo lenio. Illa quris aurum sequi utrum taceo, pyropus quantum. Frequentatio immineo lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.";
bool descTextShowFlag = false;

class secondscreen extends StatefulWidget {
  const secondscreen({Key? key}) : super(key: key);

  @override
  State<secondscreen> createState() => _secondscreenState();
}

var imagelst = [
  "assets/1.png",
  "assets/2.png",
  "assets/3.png",
  "assets/4.png",
  "assets/5.png",
  "assets/6.png",
  "assets/7.png",
];

class _secondscreenState extends State<secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar_with_search(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.deepOrange[300],
              child: Swiper(
                  itemCount: imagelst.length,
                  itemBuilder: (context, index) {
                    return Image.asset(imagelst[index], fit: BoxFit.fitHeight);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: kDefaultPadding / 2,
                  right: kDefaultPadding,
                  left: kDefaultPadding),
              child: Row(
                children: [
                  Text(
                    "SPICY PIZZA",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "\$",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15),
                  ),
                  Text(
                    "69",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SPICY DETAILS"),
                  Row(
                    children: [
                      icon_star(),
                      icon_star(),
                      icon_star(),
                      icon_star(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:kDefaultPadding),
                    child: Text(descText,
                        maxLines: descTextShowFlag ? 8 : 6,
                        textAlign: TextAlign.start),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        descTextShowFlag = !descTextShowFlag;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        descTextShowFlag
                            ? Text(
                                "Show Less",
                                style: TextStyle(color: Colors.blue),
                              )
                            : Text("Show More",
                                style: TextStyle(color: Colors.blue))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:kDefaultPadding),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.deepOrange,
                        ),
                        Text(
                          "\t\t\t0.5 km Distance",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:kDefaultPadding),
                    child: Row(
                      children: [
                        Counter(
                          color: Colors.deepOrange,
                          initialValue: _defaultValue,
                          minValue: 0,
                          maxValue: 100,
                          step: 1,
                          decimalPlaces: 0,
                          onChanged: (value) {
                            // get the latest value from here
                            setState(() {
                              _defaultValue = value;
                              _counter = value;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,),
                           InkWell(
                             onTap: (){}, 
                             child: Container(
                               height: 40,
                               width: 135,
                               decoration: BoxDecoration(
                                 color: Colors.deepOrange,
                                 borderRadius: BorderRadius.only(
                                   topLeft: Radius.circular(20),
                                   topRight: Radius.circular(20),
                                   bottomLeft: Radius.circular(20),
                                   bottomRight: Radius.circular(20))
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding/2),
                                 child: Row(
                            children: [
                                  Icon(Icons.shopping_cart,color: Colors.white,),
                                  Text("ADD TO CART",style: TextStyle(
                                    color: Colors.white
                                  ),)
                            ],
                                                     ),
                               ),
                             )),
                        
                      
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

num _counter = 0;
num _defaultValue = 0;

class AppBar_with_search extends StatelessWidget {
  const AppBar_with_search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.food_bank_outlined,
            color: Colors.deepOrange,
          )),
      title: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: TextField(
          style: TextStyle(fontSize: 20, height: 1.5),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            fillColor: Colors.grey[100],
            filled: true,
            hintText: 'search your food',
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: kDefaultPadding / 2),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),
        )
      ],
      elevation: 0,
    );
  }
}
