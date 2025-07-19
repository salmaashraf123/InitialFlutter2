import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/Cart/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<CartCubit>(context);
        var prod = cubit.getProduct();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'My Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color.fromRGBO(55, 6, 6, 1),
          ),
          body: Column(
            children: [
              Expanded(
                child:
                    prod.length == 0
                        ? Center(
                          child: Text(
                            'Your cart is empty',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )
                        : ListView.builder(
                          itemCount: prod.length,
                          itemBuilder: (context, index) {
                            final item = prod[index];
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 4),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    item.imagePath!,
                                    width: 70,
                                    height: 70,
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${item.price!}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(55, 6, 6, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      cubit.removeCart(item);
                                    },
                                    icon: Icon(Icons.remove_circle_outline),
                                    color: Color.fromRGBO(55, 6, 6, 1),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(55, 6, 6, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${cubit.totalAmount.toStringAsFixed(2)} EGP',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/checkout');
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                color: Color.fromRGBO(55, 6, 6, 0.2),
                                spreadRadius: 3,
                              ),
                            ],
                            color: Color.fromRGBO(55, 6, 6, 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
