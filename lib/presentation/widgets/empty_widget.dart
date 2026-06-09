import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "You haven't saved any words yet.",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}