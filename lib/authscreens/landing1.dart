import 'package:flutter/material.dart';

class Landing1 extends StatefulWidget {
  const Landing1({Key? key}) : super(key: key);

  @override
  State<Landing1> createState() => _Landing1State();
}

class _Landing1State extends State<Landing1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset('assets/images/default.png'),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                Container(
                child: const Text("Welcome to A platform that aims to help the community",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                      fontSize: 21,
                      fontWeight: FontWeight.bold

                  ),
                ),
                ),
                    Container(
                      child: const Text("ifind brings hope to dazed and stranded individuals, "
                          " feel free to dig its functionalities, please you can provide any information to test the platform, information provided will be available"
                          " only within 24 hours. make sure you twerk around the properly and let your friends know about it",
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
              SizedBox(height: 10,),
              Container(
                child: SizedBox(
                  height: 55,
                  width: 300,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.pushNamed(context, '/landing2');
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
                        Navigator.pushNamed(context, '/landing');
                        // login(emailController.text.toString(), passwordController.text.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                      ),
                      child: const Text('skip',
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
