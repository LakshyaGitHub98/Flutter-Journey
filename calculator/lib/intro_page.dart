import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/meme.jpg'),
                //fit: BoxFit.cover,
              ),
            ),
          ),
            SizedBox(height: 30),
            Container(
              child: Text("Stuck in these calculations"),
            ),
            SizedBox(height: 30),
            // Navigation Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home'); // Navigate to HomePage
              },
              child: Text('Use this 😎',style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}