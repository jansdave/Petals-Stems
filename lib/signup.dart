import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For filtering special characters in input fields

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _validateInputs() {
    setState(() {
      _emailErrorText = _validateEmail(_emailController.text);
      _passwordErrorText = _validatePassword(_passwordController.text);
      _confirmPasswordErrorText = _validateConfirmPassword(_confirmPasswordController.text);
    });
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter email address';
    }
    final emailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    }
    final passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please confirm password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _signup() {
    _validateInputs();

    if (_emailErrorText == null &&
        _passwordErrorText == null &&
        _confirmPasswordErrorText == null) {
      // All fields are valid, proceed with signup
      Navigator.pushReplacementNamed(context, '/login'); // Navigate to login screen after successful signup
    } else {
      // Show error message if any field is invalid
      final snackBar = SnackBar(content: Text('Please fill all fields correctly'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen (login screen)
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 223, 222, 171), Colors.green[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        errorText: _emailErrorText,
                        errorStyle: TextStyle(color: Colors.red), // Custom error text color
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            errorText: _passwordErrorText,
                            errorStyle: TextStyle(color: Colors.red), // Custom error text color
                          ),
                          obscureText: !_isPasswordVisible,
                          inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))], // Deny whitespace
                        ),
                        IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            errorText: _confirmPasswordErrorText,
                            errorStyle: TextStyle(color: Colors.red), // Custom error text color
                          ),
                          obscureText: !_isConfirmPasswordVisible,
                          inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))], // Deny whitespace
                        ),
                        IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _toggleConfirmPasswordVisibility,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text('Signup'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
