import 'package:flutter/material.dart';
import 'dart:convert';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final String jsonData = '''
    [
      {
        "name": "Иван Петров",
        "rating": 4.5,
        "comment": "Отличный продукт, работает как надо.",
        "pros": "Высокое качество, удобный интерфейс",
        "cons": "Немного дороговат",
        "reply": null
      },
      {
        "name": "Анна Сидорова",
        "rating": 3.8,
        "comment": "В целом неплохо, но есть недочеты.",
        "pros": "Быстрая доставка",
        "cons": "Не хватает некоторых функций",
        "reply": null
      }
    ]
  ''';

  List<dynamic> _reviews = [];
  int _selectedReviewIndex = -1;
  String _replyText = '';

  @override
  void initState() {
    super.initState();
    _reviews = json.decode(jsonData);
  }

  void _showReplyField(int index) {
    setState(() {
      _selectedReviewIndex = index;
      _replyText = '';
    });
  }

  void _hideReplyField() {
    setState(() {
      _selectedReviewIndex = -1;
      _replyText = '';
    });
  }

  void _submitReply() {
    setState(() {
      _reviews[_selectedReviewIndex]['reply'] = _replyText;
      _hideReplyField();
    });
  }

  @override
  Widget build(BuildContext context) {
    double averageRating = _reviews.fold(0.0, (sum, review) => sum + review['rating']) / _reviews.length;

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
            child: ListView.builder(
              itemCount: _reviews.length,
              itemBuilder: (context, index) {
                var review = _reviews[index];
                return Column(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review['name'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                SizedBox(width: 4),
                                Text(
                                  review['rating'].toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              review['comment'],
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Достоинства: ${review['pros']}',
                              style: TextStyle(fontSize: 14, color: Colors.green),
                            ),
                            Text(
                              'Недостатки: ${review['cons']}',
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                            SizedBox(height: 8),
                            if (review['reply'] != null)
                              Container(
                                padding: EdgeInsets.all(8),
                                color: Colors.grey[200],
                                child: Text(
                                  'Ответ продавца: ${review['reply']}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                _showReplyField(index);
                              },
                              child: Text('Ответить на комментарий'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_selectedReviewIndex == index)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _replyText = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Введите ваш ответ',
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: _submitReply,
                              child: Text('Отправить'),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}