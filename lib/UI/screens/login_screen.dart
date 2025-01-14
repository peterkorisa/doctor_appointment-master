import 'package:doctor_appointment/UI/screens/home.dart';
import 'package:doctor_appointment/core/colorsManager.dart';
import 'package:doctor_appointment/logic/Login_cubit/State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/Login_cubit/Cubit.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            // Navigate to home screen or show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login successful!')),
            );
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 94),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: ColorsManager.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Text(
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color.fromRGBO(237, 237, 237, 1)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Color.fromRGBO(237, 237, 237, 1)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        icon: Icon(
                          isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                          color: ColorsManager.greyColor,
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(color: ColorsManager.greyColor),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          // Add forgot password logic here
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: ColorsManager.primaryColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: state is LoginLoadingState
                            ? null
                            : () {
                          context.read<LoginCubit>().login(
                            emailController.text,
                            passwordController.text,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: state is LoginLoadingState
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

