import 'package:assessment/features/grocery/domain/entity/grocery.dart';

class GroceryModel extends Grocery{
  GroceryModel({
    required String id,
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required double rating,
    required double discount,
  }) : super(
    id: id,
    title: title,
    description: description,
    price: price,
    imageUrl: imageUrl,
    rating: rating,
    discount: discount,
  );

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      discount: json['discount'].toDouble()
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'discount': discount
    };
  }

  Grocery toEntity() {
    return Grocery(
      id: id,
      title: title,
      description: description,
      price: price,
      imageUrl: imageUrl,
      rating: rating,
      discount: discount,
    );
  }

  // implementing fromEntity
  factory GroceryModel.fromEntity(Grocery grocery) {
    return GroceryModel(
      id: grocery.id,
      title: grocery.title,
      description: grocery.description,
      price: grocery.price,
      imageUrl: grocery.imageUrl, 
      rating: grocery.rating,
      discount: grocery.discount
    );
  }
}