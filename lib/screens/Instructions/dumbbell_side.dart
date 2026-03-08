import 'package:flutter/material.dart';
import '../../customs/custom_elevated_bottom.dart';
import '../../utils/colors.dart';
import '../levelSelectionSheet.dart';

class DumbbellSide extends StatefulWidget {
  const DumbbellSide({super.key});

  @override
  State<DumbbellSide> createState() => _DumbbellSideState();
}

class _DumbbellSideState extends State<DumbbellSide> {
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
          'DUMBBELL SIDE LATERAL RAISE',
          style: TextStyle(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/33333.png',
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
              child: Container(
                color: Colors.black.withOpacity(0.4),
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