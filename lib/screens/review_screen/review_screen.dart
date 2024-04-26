import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_marketplace/models/review_model/review.dart';
import 'package:grocery_marketplace/widgets/review_widgets/reply_form.dart';
import 'package:grocery_marketplace/widgets/review_widgets/review_card.dart';
import 'package:grocery_marketplace/widgets/review_widgets/review_form.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final String jsonData = '''
    [
      {
        "name": "Иван Петров",
        "rating": 4.0,
        "comment": "Отличный продукт, работает как надо.",
        "pros": "Высокое качество, удобный интерфейс",
        "cons": "Немного дороговат",
        "reply": null
      },
      {
        "name": "Анна Сидорова",
        "rating": 3.0,
        "comment": "В целом неплохо, но есть недочеты.",
        "pros": "Быстрая доставка",
        "cons": "Не хватает некоторых функций",
        "reply": null
      }
    ]
  ''';
  final _formKey = GlobalKey<FormState>();

  List<Review> _reviews = [];
  int _selectedReviewIndex = -1;

  String _newComment = '';
  String _newPros = '';
  String _newCons = '';
  double _newRating = 0;

  bool _isCommenting = false;

  @override
  void initState() {
    super.initState();
    final jsonDataDecoded = json.decode(jsonData) as List<dynamic>;
    _reviews =
        jsonDataDecoded.map((review) => Review.fromJson(review)).toList();
  }

  void _showReplyField(int index) {
    setState(() {
      _selectedReviewIndex = index;
    });
  }

  void _hideReplyField() {
    setState(() {
      _selectedReviewIndex = -1;
    });
  }

  void _submitReply(int index, String replyText) {
    setState(() {
      _reviews[index].addReply(replyText);
      _hideReplyField();
    });
  }

  void _submitReview() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _reviews.add(Review(
          name: 'Покупатель',
          rating: _newRating,
          comment: _newComment,
          pros: _newPros,
          cons: _newCons,
        ));
        _newComment = '';
        _newPros = '';
        _newCons = '';
        _newRating = 0;
      });
    }
    _isCommenting = false;
  }

  @override
  Widget build(BuildContext context) {
    double averageRating =
        _reviews.fold(0.0, (sum, review) => sum + review.rating) /
            _reviews.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Отзывы'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Средняя оценка: ${averageRating.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Количество отзывов: ${_reviews.length}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: _reviews.length,
              itemBuilder: (context, index) {
                var review = _reviews[index];
                return Column(
                  children: [
                    ReviewCard(
                      review: review,
                      onReply: () => _showReplyField(index),
                    ),
                    if (_selectedReviewIndex == index)
                      ReplyForm(
                        onSubmit: (replyText) => _submitReply(index, replyText),
                      ),
                  ],
                );
              },
            ),
          ),
          if (!_isCommenting)
            ElevatedButton(
              onPressed: () => setState(() => _isCommenting = true),
              child: Text('Оставить отзыв'),
            ),
          if (_isCommenting)
            ReviewForm(
              onSubmit: (review) => setState(() => _reviews.add(review)),
            ),
        ],
      ),
    );
  }
}
