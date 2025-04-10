import 'package:flutter/material.dart';

import '../services/theme_controller.dart';
import 'news_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  trysubmit() {
    final isvalid = _formkey.currentState!.validate();
    if (isvalid) {
      _formkey.currentState!.save();
      submitform();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => NewsPage()),
      );
    } else {
      print("Not valid");
    }
  }

  submitform() {
    print("Email: $email");
    print("Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              ThemeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  key: ValueKey('email'),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your E-mail",
                  ),
                  validator: (value) {
                    if (value.toString().isEmpty || value == null) {
                      return 'Please enter a email address';
                    }
                    if (value != value.toLowerCase()) {
                      return 'Email must be all lowercase';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    } else
                      return null;
                  },
                ),

                TextFormField(
                  controller: passwordController,
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.toString().isEmpty ||
                        value.toString().length < 6) {
                      return 'Please enter password of atleast 6 characters';
                    } else
                      return null;
                  },
                ),

                SizedBox(height: 20),

                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).appBarTheme.backgroundColor,
                      ),
                    ),
                    onPressed: () {
                      trysubmit();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Don't have an account? SignUp",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
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
