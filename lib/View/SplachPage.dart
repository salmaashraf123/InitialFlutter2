import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Routes/routes.dart';
import '../Shared/Network/local_network.dart';
import 'package:projects/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), ()
    {
      if (!mounted) return;
      String token = CacheNetwork.getCache(key: 'access_token') ?? "";
        if (token.isNotEmpty) {
          Navigator.pushReplacementNamed(context, Routes.navbar);
        } else {
          Navigator.pushReplacementNamed(context, Routes.loginPage);
        }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Text(
            'Welcome to',
            style: GoogleFonts.agdasima(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Image.asset("images/LogoForSplash.png"),
          Text(
            'feeling sick ? Get your DAWAK now!',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
//color: .fromRGBO(64, 0, 16 , 1)
