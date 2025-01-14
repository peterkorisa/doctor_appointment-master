import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_appointment/logic/Get_userData/Cubit.dart'; // Ensure this is the correct import
import 'package:doctor_appointment/logic/Get_userData/State.dart'; // Ensure this is the correct import
import '../widgets/Doctor_Speciality_Widget.dart';
import '../widgets/doctor_recommendition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => UserCubit()..fetchUserData(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.05,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<UserCubit, UserCubitState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state is UserLoaded
                                      ? "Hi, ${state.data.name}!"
                                      : "Hi...",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  state is UserError
                                      ? state.error
                                      : "How are you today?",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none,
                          size: screenWidth * 0.08,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.07,
                            vertical: screenHeight * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.6,
                                child: Text(
                                  "Book and schedule with nearest doctor",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Find Nearby",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: -screenWidth * 0.017,
                        top: -screenHeight * 0.048,
                        child: Image.asset(
                          "assets/2.png",
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.244,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: DoctorSpecialityWidget(),
                ),
                SizedBox(height: screenHeight * 0.02),
                DoctorRecom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
