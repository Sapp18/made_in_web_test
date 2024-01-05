import 'package:flutter/material.dart';

import '../../app/app.dart';

class ShowDialog extends StatelessWidget {
  final String title;
  final String content;
  final void Function()? onPressed;
  const ShowDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: Text(content),
      actions: [
        FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.redAccent,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancelar',
            style: AppStyle.w400(14, Colors.white),
          ),
        ),
        FilledButton(
          onPressed: onPressed,
          child: Text(
            'Aceptar',
            style: AppStyle.w400(
              14,
              Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
