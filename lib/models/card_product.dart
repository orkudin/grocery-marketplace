class CardProduct {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final String category;

  CardProduct({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
  });

  // Фабричный конструктор для создания объекта из JSON-данных
  factory CardProduct.fromJson(Map<String, dynamic> json) {
    return CardProduct(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      images: List<String>.from(json['images']),
      category: json['category'],
    );
  }

  // Метод для преобразования объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'images': images,
      'category': category,
    };
  }
}
