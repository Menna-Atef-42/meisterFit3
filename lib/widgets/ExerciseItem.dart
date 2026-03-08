import 'package:flutter/material.dart';
import '../customs/custom_elevated_bottom.dart';
import '../utils/colors.dart';

class ExerciseItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const ExerciseItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedBottom(
      onPressed: onTap,
      hasIcon: true,
      backGroundColor: AppColors.gggrayColor,
      childIconWidget: Row(
        children: [
          Image.asset(imagePath, width: 50, height: 50),

          const SizedBox(width: 15),

          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColors.blackColor,
              ),
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.blackColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}