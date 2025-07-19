import 'package:flutter/material.dart';


class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Order Confirmed", style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(55, 6, 6, 1),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Color.fromRGBO(55, 6, 6, 1),
              size: 100,
            ),
            SizedBox(height: 24),
            Text(
              "Thank you for your order!",
              style: TextStyle(color: Color.fromRGBO(55, 6, 6, 1),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                backgroundColor: Color.fromRGBO(55, 6, 6, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Row(
                children: [
                  Icon(Icons.home_outlined, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Back to My Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}