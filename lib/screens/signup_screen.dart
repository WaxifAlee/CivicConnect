import 'package:civic_connect/themes/app_theme.dart';
import 'package:civic_connect/widgets/back_button.dart';
import 'package:civic_connect/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    // Add your login logic here
    print(
        "Login with Email: ${_emailController.text}, Password: ${_passwordController.text}");
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.themeWhite,
        leading: CustomBackButton(backTo: "/login"),
      ),
      backgroundColor: AppTheme.themeWhite,
      body: Padding(
        padding: EdgeInsets.only(
            left: AppTheme.borderPadding + 8,
            right: AppTheme.borderPadding + 8),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Register an Account",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.themeGray),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Image(
                  image: const AssetImage('assets/images/signup.png'),
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.9,
                ),
              ),
              SignupForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  usernameController: _usernameController,
                  addressController: _addressController,
                  phoneController: _phoneController,
                  confirmPasswordController: _confirmpasswordController,
                  formKey: _formKey,
                  onSubmit: _handleSignUp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Joined us before?",
                    style: TextStyle(color: AppTheme.themeGray),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: AppTheme.themePurple,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
