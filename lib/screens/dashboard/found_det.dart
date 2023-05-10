import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:ifind_backend/custom/borderBox.dart';

import '../../models/found.dart';



class Detailfound extends StatefulWidget {
  final int item_id;
  const Detailfound({Key? key,required this.item_id}) : super(key: key);

  @override
  State<Detailfound> createState() => _DetailfoundState();
}
final storage = FlutterSecureStorage();

class _DetailfoundState extends State<Detailfound> {


  Future<Object?> getdata() async{
    try{
      var client = Client();
      final token = await storage.read(key: 'token');
      var uri = Uri.parse("https://ifoundapi.herokuapp.com/found/${widget.item_id}");
      var response = await client.get(
        uri, headers: {'Authorization': 'Token $token'},
      );
      final Map<String,dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode==200){

        final int item_id = responseData['item_id'];
        final int author = responseData['author'];
        final String category=responseData['category'];
        final String description= responseData['description'];
        final String mention=responseData['mention'];
        final String place_found=responseData['place_found'];
        final String updated=responseData['updated'];
        final String image=responseData['image'];

        return Object(item_id: item_id, author: author, category: category, description: description,mention: mention,place_found: place_found,updated: updated,image: image);
      }else{
        print('error fetching');
        print(responseData['category']);
        print(widget.item_id);
        print(responseData['author']);
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // data = getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<Object?>(
        future: getdata(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final Object object = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.fromLTRB(8.0,20.0,8.0,8.0),
              child: SingleChildScrollView(
                child: Container(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 450,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),

                                      child: FadeInImage(
                                        image: NetworkImage(object.image ?? " "),
                                        placeholder: AssetImage(
                                            "assets/images/bag.jpg"),
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                              'assets/images/bag.jpg',
                                              fit: BoxFit.fitWidth);
                                        },
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      )

                                  ),
                                ),

                                Positioned(
                                  top: 15,
                                  left: 15,
                                  child: IconButton(onPressed: ()=>{
                                    Navigator.pop(context)
                                  },
                                    icon: Icon(Icons.arrow_back_ios),
                                    iconSize: 35,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 8.0,8.0,1.0),
                              child: Row(
                                children: [

                                  // Text('${itemData['itemname']}', style: const TextStyle(color: COLOR_BLACK, fontSize: 20, fontWeight: FontWeight.w700,),),
                                  SizedBox(
                                    width: 300.5,
                                    child: Text( "${object.category}",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 19,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),             Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 1.0,8.0,8.0),
                              child: Row(
                                children: [

                                  // Text('${itemData['itemname']}', style: const TextStyle(color: COLOR_BLACK, fontSize: 20, fontWeight: FontWeight.w700,),),
                                  SizedBox(
                                    width: 300.5,
                                    child: Text( "This ${object.category}  was found at ${object.place_found} on ${object.updated}",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.brown[50],
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 80),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        // Text('${itemData['itemname']}', style: const TextStyle(color: COLOR_BLACK, fontSize: 20, fontWeight: FontWeight.w700,),),
                                        SizedBox(
                                          width: 300.5,
                                          child: Text( "Description:",
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 19,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                            // Text(' Someone found ${object.category}  at ${object.place_found} on ${object.updated}',
                                            //   maxLines: 4,
                                            //   overflow: TextOverflow.ellipsis,
                                            //   style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600,)
                                            //   ,)



                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        // Text('${itemData['itemname']}', style: const TextStyle(color: COLOR_BLACK, fontSize: 20, fontWeight: FontWeight.w700,),),
                                        SizedBox(
                                          width: 300.5,
                                          child: Text("${object.description}",
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 13
                                            ),
                                          ),
                                        ),
                                        // Text(' Someone found ${object.category}  at ${object.place_found} on ${object.updated}',
                                        //   maxLines: 4,
                                        //   overflow: TextOverflow.ellipsis,
                                        //   style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600,)
                                        //   ,)



                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 80),
                                    child: Row(
                                      children: [
                                        TextButton(
                                          onPressed: (){
                                            // Navigator.pushNamed(context, '/contact');
                                          },
                                          child: BorderBox(
                                              width: 200,
                                              height: 50,
                                              padding:  EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                                              child: Text('See author information', style: const TextStyle(color: Colors.teal, fontFamily: 'Montserrat', fontSize: 12),)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 20,
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),

                                  Text('See Related Items')
                                ],
                              ),
                            ),
                            
                          ],



                        )

                    ),
              ),
            );
          }else{
            return Text('');
          }
        },
      )

    );;
  }
}
class Object {
  final int? item_id;
  final int? author;
  final String? category;
  final String? description;
  final String? mention;
  final String? place_found;
  final String? updated;
  final String? image;

  Object(
      { this.item_id, this.author, this.description, this.mention, this.updated, this.category, this.image, this.place_found});
}