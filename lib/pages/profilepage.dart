import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[200]!, Colors.grey[400]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'images/umeed poster.png'), // You can replace this with your profile image
              ),
              SizedBox(height: 20),
              Text(
                'Swarnika Singh', // Replace with user's name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'test@gmail.com', // Replace with user's email
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Class : D15B', // Replace with user's class
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Roll No : 63', // Replace with user's roll number
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
