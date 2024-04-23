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

  List<dynamic> _reviews = [];
  int _selectedReviewIndex = -1;
  String _replyText = '';

  String _newComment = '';
  String _newPros = '';
  String _newCons = '';
  double _newRating = 0;

  bool _isCommenting = false;

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

  void _submitReview() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _reviews.add({
          'name': 'Покупатель',
          'rating': _newRating,
          'comment': _newComment,
          'pros': _newPros,
          'cons': _newCons,
          'reply': null,
        });
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
        _reviews.fold(0.0, (sum, review) => sum + review['rating']) /
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.green),
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
          if (!_isCommenting)
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isCommenting = true;
                  });
                },
                child: Text('Оставить отзыв')),
          if (_isCommenting)
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Оставить отзыв',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _isCommenting = false;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _newComment = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите отзыв';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Введите ваш комментарий',
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _newPros = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите отзыв';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Введите достоинства',
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _newCons = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите отзыв';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Введите недостатки',
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Оценка: '),
                        Expanded(
                          child: Slider(
                            value: _newRating,
                            min: 0,
                            max: 5,
                            divisions: 5,
                            onChanged: (value) {
                              setState(() {
                                _newRating = value;
                              });
                            },
                          ),
                        ),
                        Text(_newRating.toStringAsFixed(1)),
                      ],
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _submitReview,
                      child: Text('Оставить отзыв'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
