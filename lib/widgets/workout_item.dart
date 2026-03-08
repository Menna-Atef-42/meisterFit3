import 'package:flutter/material.dart';

class WorkoutItem extends StatelessWidget {
  final Map<String, dynamic> workout;

  const WorkoutItem({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              workout["image"],
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          Center(
            child: Text(
              workout["title"],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}