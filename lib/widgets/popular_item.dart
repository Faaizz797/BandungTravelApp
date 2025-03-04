import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/place_screen.dart';

class PopularItem extends StatelessWidget {
  final String title;
  final String rating;
  final String image;

  const PopularItem(
      {super.key,
      required this.title,
      required this.rating,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceScreen()));
      },
      child: Container(
        width: 190,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            // opacity: 0.9,
            image: AssetImage(image),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(190, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        title,
                        style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(190, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            SvgPicture.asset(
                              "assets/vectors/star_1_x2.svg",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              rating,
                              style: GoogleFonts.robotoCondensed(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                          ],
                      )
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite, 
                    color: Colors.redAccent
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
