import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ifind_backend/screens/dashboard/message.dart';
import 'package:ifind_backend/services/remote_services.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  final storage = FlutterSecureStorage();
  List<Alert>?  message;
  bool _isLoaded = false;

  late String? username;

  Future<void> getusername() async{
    username = await storage.read(key: 'username');
    setState(() {

    });
  }



  getdata() async{
    message = await Message().getMessage();
    if(message != null){
      print('there is data');
      setState(()  {
        _isLoaded = true;
      });
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getusername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [

                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 40,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                        child: const Text('Notifications',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Text('Hi $username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        child: TextButton(
                          onPressed: (){},
                          child: Text('mark all as read',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                      Visibility(
    visible: _isLoaded,
    child: ListView.builder(
    shrinkWrap: true,
    itemCount: message?.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.brown[50]
          ),
          child: Row(
            children: [

              Padding(
                padding:  EdgeInsets.all(10.0),
                child: Container(
                  height: 10,
                  width: 10,

                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25)
                  ),
                ),
              ),

              Container(
                height: 200,
                width: 280,
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Messaging(id: message![index].id ?? 2)));

                  },
                  child:  Text(message![index].message ?? 'loading',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.check), color: Colors.teal,),
                      ],
                    ),

                    Text(message![index].date?.substring(0,9) ?? "posted today")
                  ],


                ),
              )
            ],
          ),
        ),
      );
    }
    )
               )





    ],
            )
          ),
      ),
    );
  }
}

List<Alert> AlertFromJson(String str) => List<Alert>.from(json.decode(str).map((x) => Alert.fromJson(x)));
class Alert {
  final int id;
  final int? author;
  final String? date;
  final String? message;

  // final String? image;

  Alert(
      {required this.id, this.author, this.date, this.message,});

  factory Alert.fromJson( Map<String, dynamic>json){
    return Alert(
        id: json['id'],
        author: json['author'],
          date: json['date'],
        message: json['message'],

    );
  }
}
