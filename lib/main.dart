import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doctor_appointment/UI/screens/login_screen.dart';
import 'package:doctor_appointment/logic/Get_userData/Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit()..fetchUserDataFromAPI(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Remove the debug banner
        home: AnimatedSplashScreen(
          splash: Image.asset(
            "assets/SplashScreen.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          nextScreen: LoginScreen(),
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.fade,
        ),
      ),
    );
  }
}
