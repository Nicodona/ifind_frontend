import 'package:http/http.dart' as http;
import '../models/found.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/dashboard/notify.dart';


final storage = FlutterSecureStorage();

class RemoteSevices{
  Future<List<Found>?> getFound() async {
    final token = await storage.read(key: 'token');
    final username = await storage.read(key: 'username');
    final id = await storage.read(key: 'id');
    try {
      var client = http.Client();
      var uri = Uri.parse("https://ifoundapi.herokuapp.com/found/");
      var response = await client.get(
        uri, headers: {'Authorization': 'Token $token'},
      ); //specify header here

      if (response.statusCode == 200) {
        print('load successful');
        print(username);
        print(id);
        var json = response.body;
        return foundFromJson(json);
      }else{
        print('something went wrong');
        print(response.statusCode);
      }
  }catch(e) {
      print(e.toString());
    }
  }
}

class Message{
  Future<List<Alert>?> getMessage() async {
    final token = await storage.read(key: 'token');
    final username = await storage.read(key: 'username');
    try {
      var client = http.Client();
      var uri = Uri.parse("https://ifoundapi.herokuapp.com/spec_msg/");
      var response = await client.get(
        uri, headers: {'Authorization': 'Token $token'},
      ); //specify header here

      if (response.statusCode == 200) {
        print('load successful');
        print(username);
        var json = response.body;
        return AlertFromJson(json);
      }else{
        print('something went wrong');
        print(response.statusCode);
      }
  }catch(e) {
      print(e.toString());
    }
  }
}




class Posts{
  Future<List<Found>?> getPosts() async {
    final token = await storage.read(key: 'token');
    final username = await storage.read(key: 'username');
    try {
      var client = http.Client();
      var uri = Uri.parse("https://ifoundapi.herokuapp.com/my_post/");
      var response = await client.get(
        uri, headers: {'Authorization': 'Token $token'},
      ); //specify header here

      if (response.statusCode == 200) {
        print('load successful');
        print(username);
        var json = response.body;
        return foundFromJson(json);
      }else{
        print('something went wrong');
        print(response.statusCode);
      }
    }catch(e) {
      print(e.toString());
    }
  }
}