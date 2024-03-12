// contact_information_page.dart

import 'package:flutter/material.dart';

class ContactInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Here are the contact information')),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[200]!, Colors.grey[400]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.near_me),
              title: Center(child: Text('Coucellor : Dr. Ravita Mishra')),
              subtitle: Center(child: Text('PHD in Psychology')),
              onTap: () {
                // Implement action when helpline is tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Center(child: Text('Phone No. 8433634222')),
              subtitle: Center(child: Text('Available 24/7')),
              onTap: () {
                // Implement action when helpline is tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Center(child: Text('Email: example@example.com')),
              subtitle: Center(child: Text('Send us an email for inquiries')),
              onTap: () {
                // Implement action when email is tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Center(child: Text('Office Location:')),
              subtitle: Center(child: Text('123 Street Name, City, Country')),
              onTap: () {
                // Implement action when office location is tapped
              },
            ),
            // Add more ListTile widgets for additional contact information
          ],
        ),
      ),
    );
  }
}
