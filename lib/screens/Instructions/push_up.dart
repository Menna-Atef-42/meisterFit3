import 'package:flutter/material.dart';
import '../../customs/custom_elevated_bottom.dart';
import '../../utils/colors.dart';
import '../levelSelectionSheet.dart';
// تأكدي من استيراد الكلاس الخاص بكِ
// import 'path_to_your_file/level_selection_sheet.dart';

class PushUp extends StatefulWidget {
  const PushUp({super.key});

  @override
  State<PushUp> createState() => _PushUpState();
}

class _PushUpState extends State<PushUp> {
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
          'PUSH UP',
          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/11111.png',
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    height: 38,
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
                  const SizedBox(height: 20),
                ],
              ),
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