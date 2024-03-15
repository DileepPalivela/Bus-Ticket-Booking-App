import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'LoginPage.dart'; // Assuming your login page is in a separate file

// Assuming you have a LoginPage class defined (refer to previous responses)

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // Add additional fields and logic for registration here
  String _name = "";
  String _email = "";
  String _pass = "";
  String _conpass = "";
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255))
              .copyWith(secondary: Color.fromARGB(255, 22, 239, 228))),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // hide the back arrow
          title: Row(
            children: [
              Icon(
                FontAwesomeIcons.bus,
                color: Colors.white,
              ),
              SizedBox(width: 8), // add some spacing between icon and text
              Text(
                'Aquatic Stream Bus',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 22, 239, 228),
          elevation: 0, // remove the shadow
        ),
        body: SingleChildScrollView(
          child: Container(
            // ... similar container styling as login page ...
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 480,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 22, 239, 228),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'User Name',
                            suffixIcon: Icon(
                              FontAwesomeIcons.user,
                              size: 17,
                            ),
                          ),
                          onChanged: (value) => setState(() => _name = value),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              FontAwesomeIcons.envelope,
                              size: 17,
                            ),
                          ),
                          onChanged: (value) => setState(() => _email = value),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: TextField(
                          obscureText: !_showPassword, // Toggle based on state
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 17,
                              ),
                              onPressed: () => setState(
                                  () => _showPassword = !_showPassword),
                            ),
                          ),
                          onChanged: (value) => setState(() => _pass = value),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          obscureText: !_showPassword, // Toggle based on state
                          decoration: InputDecoration(
                            labelText: 'Conform Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 17,
                              ),
                              onPressed: () => setState(
                                  () => _showPassword = !_showPassword),
                            ),
                          ),
                          onChanged: (value) =>
                              setState(() => _conpass = value),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            print(
                                'Registering with name: $_name, email: $_email, password: $_pass, Conform Pasword: $_conpass');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 22, 239, 228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            ),
                            child: Text(
                              'Already have an account?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 22, 239, 228)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.facebookF,
                            color: Color.fromARGB(255, 22, 239, 228),
                          ),
                          Icon(
                            FontAwesomeIcons.google,
                            color: Color.fromARGB(255, 22, 239, 228),
                          ),
                          Icon(
                            FontAwesomeIcons.github,
                            color: Color.fromARGB(255, 22, 239, 228),
                          ),
                          Icon(
                            FontAwesomeIcons.solidEnvelope,
                            color: Color.fromARGB(255, 22, 239, 228),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
