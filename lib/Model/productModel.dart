import 'dart:ffi';

class ProductModel {
  String? name;
  String? imagePath;
  String?  category;
  String?  description;
  double? price;

  ProductModel.fromJson({required Map<String , dynamic>data}){
    name= data['name'] as String;
    imagePath= data['image'] as String;
    category= data['category'] as String;
    description = data['description'] as String;
    price = (data['price'] as num?)?.toDouble();
  }


}