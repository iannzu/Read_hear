import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'LoginScreen.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  // Define consistent padding and border radius values
  final double borderRadius = 25.0;
  final double paddingValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage('assets/images/back.png'),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withAlpha((0.8 * 255).round()),
                  Colors.black.withAlpha((0.15 * 255).round()),
                  Colors.black.withAlpha((0.5 * 255).round()),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Consistent padding for TextFields
                Padding(
                  padding: EdgeInsets.all(paddingValue),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      fillColor: Color(0xffD8D8DD),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(0, 10, 43, 70),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingValue),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      fillColor: Color(0xffD8D8DD),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(0, 10, 43, 70),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingValue),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                      suffixIcon: Icon(Icons.visibility_off),
                      fillColor: Color(0xffD8D8DD),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(0, 10, 43, 70),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingValue),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Confirm Password'),
                      suffixIcon: Icon(Icons.visibility_off),
                      fillColor: Color(0xffD8D8DD),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(0, 10, 43, 70),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19, top: 8, right: 19),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Text(
                        'Password must be at least 8 to 12 characters (the longer,\nthe better) and a mix of uppercase letters, lowercase\nletters, numbers, and special characters (e.g., !, @, etc.).',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D166D),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                  );
                                },
                                child: Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Sign up now.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
