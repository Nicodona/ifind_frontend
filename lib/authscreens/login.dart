import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: 200,
            ),
            Container(
              height: 900,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                border: Border.all(color: Colors.transparent)
              ),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 160),
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
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    controller: emailController,
                                    decoration:  InputDecoration(
                                      filled: true,
                                      fillColor: Colors.brown[50],
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
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration:  InputDecoration(
                                      filled: true,
                                      fillColor: Colors.brown[50],
                                      border: InputBorder.none,
                                      hintText: 'Enter password',
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
                                  height: 40,
                                  width: 40,
                                  // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // login(emailController.text.toString(), passwordController.text.toString());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.teal,

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                    ),
                                    child: const Text('Login',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),),
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
