import 'package:doctor_appointment/core/colorsManager.dart';
import 'package:doctor_appointment/data/UserData_model.dart';
import 'package:doctor_appointment/logic/SignupCubit/Cubit.dart';
import 'package:doctor_appointment/logic/SignupCubit/State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmationPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    genderController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
    super.dispose();
  }

  bool validateInputs() {
    if (nameController.text.isEmpty ||
        genderController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All fields are required'),
          backgroundColor: Colors.orange,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: BlocConsumer<SignUpCubit, SignUpStates>(
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Signup successful! Token: ${state.token}'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is SignUpErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 94),
                    Text(
                      "Signup",
                      style: TextStyle(
                        color: ColorsManager.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30),

                    // Name Field
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Gender Field
                    TextFormField(
                      controller: genderController,
                      decoration: InputDecoration(
                        hintText: 'Gender',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Phone Number Field
                    TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Email Field
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Password Field
                    TextFormField(
                      controller: passwordController,

                      decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: confirmationPasswordController,

                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Signup Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: state is SignUpLoadingState
                            ? null
                            : () {
                          if (validateInputs()) {
                            final user = UserModel(
                                name: nameController.text,
                                gender: genderController.text,
                                phone: phoneNumberController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmationPassword: confirmationPasswordController.text
                            );
                            context.read<SignUpCubit>().Signup(user);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: state is SignUpLoadingState
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                          "Signup",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}