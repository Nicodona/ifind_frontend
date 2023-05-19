import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';


class Messaging extends StatefulWidget {
  final int id;
  const Messaging({Key? key, required this.id}) : super(key: key);

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  final storage = FlutterSecureStorage();

   // late String? userid;
   // Future<void> getid() async{
   //   userid= await storage.read(key: 'id');
   //   setState(() {
   //
   //   });
   // }




   TextEditingController newController = TextEditingController();


  void serve(String message) async{
    final id = await storage.read(key: 'id');
    final reciever = await storage.read(key: 'reciever');
    final token = await storage.read(key: 'token');
    try{
      Response response = await post(
          Uri.parse("https://ifoundapi.herokuapp.com/message/"),
          body: {
            'reciever': reciever,
            'message': message,
            'author': id,
          },
          headers: {'Authorization': 'Token $token'}

      );

      if (response.statusCode==201){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 10),
                Text('reply sent, please always check notification for new messages',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)),
              ],
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        );
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }


// this functio uses the class Msg defined below to get data from backend and render the page

  Future<Msg?> getdata() async{
    try{
      var client = Client();
      final token = await storage.read(key: 'token');
      var uri = Uri.parse("https://ifoundapi.herokuapp.com/message/${widget.id}");
      var response = await client.get(
        uri, headers: {'Authorization': 'Token $token'},
      );
      final Map<String,dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode==200){

        final int id = responseData['id'];
        final int author = responseData['author'];
        final String message=responseData['message'];
        final String date= responseData['date'];

        await storage.write(key: 'reciever', value: author.toString());

        return Msg(id: id, author: author, message: message, date:date);
      }else{
        print('error fetching');
        print(responseData['category']);
        print(widget.id);
        print(responseData['author']);
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          children: [
            FutureBuilder<Msg?>(
              future: getdata(),
    builder: (context,snapshot){
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
    final Msg msg = snapshot.data!;

    // need to be modified to take int instead
    return Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.brown[50]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Container(
                    width: 225,
                    child: TextButton(
                      onPressed: (){},
                      child: Text('${msg.message}',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${msg.date}'),
                        )
                      ],


                    ),
                  )
                ],
              ),
            ),
    );


    }else{
            return Text('');
    }


    }
    ),
          SizedBox(height: 150,),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.brown[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children:  [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.message),
                      ),
                      Container(
                        height: 70,
                        width: 295,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: newController,
                            decoration: InputDecoration(
                                hintText: 'reply',
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: IconButton(
                          onPressed: (){
                            serve(newController.text.toString(), );
                          },
                          icon: Icon(Icons.send, color: Colors.teal,),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

      )
    );
  }
}
class Msg {
  final int id;
  final int? author;
  final String? date;
  final String? message;

  // final String? image;

  Msg({required this.id, this.author, this.date, this.message,});

}


class Acc {
  final int id;
  final String? username;
  final String? email;


  // final String? image;

  Acc({required this.id, this.email, this.username,});

}