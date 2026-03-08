import 'package:flutter/material.dart';
import 'package:fluttercourse/customs/custom_elevated_bottom.dart';
import 'package:fluttercourse/screens/Instructions/biceps_curl.dart';
import 'package:fluttercourse/screens/Instructions/dumbbell_side.dart';
import 'package:fluttercourse/screens/Instructions/hammer_curl.dart';
import 'package:fluttercourse/screens/Instructions/push_up.dart';
import 'package:fluttercourse/screens/Instructions/shoulder_press.dart';
import 'package:fluttercourse/screens/levelSelectionSheet.dart';
import 'package:fluttercourse/utils/colors.dart';
import 'package:fluttercourse/widgets/ExerciseItem.dart';

class Ironicon extends StatelessWidget {
  const Ironicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/Exercises_List.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        '40 ',
                        style: TextStyle(
                          color: AppColors.phosphorescentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Minutes',
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                      ),

                      const SizedBox(width: 25),

                      Text(
                        '5 ',
                        style: TextStyle(
                          color: AppColors.phosphorescentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Exercises',
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 45,),

                  ExerciseItem(
                      title: 'PUSH UP',
                      imagePath: 'assets/images/111.png',
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => PushUp()));

                      }),
                  SizedBox(height: 20,),
                  ExerciseItem(
                      title: 'SHOULDER PRESS',
                      imagePath: 'assets/images/222.png',
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ShoulderPress()));

                      }),
                  SizedBox(height: 20,),
                  ExerciseItem(
                      title: 'DUMBBELL SIDE LATERAL RAISE',
                      imagePath: 'assets/images/333.png',
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DumbbellSide()));

                      }),
                  SizedBox(height: 20,),
                  ExerciseItem(
                      title: 'HAMMER CURL',
                      imagePath: 'assets/images/444.png',
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => HammerCurl()));

                      }),
                  SizedBox(height: 20,),
                  ExerciseItem(
                      title: 'BICEPS CURLS',
                      imagePath: 'assets/images/555.png',
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BicepsCurl()));

                      }),

                  // SizedBox(height: 30,),

                  // Center(
                  //   child: SizedBox(
                  //     width: 150,
                  //     height: 33,
                  //     child: CustomElevatedBottom(
                  //       onPressed: () {
                  //
                  //       },
                  //       bottomText: 'Start',
                  //       textColor: AppColors.blackColor,
                  //       backGroundColor: AppColors.phosphorescentColor,
                  //
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 20,),

                ]),

          ),
        ),
      ),
    );
  }
}