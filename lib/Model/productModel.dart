class ProductModel {
  String? name;
  String? imagePath;
  String?  category;
  String?  description;
  double? price;

  ProductModel.fromJson({required Map<String , dynamic>data}){
    name= data['name'];
    imagePath= data['image'];
    category= data['category'];
    description = data['description'];
    price = data['price'];
  }


}