import 'package:flutter/material.dart';
import 'package:ifind_backend/custom/color.dart';
import 'package:ifind_backend/custom/borderBox.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class JobPost extends StatefulWidget {
  const JobPost({Key? key}) : super(key: key);

  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  File? _image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
  Future<void> _getCamera() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  List<String> options = ['Animal', 'Bag', 'Cloth', 'Device','Document', 'FoodStuff', 'Gadget','House Equipment', 'Identity Card', 'Man', 'Person', 'Phone'];

  String _value='Document';

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
              height: 55.0,
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


                                    SizedBox(height: 12,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('Title',
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
                                          controller: titleController,
                                          decoration:  const InputDecoration(
                                            // filled: true,
                                            // fillColor: Colors.brown[50],
                                              border: InputBorder.none,
                                              hintText: 'job title e:g chantier',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey
                                              )
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 12,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('number of person needed',
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
                                          controller: amountController,
                                          decoration:  const InputDecoration(
                                            // filled: true,
                                            // fillColor: Colors.brown[50],
                                              border: InputBorder.none,
                                              hintText: '10 men',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey
                                              )
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 12,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('location',
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
                                          controller: locationController,
                                          decoration:  const InputDecoration(
                                            // filled: true,
                                            // fillColor: Colors.brown[50],
                                              border: InputBorder.none,
                                              hintText: 'Mbengwi road',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey
                                              )
                                          ),
                                        ),
                                      ),
                                    ),


                                    SizedBox(height: 12,),
                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('payment',
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
                                          controller: paymentController,
                                          decoration:  const InputDecoration(
                                            // filled: true,
                                            // fillColor: Colors.brown[50],
                                              border: InputBorder.none,
                                              hintText: 'more than 2000fcfa',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey
                                              )
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 12,),
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
                                          controller: descriptionController,
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


                                  ],
                                ),
                              )

                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child: IconButton(
                            onPressed:  _getImage,
                            icon: Icon(Icons.add_a_photo),
                            iconSize: 35,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            child: IconButton(
                              onPressed: _getCamera,
                              icon: Icon(Icons.camera_alt_outlined),
                              iconSize: 35,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),


                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 230.0, 8.0),
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
                            child: const Text('Post',
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
