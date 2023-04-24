import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 155),
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
                  Container(
                    child: Padding(padding: const EdgeInsets.fromLTRB(8.0, 8.0, 80.0, 0.0),
                      child: Form(
                        child: Container(
                            width: 360,
                            height: 300,
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
                                      child: TextFormField(
                                        obscureText: false,
                                        controller: regionController,
                                        decoration:  const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Region',
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
                                        controller: phoneController,
                                        decoration:  const InputDecoration(
                                          // filled: true,
                                          // fillColor: Colors.brown[50],
                                          border: InputBorder.none,
                                          hintText: 'Contact',
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
                                        obscureText: true,
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
                            width: 100,
                            height: 50,
                            // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              child: const Text('Save',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                ),
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
