import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:projects/Shared/Network/local_network.dart';

import '../../View/Login.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({
    required String email,
    required String pass,
    required String name,
  }) async {
    emit(RegisterLoading());
    final defaultAvatar = 'https://ui-avatars.com/api/?name=$name';
    Response response = await http.post(
      Uri.parse("https://api.escuelajs.co/api/v1/users"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': pass,
        'name': name,
        'role': 'customer',
        'avatar': defaultAvatar,
      }),
    );
    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 400) {
      emit(RegisterFailed(message: responseBody['message'][0]));
    } else {
      emit(RegisterSuccess());
    }
  }

  void login({required String email, required String pass}) async {
    emit(LoginLoading());
    try {
      Response response = await http.post(
        Uri.parse("https://api.escuelajs.co/api/v1/auth/login"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': pass}),
      );
      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        if (responseData['access_token'] != null) {
          final accessToken = responseData['access_token'];
          final refreshToken = responseData['refresh_token'];
          print(responseData['access_token']);
          await CacheNetwork.insertToCache(key: 'access_token', value: accessToken);
          await CacheNetwork.insertToCache(key: 'refresh_token', value: refreshToken);
          emit(LoginSuccess());
        } else {
          debugPrint(
            "failed to login , the reason is : ${responseData['message']}",
          );
          emit(LoginFailed(message: responseData['message']));
        }
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      emit(LoginFailed(message: e.toString()));
    }
  }
  void logout(BuildContext context)async{
    await CacheNetwork.deleteCacheItem(key: 'access_token');
    await CacheNetwork.deleteCacheItem(key: 'refresh_token');
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => Login()),
          (route) => false,
    );
  }
}
