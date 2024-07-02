import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/screen/auth/signin.dart';
import 'package:untitled/screen/auth/widgets/inputDecoration.dart';
import 'package:untitled/screen/validators/index.dart';
import 'package:untitled/service/auth_service.dart';

import '../layout_landing.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  String email = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set the color of the container
          border: Border.all(
            color: Colors.grey, // Set the color of the border
            width: 0.5, // Set the width of the border
          ),
          borderRadius: BorderRadius.circular(16), // Set the border radius
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                FlutterI18n.translate(context, "auth.sign_up"),
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: CusTomInputDecoration(
                            FlutterI18n.translate(context, "auth.email"))
                            .getInputDecoration(),
                        validator: (value) => EmailValidator.validate(value!),
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: CusTomInputDecoration(
                                  FlutterI18n.translate(
                                      context, "auth.first_name"))
                                  .getInputDecoration(),
                              validator: (value) =>
                                  FirstnameValidator.validate(value!),
                              onSaved: (value) {
                                firstName = value!;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Optional: to give some space between the fields
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: CusTomInputDecoration(
                                  FlutterI18n.translate(
                                      context, "auth.last_name"))
                                  .getInputDecoration(),
                              validator: (value) =>
                                  LastnameValidator.validate(value!),
                              onSaved: (value) {
                                lastName = value!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: CusTomInputDecoration(
                            FlutterI18n.translate(context, "auth.password"))
                            .getInputDecoration(),
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) =>
                            PasswordValidator.validate(value!),
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: CusTomInputDecoration(FlutterI18n.translate(
                            context, "auth.confirm_password"))
                            .getInputDecoration(),
                        obscureText: true,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _submit();
                      },
                      child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: Center(
                              child: Text(
                                  FlutterI18n.translate(
                                      context, "auth.sign_up"),
                                  style:
                                  const TextStyle(color: Colors.white)))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            FlutterI18n.translate(context, "auth.have_account"),
                            style: const TextStyle(fontSize: 16)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LayoutLanding(child: SignIn(),),
                              ),
                            );
                          },
                          child: Text(
                            FlutterI18n.translate(context, "auth.sign_in"),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.blue),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      user = User(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
      );
      try {
        final response = await signUp(email, password, firstName, lastName);
        print(response.body);
        // Handle the response here
      } catch (e) {
        print(e.toString());
        // Handle the error here
      }
    }
  }
}
