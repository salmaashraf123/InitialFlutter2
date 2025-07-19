import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/Auth/auth_cubit.dart';

import '../Routes/routes.dart';
import 'ButtonStyling.dart';
import 'ThemeData/Theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushNamed(Routes.navbar);
        } else if (state is LoginFailed) {
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
          bottomNavigationBar: null,
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
                        'Login',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 80.0),
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
                          hintText: "Enter your Password",
                          labelStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Text("Don't have an account? Register"),
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushNamed(Routes.registerPage);
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
                              if (formKey.currentState!.validate() == true) {
                                BlocProvider.of<AuthCubit>(
                                  context,
                                ).login(email: email.text, pass: pass.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: GetTheme().secondaryHeaderColor,
                            ),
                            child: Text(
                              state is LoginLoading ? "Loading.." : "Login",
                              style: GetTheme().textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'forget your password? ' , style: TextStyle(color: Colors.black)),
                                TextSpan(text: 'Click here' , style: TextStyle(color: Colors.blue)),
                              ]
                            )
                        ),
                      )
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
