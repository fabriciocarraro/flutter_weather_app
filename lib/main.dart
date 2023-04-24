import 'package:flutter/material.dart';
import 'package:flutter_weather_app/extensions/size_extensions.dart';
import 'dart:math' as math;

import 'package:flutter_weather_app/widgets/rain.dart';
import 'package:flutter_weather_app/widgets/time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key parallaxOne = GlobalKey();
  bool showDate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            showDate = true;
          });
          showModalBottomSheet(
              context: context,
              elevation: 0,
              barrierColor: Colors.black.withAlpha(1),
              backgroundColor: Colors.transparent,
              builder: (builder) {
                return Container(
                  height: 600,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: context.screenHeight * 0.04,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/clock.png',
                                width: 25,
                              ),
                              SizedBox(
                                width: context.screenWidth * 0.04,
                              ),
                              Text(
                                "Today's changes",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SizedBox(
                            height: context.screenHeight * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Color(0xff763bd7).withOpacity(0.1),
                                    radius: 25,
                                    child: Image.asset(
                                      'assets/images/rainy.png',
                                      width: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Rainy',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Color(0xffff5580).withOpacity(0.1),
                                    radius: 25,
                                    child: Image.asset(
                                      'assets/images/wind.png',
                                      width: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Windy\n8 km/h',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.screenHeight * 0.04,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                                itemBuilder: (context, index){
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TimeWidget(
                                    data: data[index],
                                    active: index == 1,
                                  ),
                                  Divider(color: Colors.grey,)
                                ],
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).whenComplete(() {
            setState(() {
              showDate = false;
            });
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff763bd7),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 13, right: 13, top: 13, bottom: 26),
                child: ListTile(
                  leading: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/images/clock.png'),
                  ),
                  title: Text(
                    "Today's changes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/images/calendar.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        height: context.screenHeight,
        color: const Color(0xff763bd7),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              height: showDate
                  ? context.screenHeight * 0.1
                  : context.screenHeight * 0.125,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: context.screenHeight * 0.02, left: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 33,
                      child: Image.asset('assets/images/sun.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'What to wear',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 120,
                      color: Color(0xffff5080),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    AnimatedContainer(
                      width: 70,
                      color: Color(0xfff7446f),
                      height: showDate ? 110 : 0,
                      duration: Duration(milliseconds: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sat',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            '03',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: context.screenHeight,
                child: ParallaxRain(
                  key: parallaxOne,
                  dropColors: [Colors.white],
                  trail: true,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: context.screenHeight * 0.275,
              child: Image.asset(
                'assets/images/girl.png',
                height: context.screenHeight * 0.5,
              ),
            ),
            Positioned(
              left: 20,
              top: context.screenHeight * 0.175,
              child: Column(
                children: [
                  Text(
                    '19º',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Feels like 17º',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: context.screenHeight * 0.05,
              child: Text(
                'São Paulo',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var data = [
  {'time': '09:00 AM', 'temp': '19°'},
  {'time': '10:00 AM', 'temp': '20°'},
  {'time': '11:00 AM', 'temp': '21°'},
  {'time': '12:00 AM', 'temp': '18°'},
  {'time': '13:00 AM', 'temp': '17°'},
  {'time': '14:00 AM', 'temp': '16°'},
  {'time': '15:00 AM', 'temp': '15°'},
  {'time': '16:00 AM', 'temp': '11°'},
  {'time': '17:00 AM', 'temp': '20°'},
  {'time': '18:00 AM', 'temp': '19°'},
];