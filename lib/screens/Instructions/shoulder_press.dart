import 'package:flutter/material.dart';
import '../../customs/custom_elevated_bottom.dart';
import '../../utils/colors.dart';
import '../levelSelectionSheet.dart';

class ShoulderPress extends StatefulWidget {
  const ShoulderPress({super.key});

  @override
  State<ShoulderPress> createState() => _ShoulderPressState();
}

class _ShoulderPressState extends State<ShoulderPress> {
  bool _isSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        title: const Text(
          'SHOULDER PRESS',
          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/22222.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 33,
                    child: CustomElevatedBottom(
                      onPressed: () {
                        setState(() {
                          _isSheetVisible = true;
                        });
                      },
                      bottomText: 'GO',
                      textColor: AppColors.blackColor,
                      backGroundColor: AppColors.phosphorescentColor,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),

          if (_isSheetVisible)
            GestureDetector(
              onTap: () => setState(() => _isSheetVisible = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.black.withOpacity(0.5),
              ),
            ),

          LevelSelectionSheet(
            isVisible: _isSheetVisible,
            onClose: () {
              setState(() {
                _isSheetVisible = false;
              });
            },
          ),
        ],
      ),
    );
  }
}