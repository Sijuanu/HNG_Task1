import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 550,
              child: Image.asset("lib/images/new_logo.jpg")
            ),
            const SizedBox(
              height: 50,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Have you been looking for where to shop and get any product, Welcome to ",
                style: TextStyle(color: Colors.black,fontSize: 21),
                children: [
                  TextSpan(
                    text: "MyShopping ",
                    style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.purple)
                  ),
                  TextSpan(
                    text: "where we sell varieties of products at cheap and affordable price.",
                    style: TextStyle(fontSize: 21,color: Colors.black)
                  )
                ]
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.purple,
                borderRadius: BorderRadius.circular(15)
              ),
              child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text("Get Started",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold),)
              ),
            )
          ],
        ),
    );
  }
}