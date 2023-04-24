import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
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
                                  children: const <Widget>[
                                    SizedBox(

                                      width: 40,
                                    ),
                                    //SizedBox
                                    Text("Don't have an account ?",
                                        style: TextStyle(color: Colors.black,
                                          fontSize: 16.0,
                                        )),
                                    Text("SignUp",
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold
                                        ))
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
                                          // login(emailController.text.toString(), passwordController.text.toString());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),

                                        ),
                                        child: const Text('Signup',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),),
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
