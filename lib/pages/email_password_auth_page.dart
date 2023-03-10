import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../managers/auth_manager.dart';

class EmailPasswordAuthPage extends StatefulWidget {
  final bool isNewUser;
  const EmailPasswordAuthPage({
    required this.isNewUser,
    super.key,
  });

  @override
  State<EmailPasswordAuthPage> createState() => _EmailPasswordAuthPageState();
}

class _EmailPasswordAuthPageState extends State<EmailPasswordAuthPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    AuthManager.instance.startListening();
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isNewUser
              ? "Create a New User"
              : "Log in an Existing User"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 250.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: emailTextController,
                  validator: (String? value) {
                    if (value == null || !EmailValidator.validate(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Must be a valid email format"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: passwordTextController,
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.length < 6) {
                      return "Passwords must be at least 6 characters";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: "Passwords must be at least 6 characters"),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 40.0,
                width: 220.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(
                          "Email: ${emailTextController.text}  Password: ${passwordTextController.text}");
                      if (widget.isNewUser) {
                        print("TODO: Create a new user!");
                        AuthManager.instance.createNewUserEmailPassword(
                            context: context,
                            email: emailTextController.text,
                            password: passwordTextController.text
                        );
                      } else {
                        print("TODO: Log in an existing user");

                      }
                    } else {
                      print("This form isn't valid, do nothing");
                    }
                  },
                  child: Text(
                    widget.isNewUser ? "Create Account" : "Log In",
                    style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}