import 'package:flutter/material.dart';
import 'package:grocery_marketplace/models/review_model/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  final VoidCallback onReply;

  const ReviewCard({
    Key? key,
    required this.review,
    required this.onReply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  review.rating.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              review.comment,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Достоинства: ${review.pros}',
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
            Text(
              'Недостатки: ${review.cons}',
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
            SizedBox(height: 8),
            if (review.reply != null)
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.grey[200],
                child: Text(
                  'Ответ продавца: ${review.reply}',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: onReply,
              child: Text('Ответить на комментарий'),
            ),
          ],
        ),
      ),
    );
  }
}
