import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJason(String str) => MongoDbModel.fromJason(json.decode(str));

String mongoDbModelToJason(MongoDbModel data) => json.encode(data.toJason());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.pickup,
    required this.goal,
    required this.price,
    // required this.price,
  });

  ObjectId id;
  String firstname;
  String lastname;
  String? pickup;
  String? goal;
  String price;

  factory MongoDbModel.fromJason(Map<String,dynamic> json) => MongoDbModel(
    id: json["_id"],
    firstname: json["_firstname"],
    lastname: json["_lastname"],
    pickup: json["_pickup"],
    goal: json["_goal"],
    price: json["_price"],
  );

  Map<String, dynamic> toJason() => {
    "_id" : id,  
    "_firstname" : firstname,  
    "_lastname" : lastname, 
    "_pickup" : pickup,
    "_goal" : goal,
    "_price" : price
    // "_price" : price,
  };
}