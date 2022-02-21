import 'package:flutter/material.dart';
import '../../model/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onRefresh})
      : super(key: key);
  final List<PostModel> list;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: const [
                Text(
                  'No, we need bold strokes. We need this plan.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
