
import 'package:doctor_appointment/UI/screens/signup.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 38,
            width: 131,
            child: Image.asset("assets/doctorLogo.png",
            ),
          ),
          Stack(
            children: [
              Center(child: Image.asset("assets/Group.png")),
              Image.asset("assets/doctor.png"),

            ],
          ),
             Center(
               child: Text(
                 textAlign: TextAlign.center,
                 "Best Doctor       Appointment App",
                style: TextStyle(
                    color: Color.fromRGBO(36, 124, 255, 1),
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
                           ),
             ),
          SizedBox(height: 7,),
          Text("Manage and schedule all of your medical appointments easily                                        with Docdoc to get a new experience.",
          textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 35,),
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> SignupScreen()
              ),
              );
            },
            child: Container(
              height: 52,
              width: 311,
              decoration: BoxDecoration(
                color: Color.fromRGBO(36, 124, 255, 1),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Center(
                child: Text("Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
