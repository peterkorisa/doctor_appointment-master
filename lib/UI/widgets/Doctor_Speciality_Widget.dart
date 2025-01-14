import 'package:flutter/material.dart';
import 'package:doctor_appointment/core/Images.dart';

class DoctorSpecialityWidget extends StatelessWidget {
  DoctorSpecialityWidget({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> specialties = [
    {'name': 'General', 'image': images.Image1},
    {'name': 'Neurologic', 'image': images.Image2},
    {'name': 'Pediatric', 'image': images.Image3},
    {'name': 'Radiology', 'image': images.Image4},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isSmallScreen = maxWidth < 600;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor Speciality",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: maxWidth * 0.04),
            SizedBox(
              height: maxWidth * 0.35,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.04),
                itemCount: specialties.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: maxWidth * 0.04),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: maxWidth * 0.2,
                            height: maxWidth * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(maxWidth * 0.09),
                            ),
                            child: Center(
                              child: Image.asset(
                                specialties[index]['image'],
                                width: maxWidth * 0.14,
                                height: maxWidth * 0.14,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: maxWidth * 0.01),
                        Text(
                          specialties[index]['name'],
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

