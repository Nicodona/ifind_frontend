import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final storage = FlutterSecureStorage();
  bool _isloading = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String username, password) async {
    if (username==""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Text(
          "password must be provided",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red
          ),
        ),
      ),
        backgroundColor: Colors.grey,
      ));
    } else if(username == ""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Text(
          "username must be provided",
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
            Uri.parse("https://ifoundapi.herokuapp.com/login/"),
            body: {
              'username': username,
              'password': password,
            }
        );

        var data = jsonDecode(response.body.toString());
        if (data['status'] == 200) {
          final token = data['token'];
          final username = data['username'];
          final id = data['id'];
          await storage.write(key: 'token', value: token);
          await storage.write(key: 'username', value: username);
          await storage.write(key: 'id', value: id.toString());

          Navigator.pushNamed(context, '/found');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 10),
                  Text('succesfully log in, you can find your lost now',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          );

        }
        else if(data['status']==100){
          print(data['token']);
          final token = data['token'];
          final username = data['username'];
          final id = data['id'];

          await storage.write(key: 'token', value: token);
          await storage.write(key: 'username', value: username);
          await storage.write(key: 'id', value: id.toString());
          Navigator.pushNamed(context, '/profile');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 10),
                  Text('you are now login, complete your profile',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          );;
        }
        else if(data['status']==400){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
            child: Text(
              "wrong credentials",
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
      _isloading = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenPadding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.teal,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: screenHeight*0.2,
            ),
            Container(
              // height: 900,
              height: screenHeight * 1.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                border: Border.all(color: Colors.transparent)
              ),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                    Padding(
                      // padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
                      padding:  EdgeInsets.symmetric(vertical: 10.0 + screenPadding.vertical, horizontal: 80.0 + screenPadding.horizontal),
                      child: Container(
                          child: const Text("Login",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 30
                          ),
                          ),
                      ),
                    ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Container(
                        width: screenWidth*0.36,
                        height: (MediaQuery.of(context).size.height),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(5 + screenPadding.left),
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
                                    controller: usernameController,
                                    decoration:  const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter username',
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
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration:  const InputDecoration(
                                      // filled: true,
                                      // fillColor: Colors.brown[50],
                                      border: InputBorder.none,
                                      hintText: 'Enter password',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children:  <Widget>[
                                  const SizedBox(

                                    width: 40,
                                  ),
                                  //SizedBox
                                  const Text("Don't have an account ?",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 16.0,
                                      )),
                                  TextButton(
                                    onPressed: ()=>{ Navigator.pushNamed(context, '/signup')},
                                    child: const Text("SignUp",
                                        style: TextStyle(color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold
                                        )),
                                  )
                                ], //<Widget>[]
                              ),
                              SizedBox(height: 20,),


                              SizedBox(
                                  height: 55,
                                  width: 40,
                                  // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: ElevatedButton(
                                      child: !_isloading? const CircularProgressIndicator():const Text('Login',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold
                                        ),),

                                      onPressed: () {
                                        setState(() {
                                          _isloading = false;
                                        });
                                        // Navigator.pushNamed(context, '/home');
                                        login(usernameController.text.toString(), passwordController.text.toString());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.teal,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),

                                      ),
                                    ),
                                  )
                              ),

                            ],
                          ),
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
