import 'package:flutter/material.dart';

class Landing3 extends StatelessWidget {
  const Landing3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset('assets/images/tips.png'),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Container(
                      child: const Text("another tip,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.normal

                        ),
                      ),
                    ),
                    Container(
                      child: const Text("You can agree on the platform from the notification part on "
                          "how to retrieve your object or you can aswell give your contact if you trust each other. "
                          "after a post made our ai will can through the image and see if similar image has been posted by"
                          " another person to make sure they are notified, we also use location to broadcast notifications to"
                          " specific users in a post"
                          " location; all this functionalities may not be available for this prototype ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: SizedBox(
                  height: 55,
                  width: 300,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.pushNamed(context, '/landing');
                      // login(emailController.text.toString(), passwordController.text.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Next',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  child: SizedBox(
                    height: 55,
                    width: 300,
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.pop(context);
                        // login(emailController.text.toString(), passwordController.text.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                      ),
                      child: const Text('<< Previous',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                ),
              )
            ],

          )
      ),
    );;
  }
}
