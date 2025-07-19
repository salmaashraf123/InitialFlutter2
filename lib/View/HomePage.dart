import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/Model/productModel.dart';
import 'package:projects/controller/UserProfile/user_cubit.dart';


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
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Color.fromRGBO(55, 6, 6, 1.0),
                      child: Image.asset("images/WhiteLogo.png"),
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      onChanged: (input) {
                        cubit.filter(input: input);
                      },
                      style: TextStyle(color: Colors.black),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category', style:TextStyle(color: Color.fromRGBO(55, 6, 6, 1) , fontWeight: FontWeight.bold , fontSize: 18)),
                        InkWell(
                          onTap: widget.onCategoryTap,
                          child: Text('View all' , style : TextStyle(color: Color.fromRGBO(55, 6, 6, 1))),
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
                    Align( alignment: Alignment.topLeft, child: Text("Products" , style:TextStyle(color: Color.fromRGBO(55, 6, 6, 1) , fontWeight: FontWeight.bold , fontSize:18))),
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
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        product.imagePath.toString(),
                                        height: 100,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          );
        },
      ),
    );
  }
}
