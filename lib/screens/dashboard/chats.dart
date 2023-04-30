import 'package:flutter/material.dart';


class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [

              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      child: const Text('Chats',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 05),
                child: Container(
                  child: TextButton(
                    onPressed: (){},
                    child: const Text('Beginning of your conversation',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.brown[50]
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 400,
                        child: TextButton(
                          onPressed: (){},
                          child: const Text(' some body in Ghana street bamenda just mentioned you in a lost item announcement check out here ',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Nico',
                            style: TextStyle(
                              fontStyle: FontStyle.italic
                            ),
                            ),
                            Text('2/3/2023'),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.teal
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 400,
                        child: TextButton(
                          onPressed: (){},
                          child: const Text(' some body in Ghana street bamenda just mentioned you in a lost item announcement check out here ',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('2/3/2023',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white
                            ),
                            ),
                            Text(''),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );;
  }
}
