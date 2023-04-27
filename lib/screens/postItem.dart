import 'package:flutter/material.dart';
import 'package:ifind_backend/custom/color.dart';
import 'package:ifind_backend/custom/borderBox.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController nameController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();
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
              width: 1000,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                  border: Border.all(color: Colors.transparent)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 111),
                    child: Container(
                      child: const Text("make a post",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 30
                        ),
                      ),
                    ),

                  ),
                  Expanded(
                    child: Container(
                      child: Padding(padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: Form(
                          child: Container(
                              width: 360,
                              height: 500,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    SizedBox(height: 15.0,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('Category',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45,
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
                                              hintText: 'Commercial Avenue Bamenda',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey
                                              )
                                          ),
                                        ),
                                      ),
                                    ),

                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('Description',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600
                                      ),
                                      ),
                                    ),


                                    SizedBox(
                                      height: 75,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.brown[50]
                                        ),
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: TextFormField(
                                          obscureText: false,
                                          controller: nameController,
                                          textAlign: TextAlign.center,
                                          minLines: 1,
                                          maxLines: 5,
                                          decoration:  const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'brief description to enlighten others but do not '
                                                'provide details to avoid flase claims',
                                            hintStyle: TextStyle(
                                              color: Colors.grey
                                            ),
                                            contentPadding: EdgeInsets.all(10.0)
                                          ),
                                        ),
                                      ),
                                    ),


                                    SizedBox(height: 20,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('Mention',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 75,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.brown[50]
                                        ),
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          minLines: 1,
                                          maxLines: 5,
                                          obscureText: false,
                                          controller: regionController,
                                          decoration:  const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Please Provide any information found on objects this information is hidden from users',
                                            hintStyle: TextStyle(
                                              color: Colors.grey
                                            )
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('Date found',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.brown[50]
                                        ),
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: TextFormField(
                                          textAlign: TextAlign.left,
                                          obscureText: true,
                                          controller: phoneController,
                                          decoration:  const InputDecoration(
                                            // filled: true,
                                            // fillColor: Colors.brown[50],
                                            border: InputBorder.none,
                                            hintText: 'dd/mm/yyyy',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey
                                              )
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 15.0,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('place found',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45,
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
                                            hintText: 'Commercial Avenue Bamenda',
                                            hintStyle: TextStyle(
                                              color: Colors.grey
                                            )
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
