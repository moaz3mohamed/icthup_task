class ProdutApiModel {
  int id;
  String title;
  num price;
  String description;
  String image;

  ProdutApiModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory ProdutApiModel.fromJson(Map<String, dynamic> json) {
    return ProdutApiModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
    );
  }
}
