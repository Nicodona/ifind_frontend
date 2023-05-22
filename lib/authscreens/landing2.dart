import 'package:flutter/material.dart';

class Landing2 extends StatelessWidget {
  const Landing2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset('assets/images/tips.png'),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    Container(
                      child: const Text("tips",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.normal

                        ),
                      ),
                    ),

                    Container(
                      child: const Text("create an account and a unique id will be given to you, instead of putting your mobile phone numbers on your document that can cause you some security threats, inprint this id on your document. when the get missing and some  one finds it they can just search your id on this platform and contact you"
                          "your personal information isnt shared on this platform, no other user can see them, they are just used to provide you will feeds",
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
                      Navigator.pushNamed(context, '/landing3');
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
                      child: const Text('<< previous',
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
