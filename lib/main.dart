import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projects/Shared/Network/local_network.dart';

import 'View/AppRoot.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitial();
  runApp(const MyApp());
}
