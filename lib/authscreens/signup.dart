import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ifind_backend/custom/color.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isloading = false;

  void signup(String email, username, password, confirm) async {

    if (username=="" || email=="" || password=="" || confirm==""){
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
    else if(password != confirm){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Text(
          "password did not match",
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
            Uri.parse("https://ifoundapi.herokuapp.com/user/"),
            body: {
              'email': email,
              'username': username,
              'password': password
            }
        );

        var data = jsonDecode(response.body.toString());
        if (response.statusCode == 200) {
          print('register successful');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: 100,
            ),
            Container(
              height: 900,
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
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 155),
                    child: Container(
                      child: const Text("Signup",
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
                          width: 360,
                          height: (MediaQuery.of(context).size.height),
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
                                      controller: emailController,
                                      decoration:  const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter Email',
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
                                      obscureText: false,
                                      controller: usernameController,
                                      decoration:  const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter Username',
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
                                      controller: confirmPasswordController,
                                      decoration:  const InputDecoration(
                                        // filled: true,
                                        // fillColor: Colors.brown[50],
                                        border: InputBorder.none,
                                        hintText: 'Confirm Password',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children:  <Widget>[
                                    SizedBox(

                                      width: 40,
                                    ),
                                    //SizedBox
                                    Text("Don't have an account ?",
                                        style: TextStyle(color: Colors.black,
                                          fontSize: 16.0,
                                        )),
                                    TextButton(
                                      onPressed: () => {
                                      Navigator.pushNamed(context, '/login')
                                      },
                                      child: Text("Login",
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

                                        onPressed: () {
                                          setState(() {
                                            _isloading = true;
                                          });
                                          signup(emailController.text.toString(),usernameController.text.toString(), passwordController.text.toString(),confirmPasswordController.text.toString());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),

                                        ),
                                        child: !_isloading?  Text('Signup',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),): const CircularProgressIndicator()
                                      ),
                                    )
                                ),

                              ],
                            ),
                          )

                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
