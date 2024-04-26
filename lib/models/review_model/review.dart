class Review {
  final String name;
  final double rating;
  final String comment;
  final String pros;
  final String cons;
  String? reply;

  Review({
    required this.name,
    required this.rating,
    required this.comment,
    required this.pros,
    required this.cons,
    this.reply,
  });

  // Фабричный конструктор для создания объекта Review из JSON
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['name'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      pros: json['pros'],
      cons: json['cons'],
      reply: json['reply'],
    );
  }

  // Метод для преобразования объекта Review в JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rating': rating,
      'comment': comment,
      'pros': pros,
      'cons': cons,
      'reply': reply,
    };
  }

  // Метод для добавления ответа на отзыв 
  void addReply(String replyText) {
    reply = replyText;
  }
}