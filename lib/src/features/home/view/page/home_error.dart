import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, required this.error, required this.onRefresh})
      : super(key: key);
  final String error;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onRefresh,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
