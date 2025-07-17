import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/Routes/router.dart';
import 'package:projects/Shared/Network/local_network.dart';
import 'package:projects/View/ThemeData/Theme.dart';
import 'package:projects/controller/Auth/auth_cubit.dart';
import '../Routes/routes.dart';
import '../controller/UserProfile/user_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=> AuthCubit()),
        BlocProvider(create: (context)=> UserCubit()..getProduct()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashPage,
        onGenerateRoute: onGenerate,
        theme: GetTheme(),
      ),
    );
  }
}
