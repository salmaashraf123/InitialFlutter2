class ProductModel {
  String name;
  String imagePath;
  String description;
  double price;

  ProductModel({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}
List<ProductModel>SalesProd = [
   ProductModel(
     name: "HAIRTONIC",
     imagePath: "./images/HAIRTONIC.jpg",
     description: "HAIRTONIC is used to promote hair growth and prevent hair loss.",
     price: 52.0,
   ),
  ProductModel(
    name: "Gohnsons Baby Oil",
    imagePath: "./images/Baby Oil.jpg",
    description: "Gohnsons Baby Oil is used to moisturize and protect a baby's skin.",
    price: 145.0,
  ),
  
];