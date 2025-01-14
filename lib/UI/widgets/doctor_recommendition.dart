import 'package:flutter/material.dart';

class DoctorRecom extends StatelessWidget {
  const DoctorRecom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 24),
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
            SizedBox(
              height: 320, // Fixed height for the ListView
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 16 : 24,
                      vertical: 8,
                    ),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: isSmallScreen ? 80 : 100,
                              height: isSmallScreen ? 80 : 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/Image.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 12 : 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Randy Wigham",
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 16 : 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "General | RSUD Gatot Subroto",
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 12 : 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow, size: isSmallScreen ? 16 : 20),
                                      SizedBox(width: 4),
                                      Text(
                                        "4.8",
                                        style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

