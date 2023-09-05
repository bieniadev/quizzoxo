import 'package:flutter/material.dart';

class ErrorMess extends StatelessWidget {
  const ErrorMess({super.key, this.message = 'Error'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
