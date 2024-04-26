import 'package:flutter/material.dart';
import 'package:grocery_marketplace/models/review_model/review.dart';

class ReviewForm extends StatefulWidget {
  final Function(Review) onSubmit;

  const ReviewForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  String _newComment = '';
  String _newPros = '';
  String _newCons = '';
  double _newRating = 0;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(Review(
        name: 'Покупатель',
        rating: _newRating,
        comment: _newComment,
        pros: _newPros,
        cons: _newCons,
      ));
      // Очистка формы
      _formKey.currentState!.reset();
      _newComment = '';
      _newPros = '';
      _newCons = '';
      _newRating = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Оставить отзыв',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    // Закрытие формы (логика должна быть реализована в _ReviewScreenState)
                  },
                )
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: (value) => setState(() => _newComment = value),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Введите отзыв' : null,
              decoration:
                  const InputDecoration(hintText: 'Введите ваш комментарий'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: (value) => setState(() => _newPros = value),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Введите отзыв' : null,
              decoration:
                  const InputDecoration(hintText: 'Введите достоинства'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              onChanged: (value) => setState(() => _newCons = value),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Введите отзыв' : null,
              decoration: const InputDecoration(hintText: 'Введите недостатки'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Оценка: '),
                Expanded(
                  child: Slider(
                    value: _newRating,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (value) => setState(() => _newRating = value),
                  ),
                ),
                Text(_newRating.toStringAsFixed(1)),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Оставить отзыв'),
            ),
          ],
        ),
      ),
    );
  }
}
