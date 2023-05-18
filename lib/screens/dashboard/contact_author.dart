import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Contact extends StatefulWidget {
  final int author_id;
  const Contact({Key? key, required this.author_id}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  TextEditingController conController = TextEditingController();
  TextEditingController platformController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void send(String platform, contact, message) async{
    final username = await storage.read(key: 'username');
    final token = await storage.read(key: 'token');
  try{
    Response response = await post(
        Uri.parse("https://ifoundapi.herokuapp.com/message/"),
        body: {
          'reciever': widget.author_id.toString(),
          'message': message + '. please you can reach me '+ platform +'@'+ contact,
          'author': username,
        },
        headers: {'Authorization': 'Token $token'}

    );

    if (response.statusCode==200){
      print('successfully sent your message');
    }else{
      print(response.statusCode);
    }
  }catch(e){
    print(e.toString());
  }
  }


  final storage = FlutterSecureStorage();
  Future<Author?> getdata() async{
    print(widget.author_id);
    try{
      var client = Client();
      final token = await storage.read(key: 'token');
      var uri = Uri.parse("https://ifoundapi.herokuapp.com/register/${widget.author_id}/");
      var response = await client.get(
        uri, headers: {'Authorization': 'Token $token'},
      );

      final Map<String,dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode==200){

        final int id = responseData['id'];
        final int my_id = responseData['my_id'];
        final String region=responseData['region'];
        final String profession= responseData['profession'];
        final String phone=responseData['phone'];
        final String name =responseData['name'];
        final String location =responseData['location'];
        print(responseData['my_id']);
        return Author(id: id, my_id: my_id, name: name, profession: profession,location: location,phone: phone,region: region);

      }else{
        print('error fetching');
        print(responseData['name']);
        print(widget.author_id);
        print(responseData['profession']);
      }
    }catch(e){
      print(e.toString());
      print(widget.author_id);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<Author?>(
          future: getdata(),
         builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final Author author = snapshot.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){},
                      icon: Icon(Icons.arrow_back_ios,
                      ),
                      iconSize: 40,
                    ),

                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.notifications),
                      iconSize: 40,
                    ),
                  ],

                ),
              ),
              Center(
                child: Container(
                  height: 180,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      child: FadeInImage(
                        image: AssetImage(
                            "assets/images/bag.jpg"),
                        placeholder: AssetImage(
                            "assets/images/bag.jpg"),
                        imageErrorBuilder:
                            (context, error, stackTrace) {
                          return Image.asset(
                              'assets/images/bag.jpg',
                              fit: BoxFit.fitWidth);
                        },
                        fit: BoxFit.cover,
                        width: 180,
                      )
                  ),



                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () async{
                      final link = WhatsAppUnilink(
                        phoneNumber: '${author.phone}',
                        text: "Hey! I'm inquiring about a missing item you posted on ifind",
                      );
                      // Convert the WhatsAppUnilink instance to a string.
                      // Use either Dart's string interpolation or the toString() method.
                      // The "launchUrlString" method is part of "url_launcher_string".
                      await launchUrlString('$link');



                    }, icon: Icon(Icons.whatsapp_outlined),color:Colors.teal, iconSize: 40,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.facebook_outlined),iconSize: 40,color: Colors.blue,),
                    IconButton(onPressed: ()=>{



                    }, icon: Icon(Icons.mail_outline),iconSize: 40,color: Colors.red,),

                    IconButton(onPressed: ()async {
                        final Uri launchUri = Uri(
                          scheme: 'tel',
                          path: author.phone,
                        );
                        await launchUrl(launchUri);

                    }, icon: Icon(Icons.phone),iconSize: 40,color: Colors.black,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${author.name}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('you can ifind the various links to get in touch with the Author or fill below',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.brown[50],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children:  [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.sensor_occupied),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: platformController,
                                      decoration: InputDecoration(
                                          hintText: 'contact platform  e:g whatsapp',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.brown[50],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children:  [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.sensor_occupied),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: conController,
                                      decoration: InputDecoration(
                                          hintText: 'contact e:g +237677665544',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 90,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.brown[50],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.message_rounded),
                                ),
                                Container(
                                  height: 70,
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: messageController,
                                      decoration: InputDecoration(
                                          hintText: 'type a message to the author',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 200,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: (){
                                send(platformController.text.toString(), conController.text.toString(), messageController.text.toString());
                              },
                              child: Text('Notify Author'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23),
                                ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          );


        } else{
          return Padding(
            padding: const EdgeInsets.all(80.0),
            child: const Center(child: Text("No Data. User may have deleted account")),
          );
        }
    }
    ),
      )
    );
  }
}
class Author {
  final int id;
  final int? my_id;
  final String? name;
  final String? region;
  final String? location;
  final String? phone;
  final String? profession;
  // final String? image;

  Author(
      { required this.id, this.my_id, this.name, this.region, this.location, this.phone, this.profession});
}