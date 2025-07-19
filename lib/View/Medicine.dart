import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/controller/Cart/cart_cubit.dart';
import 'package:provider/provider.dart';
import '../controller/UserProfile/user_cubit.dart';

class Medicine extends StatelessWidget {
  const Medicine({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<UserCubit>(context);
        var products =
        cubit.products
            .where(
              (elem) =>
          elem.category.toString().toLowerCase() ==
              'medicine',
        )
            .toList();

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text("Medicine"  , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
              centerTitle: true,
              backgroundColor: Color.fromRGBO( 55,
                6,
                6,
                1,),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];

                      return Card(
                        color: Colors.white,
                        elevation: 8,
                        shadowColor: Color.fromRGBO(120, 30, 40, 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Image.network(
                                  product.imagePath.toString(),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
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
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "Category: ${product.category}",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${product.price} EGP",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                              55,
                                              6,
                                              6,
                                              1,
                                            ),
                                            fontSize: 15,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            final cartProvider =
                                            Provider.of<CartCubit>(
                                              context,
                                              listen: false,
                                            );
                                            cartProvider.addCart(product);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  '${product.name} Done',
                                                ),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.add_shopping_cart,
                                            color: Color.fromRGBO(
                                              55,
                                              6,
                                              6,
                                              1,
                                            ),
                                          ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
