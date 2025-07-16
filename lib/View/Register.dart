import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/Auth/auth_cubit.dart';

import '../Routes/routes.dart';
import 'ButtonStyling.dart';
import 'ThemeData/Theme.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.of(context).pushNamed(Routes.loginPage);
        } else if (state is RegisterFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 80.0),
                      TextFormField(
                        controller: name,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: "Enter your full name",
                          labelStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                        },
                      ),
                      const SizedBox(height: 50.0),
                      TextFormField(
                        controller: email,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: "Enter your Email",
                          labelStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                        },
                      ),
                      const SizedBox(height: 50.0),
                      TextFormField(
                        controller: pass,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: "Enter a new Password",
                          labelStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Text("have an account? Login"),
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.loginPage);
                          },
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).register(
                                  email: email.text,
                                  pass: pass.text,
                                  name: name.text,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: GetTheme().secondaryHeaderColor,
                            ),
                            child: Text(
                              state is RegisterLoading
                                  ? "Loading...."
                                  : "Register",
                              style: GetTheme().textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
