import 'package:flutter/material.dart';

class ErrorContent extends StatelessWidget {
  final VoidCallback? onPressed;
  const ErrorContent({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Oops, something went wrong ..'),
          TextButton.icon(
              onPressed: onPressed,
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh')),
        ],
      ),
    );
  }
}
