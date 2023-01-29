import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class userPage extends StatefulWidget {
  const userPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  List<String> groceries = ['Start', 'End', 'Done'];

  List<int> _iconsCodes = [
    Icons.start.codePoint,
    Icons.route.codePoint,
    Icons.done_all.codePoint
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(widget.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: groceries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(12),
                      height: 145,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 97, 97, 97),
                              blurRadius: 5.0,
                              offset: Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        title: Text(
                          groceries[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(IconData(_iconsCodes[index],
                            fontFamily: 'MaterialIcons')),
                      ));
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Money
                FloatingActionButton(
                  heroTag: 'Transaction_user',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FourthPage(title: 'Transactions');
                    }));
                  },
                  backgroundColor: Colors.purple,
                  hoverColor: Colors.deepPurple,
                  child: const Icon(Icons.monetization_on),
                ),

                Expanded(child: Container()),

                // Map

                FloatingActionButton(
                  heroTag: 'Location_user',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SecondPage(title: 'Your Location');
                    }));
                  },
                  backgroundColor: Colors.purple,
                  hoverColor: Colors.deepPurple,
                  child: const Icon(Icons.map_outlined),
                ),

                Expanded(child: Container()),

                // Accounts

                FloatingActionButton(
                  heroTag: 'Accounts_user',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThirdPage(title: 'Accounts');
                    }));
                  },
                  backgroundColor: Colors.purple,
                  hoverColor: Colors.deepPurple,
                  child: const Icon(Icons.account_balance_outlined),
                ),
              ],
            )));
  }
}

//defining second page

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true, title: Text('Location')));
  }
}

//defining the Accounts page

class ThirdPage extends StatelessWidget {
  ThirdPage({Key? key, required this.title}) : super(key: key);
  final String title;

  List<String> settings = ['Transactions', 'Basic Info', 'Rewards'];

  List<int> _iconsCodes = [
    Icons.wallet.codePoint,
    Icons.badge.codePoint,
    Icons.card_giftcard.codePoint
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Accounts')),
        body: ListView.builder(
          itemCount: settings.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              height: 90,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.purple,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 97, 97, 97),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: Text(settings[index],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(
                    IconData(_iconsCodes[index], fontFamily: 'MaterialIcons')),
                leading: Icon(Icons.arrow_circle_right, color: Colors.white),
              ),
            );
          },
        ));
  }
}

// defining the fourth page

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Transactions')),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FifthPage(title: 'FiftPage');
            }));
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

// defining the fifth page

class FifthPage extends StatefulWidget {
  FifthPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SixthPage(title: 'SixthPage');
            }));
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

// defining the sixith page

class SixthPage extends StatelessWidget {
  const SixthPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
