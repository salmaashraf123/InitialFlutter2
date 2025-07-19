import 'package:flutter/material.dart';
import 'package:projects/controller/Cart/cart_cubit.dart';

import 'package:provider/provider.dart';

import '../Model/productModel.dart';
import '../controller/UserProfile/user_cubit.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartCubit = Provider.of<CartCubit>(context, listen: false);
    final prod = cartCubit.getProduct();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Checkout" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromRGBO(55, 6, 6, 1),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Items in your order:",
               style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: prod.isEmpty
                  ? Center(
                child: Text(
                  "No items selected",
                    style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold , fontSize:15 )
                ),
              )
                  : ListView.builder(
                itemCount: prod.length,
                itemBuilder: (context, index) {
                  final product = prod[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      leading: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.network(
                          product.imagePath!,
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        product.name!,
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        "${product.price!.toStringAsFixed(2) } EGP",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Delivery Address:",
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 6),
            TextField(
              controller: _addressController,
              maxLines: 2,
             style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter your address",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(55 , 6 , 6 , 1),
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Estimated delivery: 24 hours",
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                 backgroundColor: Color.fromRGBO(55 , 6 , 6 , 1),
                  fixedSize: Size(170, 50),
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(40),
                  ),
                ),

                onPressed: () {
                  final address = _addressController.text.trim();
                  if (address.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter a delivery address")),
                    );
                    return;
                  }
                  for (var product in prod) {

                    cartCubit.removeCart(product);
                  }
                  Navigator.of(context).pushNamed('/confirm' , arguments: address);
                },
                child: Text(
                  "Confirm Order",
                  style: TextStyle(fontSize: 18, color: Colors.white ,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}