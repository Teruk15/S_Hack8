import 'package:flutter/material.dart';
import 'package:test/mongo_db.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:test/MongoDBModel.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:test/user.dart';
import 'package:test/user_tracking.dart';
import 'package:test/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sparta Hack',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FirstPage(title: 'Home'),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> groceries = ['HomeMade', 'Groceries', 'Meds'];

  List<int> _iconsCodes = [
    Icons.restaurant_menu.codePoint,
    Icons.local_grocery_store.codePoint,
    Icons.medical_services.codePoint
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
                        subtitle: Text("Let's find what you are looking for!",
                            style: TextStyle(color: Colors.white)),
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
                  heroTag: 'Transactions',
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
                //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

                Expanded(child: Container()),

                // Map

                FloatingActionButton(
                  heroTag: 'Location',
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
                  heroTag: 'Accounts',
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
    return OrderTrackingPage();
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return seventhPage(title: 'seventhPage');
                },
              ),
              
            );
          },
        ));
  })
    );

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
    return userPage(title: 'USER END');
  }
}

// defining the sixith page

class SixthPage extends StatelessWidget {
  const SixthPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class seventhPage extends StatelessWidget {
  const seventhPage({super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ;
  }
}


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await MongoDatabase.connect();
  
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>{
//   final _location = ["Akers","Brody"];
//   String? locationSelected = "Akers";
//   // var locationController = TextEditingController();
//   String pickup = "";
//   String goal = "";

//   getLocation(String _pickup, String _goal){
//     pickup = _pickup;
//     goal = _goal;
//   }

//   List<String> groceries = ['Start', 'End', 'Done'];

//   final List<int> _iconsCodes = [
//     Icons.start.codePoint,
//     Icons.route.codePoint,
//     Icons.done_all.codePoint
//   ];

//   @override

//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text('Welcome Riders!')),
//       body: SafeArea(
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             const Padding(padding: EdgeInsets.only(top: 20)),

//             const Text(
//               " Choose the Starting Location",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.purple
//               ),
            
//             ),

//             const Padding(padding: EdgeInsets.only(top: 20)),
//             const Padding(padding: EdgeInsets.only(left: 20)),

//             DropdownButton<String>(

//               items: _location.map((String item){
//                 return DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(item),
//                   );
//               }).toList(),

//               onChanged: (String? newLocationSelected) {
//                 setState(() {
//                   locationSelected = newLocationSelected;
//                 });
//               },

//               value: locationSelected,
//             ),

//             const Padding(padding: EdgeInsets.only(top: 30)),

//             FutureBuilder(
//               future: MongoDatabase.getData(),
//               builder: (context, AsyncSnapshot snapshot){
//                 if (snapshot.connectionState == ConnectionState.waiting){
//                   return const Center(child: CircularProgressIndicator(),
//                   );
//                 } 
//                 else{
//                   if (snapshot.hasData){
//                     var dbLen = snapshot.data.length;

//                     return ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
                      
//                       itemCount:snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         return showData(MongoDbModel.fromJason(snapshot.data[index]), locationSelected);    
//                       },

//                     );
//                   } 
//                   else {
//                     return const Center(
//                       child: Text("No Data"),
//                     );
//                   }
//                 }
//               }
//             ),

//             // const Padding(padding: EdgeInsets.only(top: 30)),

//             Card(
//               margin: const EdgeInsets.all(20),
//               child: Text(
//                     "Start: $pickup",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20
//                       ),
//                   )
//             ),
  

//             Card(
//               margin: const EdgeInsets.all(20),
//               child: Text(
//                     "End: $goal",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20
//                       ),
//                   )
//             ),
//           ],
//         )
//       )
//     );
//   }

//   Widget showData(MongoDbModel data, String? locationSelected){
//     if (data.pickup == locationSelected){
//       getLocation("", "");
//       return ElevatedButton(
//         onPressed: () {
//           setState(() {
//             getLocation("${data.pickup}", "${data.goal}");
//           });
//         },
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
//           side: MaterialStateProperty.all(BorderSide(color: Colors.white)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 3,),
//             Text('Order ID: ${data.id.$oid}'),
//             const SizedBox(height: 1,),
//             Text('${data.firstname} ${data.lastname}'),
//             const SizedBox(height: 1,),
//             Text("${data.pickup}"),
//             const SizedBox(height: 1,),
//             Text("${data.goal}"),
//             const SizedBox(height: 1,),
//             Text(data.price),
//           ],
//         ),
          
//         )
//       );
//     }
//     else{
//       return const Text("");
//     }
//   }
// }



// class _MyHomePageState extends State<MyHomePage> {
//   var fnameController = new TextEditingController();
//   var lnameController = new TextEditingController();
//   var _pickup = ["Akers","Brody"];
//   var _goal = ["Akers","Brody"];
//   String? pickupValueSelected = "Akers";
//   String? goalValueSelected = "Akers";
//   String price = "0 Dollers";

//   calcPrice(String? pickupValueSelected, String? goalValueSelected){
//     if (pickupValueSelected == goalValueSelected){
//       price = "0 Dollers";
//     }
//     else {
//       price = "15 Dollers";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(

//           mainAxisAlignment: MainAxisAlignment.center,

//           children:[
//             TextField(
//               controller: fnameController,
//               decoration: InputDecoration(labelText: "First Name"),
//             ),

//             TextField(
//               controller: lnameController,
//               decoration: InputDecoration(labelText: "Last Name"),
//             ),
            
//             DropdownButton<String>(

//               items: _pickup.map((String item) {
//                 return DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(item),
//                 );
//               }).toList(),

//               onChanged: (String? newValueSelected) {
//                 setState(() {
//                   pickupValueSelected = newValueSelected;
//                   calcPrice(pickupValueSelected, goalValueSelected);
//                 });
//               },
              
//               value: pickupValueSelected,
//             ),

//             DropdownButton<String>(

//               items: _goal.map((String item) {
//                 return DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(item),
//                 );
//               }).toList(),

//               onChanged: (String? newValueSelected) {
//                 setState(() {
//                   goalValueSelected = newValueSelected;
//                   calcPrice(pickupValueSelected, goalValueSelected);
//                 });
//               },
              
//               value: goalValueSelected,
//             ),

//             const Text(
//               "The calculated price is: "
//             ),

//             Text(
//               price
//             ),

//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                       _insertData(fnameController.text, lnameController.text, pickupValueSelected, goalValueSelected, price);
//                 }, 
//                 child: const Text("Insert Data"))
//               ],
//             )

            
//           ],

//         ),
//       ),
//     );
//   }

//   Future<void> _insertData(String fName, String lName, String? pickup, String? goal, String price) async {
//     var unique_id = mongo.ObjectId();
//     final data = MongoDbModel(id: unique_id, firstname: fName, lastname: lName, pickup: pickup, goal: goal, price: price);
//     var result = await MongoDatabase.insert(data);
//   }

// }
