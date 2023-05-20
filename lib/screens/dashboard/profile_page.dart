import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../custom/borderBox.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}
class _UserState extends State<User> {



  final storage = FlutterSecureStorage();
  Future<UserData?> getdata() async{
    final id = await storage.read(key: 'id');
    print(id);
    try{
      var client = Client();
      final token = await storage.read(key: 'token');
      var uri = Uri.parse("https://ifoundapi.herokuapp.com/register/${id}/");
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
        return UserData(id: id, my_id: my_id, name: name, profession: profession,location: location,phone: phone,region: region);

      }else{
        print('error fetching');
        print(responseData['name']);
        print(responseData['profession']);
      }
    }catch(e){
      print(e.toString());
      print(id);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<UserData?>(
                  future: getdata(),
                  builder: (context,snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final UserData author = snapshot.data!;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                },
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
                                        "assets/images/default.png"),
                                    placeholder: AssetImage(
                                        "assets/images/default.png"),
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/default.png',
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
                                IconButton(onPressed: () async{}, icon: Icon(Icons.whatsapp_outlined),color:Colors.teal, iconSize: 40,),
                                IconButton(onPressed: (){}, icon: Icon(Icons.facebook_outlined),iconSize: 40,color: Colors.blue,),
                                IconButton(onPressed: ()=>{}, icon: Icon(Icons.mail_outline),iconSize: 40,color: Colors.red,),

                                IconButton(onPressed: ()async {}, icon: Icon(Icons.phone),iconSize: 40,color: Colors.black,),
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

                          Center(
                            child: Container(
                                height: 100,
                                child: Container(
                                  height: 200,
                                  width: 300,
                                  child: Column(
                                    children: [
                                      Text("${author.my_id}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 4
                                        ),
                                      ),
                                      Text("${author.location}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: 2
                                        ),),
                                      Text("${author.phone}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: 2
                                        ),),
                                      Text("${author.profession}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: 2
                                        ),),
                                    ],
                                  ),

                                )



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
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: Colors.brown[50],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.delete, color: Colors.red,),
                                            ),
                                            Text("delete account"),
                                            Padding(
                                              padding: EdgeInsets.only(left: 190),
                                              child: Icon(Icons.navigate_next_sharp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: Colors.brown[50],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.logout),
                                            ),
                                            Text("logout"),
                                            Padding(
                                              padding: EdgeInsets.only(left: 240),
                                              child: Icon(Icons.navigate_next_sharp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: Colors.brown[50],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.gpp_bad),
                                            ),
                                            Text("Report account"),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 166),
                                              child: IconButton(
                                                  onPressed: (){},
                                                  icon: Icon(Icons.navigate_next_sharp)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
              
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Column(
                    children: [
                      const Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Text('see your post')
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

class UserData {
  final int id;
  final int? my_id;
  final String? name;
  final String? region;
  final String? location;
  final String? phone;
  final String? profession;
  // final String? image;

  UserData(
      { required this.id, this.my_id, this.name, this.region, this.location, this.phone, this.profession});
}