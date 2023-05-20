import 'package:flutter/material.dart';
import 'package:ifind_backend/custom/borderBox.dart';
import 'package:ifind_backend/screens/dashboard/found_det.dart';
import 'package:ifind_backend/services/remote_services.dart';

import '../../models/found.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final storage = FlutterSecureStorage();

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

  var _isLoaded = false;
  late String? username;

  Future<void> getusername() async{
    username = await storage.read(key: 'username');
    setState(() {

    });
  }

  List<Found>?  founds;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getusername();
    getData();

  }

  Future getData() async{
    founds = await RemoteSevices().getFound();
    if(founds != null){
      print(founds![1].image);
      setState(()  {
        _isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,

        splashColor: Colors.teal,
        onPressed: ()=>{
          Navigator.pushNamed(context, '/postlost')},
        child: IconButton(
          onPressed: ()=>{
            Navigator.pushNamed(context, '/postlost')
          },
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
                Navigator.pushNamed(context, '/account')
              },
            ),
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            label: 'notify',
            icon: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: ()=>{
                Navigator.pushNamed(context, '/notify')
              },
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
                          children:  [
                            SizedBox(height: 35,),
                            Text('Hi, $username',
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
                        IconButton(onPressed: ()=>{
                          Navigator.pushNamed(context, '/notify')
                        },
                          icon: Icon(Icons.notifications_active),
                          iconSize: 35,
                        ),
                        SizedBox(width: 12,),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: IconButton(onPressed: ()=>{
                            Navigator.pushNamed(context, '/account')
                          },
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

                SingleChildScrollView(
                  child: Visibility(
                    visible: _isLoaded,
                    child: RefreshIndicator(
                      onRefresh: getData,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: founds?.length,
                        itemBuilder: (context, index){
                          return  SingleChildScrollView(
                            child: Container(
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
                                          height: 100,
                                          width: 150,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(25)),
                                            child: FadeInImage(
                                              image: NetworkImage(founds![index].image ?? " "),
                                              placeholder: AssetImage(
                                                  "assets/images/default.png"),
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                    'assets/images/default.png',
                                                );
                                              },
                                              fit: BoxFit.fill,
                                            )
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),

                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: InkWell(
                                          onTap: (){
                                            print(founds![index].item_id);
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailfound(item_id: founds![index].item_id ?? 1)));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:  [
                                                  Text(founds![index].category ?? '',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    width: 199.5,
                                                    child: Text(founds![index].description ?? "",
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 13
                                                      ),
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Text(founds![index].updated?.substring(0,9) ?? "",
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
                                        ),
                                      ),
                                    )

                                  ]
                              ),


                            ),
                          );
                          print(founds![index].image);
                        }
                      ),
                    ),
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),


            ],
          ),
        ),
      ),
    );
  }
}