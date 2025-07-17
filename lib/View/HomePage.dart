import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:projects/Model/productModel.dart';
import 'package:projects/controller/UserProfile/user_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      UserCubit()
        ..getProduct(),

      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = BlocProvider.of<UserCubit>(context);
          var products = cubit.products;
          return Scaffold(
              body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index)
          {
            ProductModel product = products[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: products.length ==0?Center(child: Text("No"),): ListTile(
                leading: Image.network(
                  product.imagePath.toString(),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
                ),
                title: Text(product.name.toString()),
                subtitle: Text(product.category.toString()),
                trailing: Text('\$${product.price.toString()}'),
              ),
            );
          },
          )
          );
        },
      ),
    );
  }
}

    