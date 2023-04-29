import 'package:flutter/material.dart';
import 'package:ifind_backend/custom/borderBox.dart';

class DetailJob extends StatefulWidget {
  const DetailJob({Key? key}) : super(key: key);

  @override
  State<DetailJob> createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child:Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),

                      child: Image.asset('assets/images/bag.jpg')),

                   Positioned(
                      top: 15,
                      left: 15,
                      child: IconButton(onPressed: ()=>{},
                      icon: Icon(Icons.arrow_back_ios),
                        iconSize: 35,
                        color: Colors.white,
                      ),
                   )
                ],
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('some text here'),

                  // Text('${itemData['itemname']}', style: const TextStyle(color: COLOR_BLACK, fontSize: 20, fontWeight: FontWeight.w700,),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('this item was found at commercial avenue', style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600,)),
                    Text('some text here'),
                      // Text(' ${itemData['author']} found ${itemData['amount']} ${itemData['itemname']}', style: const TextStyle(color: COLOR_GREY, fontSize: 12, fontWeight: FontWeight.w600,),),
                      // Text(' at ${itemData['location']} posted today', style: const TextStyle(color: COLOR_GREY, fontSize: 11, fontWeight: FontWeight.w600,),)
                    ],
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/contact');
                    },
                    child: BorderBox(
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                        child: Text('some text here'),
                        // child: Text('Contact ${itemData['author']}', style: const TextStyle(color: COLOR_BLACK, fontFamily: 'Montserrat', fontSize: 12),)
                    ),
                  ),
                  Text('not found')
                ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
                color: Colors.grey,
              ),

              Text('See Related Items')
            ],



          )

      ),
    );;
  }
}
