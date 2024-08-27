// grocery entity
import 'package:equatable/equatable.dart';

class Grocery extends Equatable{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final double discount;

  const Grocery({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating, 
    required this.discount
  });

  @override
  List<Object?> get props => [title, description, price, imageUrl, id, rating];

  factory Grocery.fromJson(Map<String, dynamic> json) {
    return Grocery(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      discount: json['discount']
    );
  }

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
}