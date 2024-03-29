import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../homePage/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // List<dynamic> users = [];
  // Future<void> fetchUser() async {
  //   print('fetchData called');
  //   const url = 'https://stuverse.shop/api/login/';
  //   final uri = Uri.parse(url);
  //
  //   // Modify the code to use http.post for sending POST request
  //   final response = await http.post(uri, body: {
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //   });
  //
  //   if (response.statusCode == 200) {
  //     // Handle the successful response
  //     print('Login successful');
  //     // You might want to parse and handle the response accordingly
  //   } else {
  //     print('Failed to fetch data. Error code: ${response.statusCode}');
  //     // Handle error if necessary
  //   }
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchUser();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Text(
                '@',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 64,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,

                  hintText: 'username',
                  hintStyle: GoogleFonts.lexend(
                    color: Color(0xff9E9E9E),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'password',
                  hintStyle: GoogleFonts.lexend(
                    color: Color(0xff9E9E9E),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeScreen(),
                  //     ));
                  String username = emailController.text;
                  String password = passwordController.text;
                  login(username, password, context);
                },
                child: Container(
                  child: const Text('Log in'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Meta",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
login(String username, String password, BuildContext context) async {
  var headers = {
    'Content-Type': 'application/json',
    'User-Agent': 'insomnia/8.5.0',
    'Authorization': 'Token 44f91df7464f18117c3b52d77cb054bbdf34ee0b'
  };

  var url = 'https://stuverse.shop/api/login/';
  var body = json.encode({"username": username, "password": password});

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } else {
      print('Login failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error during login: $e');
  }
}