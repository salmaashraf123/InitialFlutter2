import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:projects/Model/ProfileModel.dart';

import '../../Model/productModel.dart';
import '../../Shared/Network/local_network.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  ProfileModel? profileModel;
  final token =  CacheNetwork.getCache(key: "access_token");
  void getUserData() async {
    emit(UserLoading());
    Response response = await http.get(
      Uri.parse("https://api.escuelajs.co/api/v1/auth/profile"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      profileModel = ProfileModel.fromJson(responseData);
      emit(UserSuccess());
    } else {
      emit(UserFailed(error: "Something went wrong. Status code: ${response.statusCode}"));
    }
  }
  List<ProductModel> products = [];
  List<ProductModel> FilteredProducts = [];
  void filter({required String input }){
    FilteredProducts = products.where((element) => element.name!.toLowerCase().startsWith(input.toLowerCase())).toList();
    emit(filterSuccess());
  }
  void getProduct({String? category})async{
    emit(ProdLoading());
    Response response = await http.get(
      Uri.parse('https://6878349b31d28a460e1d71d5.mockapi.io/api/products/products'),
      headers: {
       'Authorization' : CacheNetwork.getCache(key: 'access_token'),
     }
    );
    var responseBody = jsonDecode(response.body);
    if(response.statusCode == 200){
       for(var elem in responseBody){
         products.add(ProductModel.fromJson(data: elem));
       }
       emit(ProdSuccess());
    }
    else{
      emit(ProdFailed(error : "somthing wrong"));
    }

  }

}
