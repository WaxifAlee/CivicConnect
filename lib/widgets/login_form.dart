import 'package:civic_connect/themes/app_theme.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSubmit;

  const LoginForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey,
      required this.onSubmit});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            // Email Field Row with Icon
            Row(
              children: [
                Icon(
                  Icons.alternate_email,
                  color: AppTheme.themePlaceHolderText,
                ),
                SizedBox(width: 12),
                Expanded(
                    child: TextFormField(
                  controller: widget.emailController,
                  decoration: InputDecoration(
                      labelText: ' Email ID',
                      labelStyle: TextStyle(
                        color: AppTheme.themePlaceHolderText,
                        fontSize: 14,
                      )),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ))
              ],
            ),

            SizedBox(height: 16),

            // Password Field Row with Icon
            Row(
              children: [
                Icon(Icons.lock, color: AppTheme.themePlaceHolderText),
                SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                      controller: widget.passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                          labelText: " Password",
                          labelStyle: TextStyle(
                            color: AppTheme.themePlaceHolderText,
                            fontSize: 14,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppTheme.themePlaceHolderText,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              })),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      }),
                )
              ],
            ),

            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: widget.onSubmit,
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppTheme.themePurple,
                      ),
                    ))
              ],
            ),

            SizedBox(height: 34),

            SizedBox(
              width: double.infinity,
              height: 42,
              child: TextButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.onSubmit();
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(AppTheme.themePurple),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ));
  }
}
