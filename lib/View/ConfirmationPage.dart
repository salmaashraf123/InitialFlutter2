import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/UserProfile/user_cubit.dart';
import 'package:projects/controller/nav_bar_cubit.dart';

import '../Routes/routes.dart';
import 'BottomNavBar.dart';


class ConfirmationPage extends StatelessWidget {

  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Order Confirmed"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100,
            ),
            SizedBox(height: 24),
            Text(
              "Thank you for your order!",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}