import 'package:flutter/material.dart';
import 'package:ifind_backend/custom/borderBox.dart';

class Missing extends StatefulWidget {
  const Missing({Key? key}) : super(key: key);

  @override
  State<Missing> createState() => _MissingState();
}

class _MissingState extends State<Missing> {
  TextEditingController searchController = TextEditingController();

  int _selectedItem = 0;

  void _onItemTpped(int index){
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,

        splashColor: Colors.teal,
        onPressed: ()=>{},
        child: IconButton(
          onPressed: ()=>{},
          icon: Icon(Icons.add),
          color: Colors.teal,
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            label: 'home',
              backgroundColor: Colors.teal,
              icon: IconButton(
            icon: Icon(Icons.home),
            iconSize: 30,
            onPressed: ()=>{},
          ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            label: 'profile',
              icon: IconButton(
            icon: Icon(Icons.shopping_bag),
            iconSize: 30,
            onPressed: ()=>{
              Navigator.pushNamed(context, '/profile')
            },
          ),
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            label: 'notify',
            icon: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: ()=>{},
            ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: IconButton(
              icon: Icon(Icons.settings),
              onPressed: ()=>{},
            ),
          ),
        ],
        currentIndex: _selectedItem,
        onTap: _onItemTpped,
      ),


      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 35,),
                          Text('Hi,John',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                            Text('Are you looking for Something?',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            )
                            )
                          ],
                        )
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        IconButton(onPressed: ()=>{},
                            icon: Icon(Icons.notifications_sharp),
                          iconSize: 35,
                        ),
                        SizedBox(width: 12,),
                       Container(
                         decoration: const BoxDecoration(
                           color: Colors.black12,
                           borderRadius: BorderRadius.all(Radius.circular(50)),
                         ),
                         child: IconButton(onPressed: ()=>{},
                             icon: Icon(Icons.person),
                           iconSize: 50,
                         ),
                       )
                      ],
                    ),
                  )

                ],
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 45,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.brown[50]
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: false,
                    controller: searchController,
                    decoration:   InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: ()=>{},
                          icon: Icon(Icons.search)),
                      border: InputBorder.none,
                      hintText: 'search for an item with keywords eg books',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                    ),
                  ),
                ),
              ),

          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child:  TextButton(
                      onPressed: (){

                      },
                      child: const Text('Found Items',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    )
                ),
                Container(
                  child:  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/jobs');
                    },
                    child: const Text('Hot Jobs',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                )
                )
              ],
            ),

          ),


          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.brown[50],
            ),

            height: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Stack(
                      children: [

                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                child: Image.asset('assets/images/bag.jpg',
                                ),
                        ),
                            ),
                      ],
                    ),
                    SizedBox(height: 5,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Bag',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),
                              ),

                               SizedBox(
                                 width: 210,
                                 child: Text('write another thing that you want to post sp that others that are ;ooking forit will find it',
                                  maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13
                                    ),
                                  ),
                               ),

                              Padding(
                                padding: EdgeInsets.only(left: 75),
                                child: Text('12/3/2013 7:45:25:2233',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    //
                    // Column(
                    //   children: [
                    //
                    //     // Text('${itemData['itemname']}', style: const TextStyle(color: COLOR_BLACK, fontSize: 20, fontWeight: FontWeight.w700,),),
                    //     Text('some bla bla bla from db'),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         // Text(' ${itemData['author']} found ${itemData['amount']} ${itemData['itemname']}', style: const TextStyle(color: COLOR_GREY, fontSize: 12, fontWeight: FontWeight.w600,),),
                    //         // Text(' at ${itemData['location']} posted today', style: const TextStyle(color: COLOR_GREY, fontSize: 11, fontWeight: FontWeight.w600,),)
                    //         Text('some bla bla \nbla from db'),
                    //         Text('some bla bla \nbla from db')
                    //       ],
                    //     ),
                    //
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       TextButton(
                    //         onPressed: (){
                    //           Navigator.pushNamed(context, '/contact');
                    //         },
                    //         child: BorderBox(
                    //             width: 50,
                    //             height: 25,
                    //             padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                    //             // child: Text('Contact ${itemData['author']}', style: const TextStyle(color: COLOR_BLACK, fontFamily: 'Montserrat', fontSize: 12),)
                    //             child: Text("some bla bla \n bla from database"),
                    //         ),
                    //       ),
                    //       Text('not found')
                    //     ],
                    //   ),
                    //   ]
                    // ),
                    // const Divider(
                    //   height: 20,
                    //   thickness: 2,
                    //   color: Colors.grey,
                    // )

                  ]
                ),


          )
            ],
          ),
        ),
      ),
    );
  }
}
