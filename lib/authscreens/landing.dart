import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [

            Image.asset('assets/images/search.png'),
        Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                    child: const Text("Introducing ifind, the ultimate app for finding your missing items."
                        "With ifind, you will never have to waste your precious"
                        " time finding your missing belongings or person",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.normal

                      ),
                    ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: SizedBox(
                height: 55,
                width: 300,
                child: ElevatedButton(

                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    // login(emailController.text.toString(), passwordController.text.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Login',
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
                      Navigator.pushNamed(context, '/signup');
                      // login(emailController.text.toString(), passwordController.text.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.teal,
                        width: 2.0,
                      ),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),

                    ),
                    child: const Text('Signup',
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
    );
  }
}
