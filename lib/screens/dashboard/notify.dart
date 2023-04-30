import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [

                Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_back_ios),
                      iconSize: 40,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                        child: const Text('Notifications',
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
                  padding: const EdgeInsets.only(left: 200),
                  child: Container(
                    child: TextButton(
                      onPressed: (){},
                      child: Text('mark all as read',
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.brown[50]
                  ),
                  child: Row(
                    children: [

                      Padding(
                        padding:  EdgeInsets.all(20.0),
                        child: Container(
                          height: 15,
                          width: 15,

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                      ),
                      
                      Container(
                        width: 225,
                        child: TextButton(
                          onPressed: (){},
                          child: const Text(' some body in Ghana street bamenda just mentioned you in a lost item announcement check out here ',
                          maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.check), color: Colors.teal,),
                                IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.teal,),
                              ],
                            ),

                            Text('2/3/2023')
                          ],


                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
