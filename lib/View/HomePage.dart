import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('images/DawakLogo.png'),
          SizedBox(height: 24.0,),
          Row(
            children: [
              Text(
                'Sales',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

    