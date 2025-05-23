import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:read_hear/views/screens/homescreen1.dart';
import 'signup.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  'Login',
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
                  padding: const EdgeInsets.only(left: 19, top: 8, right: 19),
                  child: Row(
                    children: [
                      AnimatedSwitch(
                        colorOff: Color(0xffA09F99),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookApp()),
                        );
                      },
                      child: Container(
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
                    ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '-----------',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        ' Or Login With ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '-----------',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Social media login buttons with consistent styling
                      _socialMediaButton(Icons.g_mobiledata),
                      SizedBox(width: 20),
                      _socialMediaButton(Icons.apple),
                      SizedBox(width: 20),
                      _socialMediaButton(Icons.facebook),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to the Signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        'Sign up now.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 243, 243, 245),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Social media button for login
  Widget _socialMediaButton(IconData icon) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: Color(0xff484848),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
