import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:projects/Model/productModel.dart';
import 'package:projects/controller/UserProfile/user_cubit.dart';

import '../Routes/routes.dart';
import 'BottomNavBar.dart';
import 'Category.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? onCategoryTap;

  const HomePage({super.key, this.onCategoryTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getProduct(),

      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<UserCubit>(context);
          var products = cubit.products;
          var category = [
            'medicine',
            'skincare',
            'personal care',
            'baby care',
            'haircare',
            'other',
          ];
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: Text('Home')),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (input) {
                      cubit.filter(input: input);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),

                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category'),
                      InkWell(
                        onTap: widget.onCategoryTap,
                        child: Text('View all'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        final cat = category[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('images/$cat.jpg'),
                          ),
                        );
                      },
                    ),
                  ),

                  Text("Products"),

                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 3,
                      ),
                      itemCount:
                          cubit.FilteredProducts.isNotEmpty
                              ? cubit.FilteredProducts.length
                              : products.length,
                      itemBuilder: (context, index) {
                        ProductModel product =
                            cubit.FilteredProducts.isNotEmpty
                                ? cubit.FilteredProducts[index]
                                : products[index];
                        return products.length == 0
                            ? Center(child: Text("somthing werong"))
                            : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      product.imagePath.toString(),
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Icon(Icons.broken_image),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            product.name.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "${product.price} EGP",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      product.category.toString(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
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
      ),
    );
  }
}
