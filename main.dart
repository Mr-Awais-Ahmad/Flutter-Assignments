import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment_2',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 162, 227),
        title: Text(
          'Access Page',
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        centerTitle: true, // Add this line to center the title
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 200, // Set the desired width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                      });
                    },
                    child:
                        Text('Continue', style: TextStyle(color: Colors.blue)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              if (email != null && password != null)
                Center(
                  child: SizedBox(
                    width: 200, // Set the desired width for the column
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'username or phone number: $email',
                          textAlign: TextAlign.center, // Center the text
                        ),
                        Text(
                          'Password: $password',
                          textAlign: TextAlign.center, // Center the text
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
