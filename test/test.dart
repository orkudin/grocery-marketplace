import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_marketplace/models/review_model/review.dart';

void main() {
  group('Review tests', () {
    test('Creating a Review object', () {
      final review = Review(
        name: 'Test User',
        rating: 4.5,
        comment: 'This is a test comment.',
        pros: 'Good quality',
        cons: 'A bit expensive',
      );

      expect(review.name, 'Test User');
      expect(review.rating, 4.5);
      expect(review.comment, 'This is a test comment.');
      expect(review.pros, 'Good quality');
      expect(review.cons, 'A bit expensive');
      expect(review.reply, null);
    });

    test('Adding a reply to a Review', () {
      final review = Review(
        name: 'Test User',
        rating: 4.5,
        comment: 'This is a test comment.',
        pros: 'Good quality',
        cons: 'A bit expensive',
      );

      review.addReply('Thank you for your feedback!');

      expect(review.reply, 'Thank you for your feedback!');
    });

    test('Converting a Review to JSON and back', () {
      final review = Review(
        name: 'Test User',
        rating: 4.5,
        comment: 'This is a test comment.',
        pros: 'Good quality',
        cons: 'A bit expensive',
      );

      final json = review.toJson();
      final reviewFromJson = Review.fromJson(json);

      expect(reviewFromJson.name, review.name);
      expect(reviewFromJson.rating, review.rating);
      expect(reviewFromJson.comment, review.comment);
      expect(reviewFromJson.pros, review.pros);
      expect(reviewFromJson.cons, review.cons);
      expect(reviewFromJson.reply, review.reply);
    });
  });
}