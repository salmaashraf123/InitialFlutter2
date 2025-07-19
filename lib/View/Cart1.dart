import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/Cart/cart_cubit.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState> (
        listener: (context, state) {},
        builder: (context, state) {
    var cubit = BlocProvider.of<CartCubit>(context);
    var prod = cubit.getProduct();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: prod.length == 0 ? Center(
                child: Text('Your cart is empty'))
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
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        item.imagePath!,
                        width: 70,
                        height: 70,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name!,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${item.price!}',
                            style: TextStyle(
                                fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          cubit.removeCart(item);
                        },
                        icon: Icon(Icons.remove_circle_outline),
                        color: Colors.red,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('TOTAL', style: TextStyle(
                        fontSize: 22, color: Colors.black)),
                    const SizedBox(height: 10),
                    Text('${cubit.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/checkout');
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
        },
        );
  }
}
