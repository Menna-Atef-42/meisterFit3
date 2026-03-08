import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(backgroundColor: AppColors.phosphorescentColor, title: const Text('History Screen')),
      body: const Center(child: Text('History Screen', style: TextStyle(color: Colors.white, fontSize: 24))),
    );
  }
}
