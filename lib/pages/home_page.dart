import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginagain/firebase_options.dart';
import 'package:loginagain/pages/about.dart';
import 'package:loginagain/pages/contact_info_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginagain/pages/profilepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GrievanceDashboard());
}

class GrievanceDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Grievance System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("About College"),
          content: Text(
              "This is where you can display information about the college."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
        ],
        title: Text('Grievance Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate back to the dashboard
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GrievanceDashboard()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Navigate to AboutPage screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              title: Text('Contact Information'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to ContactInformationPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContactInformationPage()),
                );
              },
            ),
            ListTile(
              title: Text('Your Account'),
              onTap: () {
                // Navigate to ProfilePage screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[200]!, Colors.grey[400]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to VESIT Grievance System',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Grievance Submission screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GrievanceSubmissionScreen()),
                      );
                    },
                    child: Text('Grievance'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Helpline: 123-456-7890',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email: example@example.com',
          ),
        ],
      ),
    );
  }
}

class GrievanceSubmissionScreen extends StatefulWidget {
  @override
  _GrievanceSubmissionScreenState createState() =>
      _GrievanceSubmissionScreenState();
}

class _GrievanceSubmissionScreenState extends State<GrievanceSubmissionScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields values
  String _namecontroller = '';
  String _classcontroller = '';
  String _departmentcontroller = '';
  String _rollNumbercontroller = '';
  String _contactNumbercontroller = '';
  String _grievancecontroller = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Grievance'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _namecontroller = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Class'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your class';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _classcontroller = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Department'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your department';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _departmentcontroller = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Roll Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your roll number';
                  }
                  if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                    return 'Please enter a valid roll number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _rollNumbercontroller = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _contactNumbercontroller = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Grievance'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your grievance';
                  }
                  if (value.length > 1000) {
                    return 'Maximum word length exceeded (1000 words)';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _grievancecontroller = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, submit the grievance
                    // You can implement the submission logic here
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to submit the form data to Firestore
  void _submitGrievance(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Form is valid, show success message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Form Submitted"),
            content:
                Text("Your grievance form has been submitted successfully!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );

      // You can also add code here to submit the form data to the database
    }
  }

  Widget StreamBuilderBase(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Grievance'),
      ),
      body: Container(
        // Your existing code...
        child: ElevatedButton(
          onPressed: () {
            _submitGrievance(context);
          }, // Call the _submitGrievance function
          child: Text('Submit'),
        ),
        // Your existing code...
      ),
    );
  }
}

class SubmissionSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submission Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Grievance Submitted Successfully!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
