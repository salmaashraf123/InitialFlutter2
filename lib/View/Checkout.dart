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
    final userCubit = Provider.of<UserCubit>(context);
    final cartCubit = Provider.of<CartCubit>(context, listen: false);
    final prod = cartCubit.getProduct();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Items in your order:",
            ),
            SizedBox(height: 10),
            Expanded(
              child: prod.isEmpty
                  ? Center(
                child: Text(
                  "No items selected",
                ),
              )
                  : ListView.builder(
                itemCount: prod.length,
                itemBuilder: (context, index) {
                  final product = prod[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                      leading: SizedBox(
                        width: 40, // علشان نضمن حجم مناسب
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
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        "EGP ${product.price!.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Delivery Address:",
              ),
            SizedBox(height: 6),
            TextField(
              controller: _addressController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Enter your address",
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}