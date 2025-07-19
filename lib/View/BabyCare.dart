import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/Cart/cart_cubit.dart';
import 'package:provider/provider.dart';
import '../controller/UserProfile/user_cubit.dart';

class BabyCare extends StatelessWidget {
  const BabyCare({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<UserCubit>(context);
        var products = cubit.products
            .where((elem) => elem.category.toString().toLowerCase() == 'baby & mommy care')
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text("Skin Care Products"),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Image.network(
                            product.imagePath.toString(),
                            height:100,
                            width: 80,
                            fit: BoxFit.cover,

                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.description!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Category: ${product.category}",
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${product.price} EGP",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 15,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      final cartProvider = Provider.of<CartCubit>(context, listen: false);
                                      cartProvider.addCart(product);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('${product.name} Done')),
                                      );
                                    },
                                    icon: const Icon(Icons.add_shopping_cart),
                                    color: Colors.teal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
