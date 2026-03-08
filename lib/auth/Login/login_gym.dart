import 'dart:convert' as convert;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';
import '../../customs/custom_elevated_bottom.dart';
import '../../customs/custom_formField.dart';
import '../../utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscurePassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/image 20.png',
                  height: screenHeight * 0.25,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 20),

                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: AppColors.phosphorescentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                CustomFormfield(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter User name';
                    }
                    return null;
                  },
                  borderSideColor: AppColors.blackColor,
                  hintText: 'User name',
                  suffixIcon:
                  Icon(Icons.person, color: AppColors.blackColor),
                ),

                const SizedBox(height: 20),

                CustomFormfield(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Email';
                    }

                    final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);

                    if (!emailValid) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                  borderSideColor: AppColors.blackColor,
                  hintText: 'Enter Email',
                  suffixIcon:
                  Icon(Icons.email, color: AppColors.blackColor),
                ),

                const SizedBox(height: 20),

                CustomFormfield(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  obscureText: obscurePassword,
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Password';
                    }

                    if (text.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                  borderSideColor: AppColors.blackColor,
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      color: AppColors.blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 25),

                Center(
                  child: CustomElevatedBottom(
                    onPressed: createAccount,
                    width: screenWidth * 0.58,
                    height: screenHeight * 0.065,
                    backGroundColor: AppColors.phosphorescentColor,
                    bottomText: 'Create an Account',
                    textColor: AppColors.blackColor,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.whiteColor,
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.whiteColor,
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Bootstrap.google,
                        size: 30,
                        color: AppColors.phosphorescentColor,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.08),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Bootstrap.facebook,
                        size: 30,
                        color: AppColors.phosphorescentColor,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.08),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Bootstrap.instagram,
                        size: 30,
                        color: AppColors.phosphorescentColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.popAndPushNamed(
                              context, AppRoutes.signIn2),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: AppColors.phosphorescentColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }

    final String url = "https://gp-backend-production-f405.up.railway.app/api/register";
    final uri = Uri.parse(url);

    try {
      var response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: convert.jsonEncode({
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text,
        }),
      ).timeout(const Duration(seconds: 15));

      var responseData = convert.jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Success',
          desc: responseData['message'] ?? 'Account created successfully!',
          btnOkOnPress: () {
            Navigator.pushNamed(context, AppRoutes.genderScreen);
          },
        ).show();

      }
      else {
        String errorMessage = 'Registration Failed';

        if (responseData['errors'] != null) {
          var errors = responseData['errors'];

          if (errors['email'] != null) {
            errorMessage = errors['email'][0].toString();
          } else {
            errorMessage = errors.values.first[0].toString();
          }
        } else {
          errorMessage = responseData['message'] ?? 'Check your data and try again';
        }

        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Oops!',
          desc: errorMessage,
          btnOkColor: Colors.red,
          btnOkOnPress: () {},
        ).show();
      }

    } catch (e) {
      print("Network Error: $e");

      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: 'Connection Error',
        desc: 'Please check your internet and try again later.',
        btnOkOnPress: () {},
      ).show();
    }
  }
}