// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:exam/frontend/widgets/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VGap(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Assessment History',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Make an animated circular countdown using Circular Countdown Timer.',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ),
            VGap(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue.withOpacity(.6),
                      Colors.blueAccent
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.black12.withOpacity(.1)),
                        right:
                            BorderSide(color: Colors.black12.withOpacity(.1)),
                        bottom:
                            BorderSide(color: Colors.black12.withOpacity(.1)))),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subject',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Time & Date',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        HGap(width: 70)
                      ],
                    ),
                    Text(
                      'Score',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Menu',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.black12.withOpacity(.1)),
                              right: BorderSide(
                                  color: Colors.black12.withOpacity(.1)),
                              bottom: BorderSide(
                                  color: Colors.black12.withOpacity(.1)))),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Physics - JEE',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.blue.withOpacity(1),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.withOpacity(1),
                                      Colors.blueAccent
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(100)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: Text(
                              '27 Jan , 05:45 PM',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '200 / 240',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '80%',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                VGap(height: 10),
                                LinearProgressIndicator(
                                  semanticsLabel: 'Score',
                                  semanticsValue: '20',
                                  value: 20 / 100,
                                  backgroundColor: Colors.grey.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.ellipsis))
                        ],
                      ),
                    );
                  }),
            ),
            VGap(height: 50)
          ],
        ),
      ),
    );
  }
}
