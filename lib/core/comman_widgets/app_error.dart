import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppErrorWidget
    extends StatelessWidget {
  final String message;

  const AppErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return Center(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment
            .center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 50,
          ),
          Text(message),
        ],
      ),
    );
  }
}