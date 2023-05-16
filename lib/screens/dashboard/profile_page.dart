import 'package:flutter/material.dart';

import '../../custom/borderBox.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.arrow_back_ios,
                      ),
                    iconSize: 40,
                  ),

                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.notifications),
                    iconSize: 40,
                  ),
                ],

              ),
            ),
            Center(
              child: Container(
                height: 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(200)),
                    child: FadeInImage(
                      image: AssetImage(
                          "assets/images/bag.jpg"),
                      placeholder: AssetImage(
                          "assets/images/bag.jpg"),
                      imageErrorBuilder:
                          (context, error, stackTrace) {
                        return Image.asset(
                            'assets/images/bag.jpg',
                            fit: BoxFit.fitWidth);
                      },
                      fit: BoxFit.cover,
                      width: 180,
                    )
                ),



              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.whatsapp_outlined),color:Colors.teal, iconSize: 40,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.facebook_outlined),iconSize: 40,color: Colors.blue,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline),iconSize: 40,color: Colors.red,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.phone),iconSize: 40,color: Colors.black,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("My Name",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Profession or something of first order, engineer for chantier works',
              textAlign: TextAlign.center,
              maxLines: 2,
                overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
              ),
            ),

            SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.brown[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.comment),
                          ),
                          Text("comment"),
                          Padding(
                            padding: EdgeInsets.only(left: 210),
                            child: Icon(Icons.navigate_next_sharp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.brown[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.add_reaction_rounded),
                          ),
                          Text("see jobs"),
                          Padding(
                            padding: EdgeInsets.only(left: 210),
                            child: Icon(Icons.navigate_next_sharp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.brown[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.gpp_bad),
                          ),
                          Text("Report account"),
                          Padding(
                            padding: const EdgeInsets.only(left: 165),
                            child: IconButton(
                              onPressed: (){},
                                icon: Icon(Icons.navigate_next_sharp)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )

          ],
        ),
    );
  }
}