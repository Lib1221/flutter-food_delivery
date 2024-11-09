// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:check/Authservice/auth.dart';
import 'package:check/Authservice/shared/loading.dart';
import 'package:check/Authservice/welcome/Screens/Login/login_screen.dart';
import 'package:check/Authservice/welcome/components/already_have_an_account_acheck.dart';
import 'package:check/Authservice/welcome/constants.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  SignupForm({super.key});
  bool loading = false;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return loading?Loading():
    Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (val) => val!.isEmpty ? 'Enter an email' : null,
            onChanged: (val) {
              setState(() => email = val);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (val) =>
                  val!.length < 6 ? 'Enter a password 6+ chars long' : null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        loading = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please enter valid data!')),
                            );
                      });
                    }
              }
    
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          Text(
            error,
            style: const TextStyle(color: Colors.red, fontSize: 14.0),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: defaultPadding * 2,
          ),
        ],
      ),
    );
  }
}

