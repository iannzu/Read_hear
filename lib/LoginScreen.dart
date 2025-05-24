import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:read_hear/views/screens/homescreen1.dart';
import 'dart:convert';// Replace with your actual Home screen widget
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final double borderRadius = 25.0;
  final double paddingValue = 20.0;

 Future<void> loginUser() async {
 final url = Uri.parse("http://192.168.47.8:8000/login/");// adjust to your backend IP

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    }),
  );

  if (response.statusCode == 200) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BookApp()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login failed: ${response.body}")),
    );
  }
}

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
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(paddingValue),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        fillColor: const Color(0xffD8D8DD),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(paddingValue),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: const Icon(Icons.visibility_off),
                        fillColor: const Color(0xffD8D8DD),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      children: [
                        const Icon(Icons.check_box_outline_blank, color: Colors.grey),
                        const SizedBox(width: 5),
                        const Text('Remember me', style: TextStyle(color: Colors.grey)),
                        const Spacer(),
                        const Text('Forgot Password', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: loginUser,
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D166D),
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('-----------', style: TextStyle(color: Colors.white, fontSize: 30)),
                        Text(' Or Login With ', style: TextStyle(color: Colors.white)),
                        Text('-----------', style: TextStyle(color: Colors.white, fontSize: 30)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialMediaButton(Icons.g_mobiledata),
                      const SizedBox(width: 20),
                      _socialMediaButton(Icons.apple),
                      const SizedBox(width: 20),
                      _socialMediaButton(Icons.facebook),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ", style: TextStyle(color: Colors.white)),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
                        },
                        child: const Text(
                          'Sign up now.',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialMediaButton(IconData icon) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xff484848),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon, color: Colors.white, size: 40),
    );
  }
}
