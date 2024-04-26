import 'package:flutter/material.dart';

class ReplyForm extends StatefulWidget {
  final Function(String) onSubmit;

  const ReplyForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ReplyForm> createState() => _ReplyFormState();
}

class _ReplyFormState extends State<ReplyForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Введите ваш ответ',
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(_controller.text);
              _controller.clear();
            },
            child: Text('Отправить'),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
