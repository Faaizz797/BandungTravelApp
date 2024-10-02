import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/explore_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 95, 30, 50),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/kawah.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.6
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("BANDUNG",
                style: GoogleFonts.getFont('Bebas Neue',
                fontWeight: FontWeight.bold,
                fontSize: 100,
                color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(style: GoogleFonts.getFont("Montserrat",
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                            text: "Plan Your",
                            style: GoogleFonts.getFont(
                              "Montserrat",
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1.3
                            ),
                          ),
                        TextSpan(text: " "),
                        TextSpan(
                            text: "Luxurious Vacation",
                            style: GoogleFonts.getFont("Montserrat",
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.3),
                          ),
                      ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExploreScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF176FF2),
                    ),
                    child: Center(
                        child: Text(
                      "Explore Now",
                      style: GoogleFonts.getFont(
                        "Roboto",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}