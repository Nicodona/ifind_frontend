import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:ifind_backend/custom/color.dart';
import 'package:ifind_backend/custom/borderBox.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  TextEditingController descriptionController = TextEditingController();
  TextEditingController mentionController = TextEditingController();
  TextEditingController datefoundController = TextEditingController();
  TextEditingController placefoundController = TextEditingController();

  File? _image;
 bool _isloading = false;
 final storage = FlutterSecureStorage();

 void api_upload(String description, mention, datefound, placefound) async {
   if(_image!.path == null || description==" " || datefound=="" || placefound==""){
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           content: Row(
             children: [
               Icon(Icons.error_outline, color: Colors.red),
               SizedBox(width: 10),
               Text('please fill all fields and add image',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.red)),
             ],
           ),
           backgroundColor: Colors.white,
           duration: Duration(seconds: 4),
           behavior: SnackBarBehavior.floating,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
         )
     );
   }else{

     try{
       final token = await storage.read(key: 'token');
       var request = MultipartRequest('POST', Uri.parse('https://ifoundapi.herokuapp.com/addfound/'));
       request.files.add( await MultipartFile.fromPath('image', _image!.path));

       request.fields['description'] = description ;
       request.fields['category'] = _value.toString();
       request.fields['mention'] = mention ?? 'No mention';
       request.fields['date_found'] = datefound;
       request.fields['place_found'] = placefound;

       print(mention);


       print(request.fields['data']);
       print("${request.fields['description']}");

       request.headers['Authorization'] = 'Token $token';
       var response = await request.send();

       if (response.statusCode==201){
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Row(
               children: [
                 Icon(Icons.check_circle, color: Colors.white),
                 SizedBox(width: 10),
                 Text('Success! Thanks for being anothers keeper',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)),
               ],
             ),
             backgroundColor: Colors.green,
             duration: Duration(seconds: 5),
             behavior: SnackBarBehavior.floating,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           ),
         );
         Navigator.pop(context);
       }else{
         print(response.statusCode);
       }
     }catch(e){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Row(
               children: [
                 Icon(Icons.error_outline, color: Colors.red),
                 SizedBox(width: 10),
                 Text('please check your internet connection',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.red)),
               ],
             ),
             backgroundColor: Colors.white,
             duration: Duration(seconds: 4),
             behavior: SnackBarBehavior.floating,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           )
       );
     }
   }

   setState(() {
     _isloading = false;
   });
 }
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future<void> _getImage() async {
    PermissionStatus galleryPermissionStatus = await Permission.storage.request();
    if (galleryPermissionStatus.isGranted){
      final imagePicker = ImagePicker();
      final image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    }else{
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red),
              SizedBox(width: 10),
              Text('please grant photo permission',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.red)),
            ],
          ),
          backgroundColor: Colors.white,
          duration: Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        )
    );

    }
  }

  Future<void> _getCamera() async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.request();
      if (cameraPermissionStatus.isGranted){
        final imagePicker = ImagePicker();
        final image = await imagePicker.pickImage(source: ImageSource.camera);

        if (image != null) {
          setState(() {
            _image = File(image.path);
          });
      }else{
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(width: 10),
                  Text('please grant permission or try again',maxLines: 4,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.red)),
                ],
              ),
              backgroundColor: Colors.white,
              duration: Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            )
        );
      }

    }
  }

  List<String> options = ['Animal', 'Bag', 'Cloth', 'Device','Document', 'FoodStuff', 'Gadget','House Equipment', 'Identity Card', 'Person', 'Phone'];

  String _value='Document';


  //permission handlers


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
                                      height: 70,
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
                                          controller: mentionController,
                                          decoration:  const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Please Provide any information or you can allow this field empty',
                                            hintStyle: TextStyle(
                                              color: Colors.grey
                                            )
                                          ),
                                        ),
                                      ),
                                    ),


                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('Date found/lost',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 43,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.brown[50]
                                        ),
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: TextFormField(
                                          textAlign: TextAlign.left,
                                          obscureText: false,
                                          controller: datefoundController,
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


                                    const Padding(padding:
                                    EdgeInsets.all(8.0),
                                      child: Text('place found/lost',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 43,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.brown[50]
                                        ),
                                        padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
                                        child: TextFormField(
                                          obscureText: false,
                                          controller: placefoundController,
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

                  Row(
                    children: [
                      Container(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                      ),
                                      child: IconButton(
                                        onPressed:  _getImage,
                                        icon: Icon(Icons.image),
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
                                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                  child: SizedBox(
                                      width: 100,
                                      height: 50,
                                      // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: ElevatedButton(


                                          onPressed: () {

                                            setState(() {
                                              _isloading = true;
                                            });

                                            api_upload(descriptionController.text.toString(), mentionController.text.toString(), datefoundController.text.toString(), placefoundController.text.toString());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.teal,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),

                                          ),
                                          child: !_isloading? const Text('Post',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ): CircularProgressIndicator()
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height:125,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: _image != null
                              ? Image.file(File(_image!.path), height: 200, width: 200, fit: BoxFit.cover,)
                              : const Text('--no image selected--'),
                        )
                      )
                    ],
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
