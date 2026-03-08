import 'package:flutter/material.dart';
import 'package:fluttercourse/screens/dashboard/ironIcon.dart';
import 'package:fluttercourse/utils/colors.dart';
import 'package:fluttercourse/widgets/workout_item.dart';
import 'package:fluttercourse/screens/dashboard/placeholder_screen.dart';

class Homeicon extends StatelessWidget {
  const Homeicon({super.key});

  static const List<Map<String, dynamic>> workouts = [
    {"image": "assets/images/11.png", "title": "Upper Body"},
    {"image": "assets/images/22.png", "title": "Lower Body"},
    {"image": "assets/images/343.png", "title": "Physical Therapy"},
    {"image": "assets/images/44.png", "title": "Yoga"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: AppColors.phosphorescentColor,
                          ),
                        ),
                        Text(
                          'John',
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 1,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/gamer.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: AppColors.gBColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your progress',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: AppColors.phosphorescentColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '70/100 tasks completed this month',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: CircularProgressIndicator(
                                value: 0.7,
                                strokeWidth: 15,
                                backgroundColor: AppColors.transparentColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.phosphorescentColor,
                                ),
                              ),
                            ),
                            Text(
                              '70%',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.phosphorescentColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.phosphorescentColor,

                    ),
                    child: Text(
                      'Your Workout Plan',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: workouts.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final workout = workouts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Ironicon(),
                          ),
                        );
                      },
                      child: WorkoutItem(workout: workout),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
