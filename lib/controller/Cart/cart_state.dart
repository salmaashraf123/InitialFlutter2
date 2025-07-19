part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  final List<ProductModel> cartItems;
  CartState({required this.cartItems});
}

class Update extends CartState{
  Update({required super.cartItems});
}

