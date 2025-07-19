import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projects/Model/productModel.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(Update(cartItems: []));
  void addCart(ProductModel product)async{
    final updated = List<ProductModel>.from(state.cartItems)..add(product);
    emit(Update(cartItems: updated));
  }
  List<ProductModel> getProduct() {
    return state.cartItems;
  }
  void removeCart(ProductModel product)async{
    final updated = List<ProductModel>.from(state.cartItems)..remove(product);
    emit(Update(cartItems: updated));
  }
  void clearCart() {
    emit(Update(cartItems: []));
  }
  double get totalAmount {
    double total = 0;
    for (var item in state.cartItems) {
      total += item.price!;
    }
    return total;
  }
}
