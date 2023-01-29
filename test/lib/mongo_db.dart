import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:test/MongoDBModel.dart';
import 'package:test/mongo_constant.dart';


class MongoDatabase {
  static var db,collection;
  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();

    inspect(db); //setting

    collection = db.collection(MONGO_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async{
    final dbData = await collection.find().toList();
    return dbData;
  } 

  static Future<String> insert(MongoDbModel data) async {
    var result = await collection.insertOne(data.toJason());
    return "Data processing";
  }
}