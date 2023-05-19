import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:ifind_backend/custom/borderBox.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  bool _isloading = false;

  final storage = FlutterSecureStorage();
  void profile(String name, phone, location, profession) async {

    final token = await storage.read(key: 'token');

    if (name=="" || phone=="" || location=="" ||  profession==""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Text(
          "please fill all fields",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red
          ),
        ),
      ),
        backgroundColor: Colors.grey,
      ));
    }
    else{
      try {
        Response response = await post(
            Uri.parse("https://ifoundapi.herokuapp.com/add_register/"),
            body: {
              'name': name,
              'phone': '+237'+phone,
              'location': location,
              'region': _value,
              'profession': profession
            },
            headers: {'Authorization': 'Token $token'}
        );
        var data = jsonDecode(response.body.toString());
        if (response.statusCode == 200) {
          print('register successful');
          Navigator.pushNamed(context, '/found');

        } else if(data['status']==400){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
            child: Text(
              "account exist",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.red
              ),
            ),
          ),
            backgroundColor: Colors.grey,
          ));
        }else{
          print('error');
          print(response.statusCode);
        }
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Text(
            "please check your network connection",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red
            ),
          ),
        ),
          backgroundColor: Colors.grey,
        ));
      }

    }
    setState(() {
      _isloading = false;
    });
  }



  List<String> options = ['NORTH WEST', 'SOUTH WEST', 'LITTORAL', 'CENTRAL','WEST', 'SOUTH', 'NORTH','FAR NORTH', 'ADAMAWA', 'EAST',];

  String _value='NORTH WEST';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.teal,
      //   items: [
      //   ],
      //
      // ),
      backgroundColor: Colors.teal,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: 85.0,
            ),
            Container(
              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                  border: Border.all(color: Colors.transparent)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 155),
                    child: Container(
                      child: const Text("Profile",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 30
                        ),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      child: Text('please complete your prifile to help us get you with best experience, your information is invisible to others',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800
                      ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(padding: const EdgeInsets.fromLTRB(20.0, 0.0, 40.0, 0.0),
                      child: Form(
                        child: Container(
                            width: 360,
                            height: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child:  ListView(
                                children: <Widget>[
                                  SizedBox(
                                    height: 55,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.brown[50]
                                      ),
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      child: TextFormField(
                                        obscureText: false,
                                        controller: nameController,
                                        decoration:  const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Full Name',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  SizedBox(
                                    height: 55,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.brown[50]
                                      ),
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      child: DropdownButton(

                                        value: _value,

                                        items: options.map((e) =>

                                            DropdownMenuItem(

                                              child: Text(e.toString()), value: e.toString(),)).toList(),

                                        onChanged: (newValue) {

                                          setState(() {

                                            _value = newValue.toString() ;

                                          });

                                        },
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20,),
                                  SizedBox(
                                    height: 55,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.brown[50]
                                      ),
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      child: TextFormField(
                                        controller: phoneController,
                                        decoration:  const InputDecoration(
                                          // filled: true,
                                          // fillColor: Colors.brown[50],
                                          border: InputBorder.none,
                                          hintText: 'Contact e:g 677445561',
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20,),
                                  SizedBox(
                                    height: 55,
                                    width: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.brown[50]
                                      ),
                                      padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
                                      child: TextFormField(
                                        controller: professionController,
                                        decoration:  const InputDecoration(
                                          // filled: true,
                                          // fillColor: Colors.brown[50],
                                          border: InputBorder.none,
                                          hintText: 'Professional',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  SizedBox(
                                    height: 55,
                                    width: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.brown[50]
                                      ),
                                      padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
                                      child: TextFormField(
                                        controller: locationController,
                                        decoration:  const InputDecoration(
                                          // filled: true,
                                          // fillColor: Colors.brown[50],
                                          border: InputBorder.none,
                                          hintText: 'address',
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            )

                        ),
                      ),
                    ),
                  ),

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                        child: SizedBox(
                            width: 200,
                            height: 50,
                            // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(

                              onPressed: () {
                                setState(() {
                                  _isloading == true;
                                });
                                profile(nameController.text.toString(), phoneController.text.toString(),locationController.text.toString(), professionController.text.toString());
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),

                              ),
                              child: !_isloading?  Text(' submit and continue',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),): const CircularProgressIndicator()
                            )
                        ),
                  ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
