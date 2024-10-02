import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/widgets/popular_item.dart';
import 'package:travel_app/widgets/recommended_item.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Text(
                          'Bandung',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          color: Color(0xFF176FF2),
                          size: 25,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Bandung, INA',
                          style: GoogleFonts.robotoCondensed(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF606060)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F8FE),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Find places to discover",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFF176FF2),
                labelColor: Color(0xFF176FF2),
                unselectedLabelColor: Color(0xFFB8B8B8),
                labelStyle: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                unselectedLabelStyle: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                tabs: [
                  Tab(text: "Hotels"),
                  Tab(text: "Location"),
                  Tab(text: "Foods"),
                  Tab(text: "Adventure"),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    buildTabContent("Hotels"),
                    buildTabContent("Location"),
                    buildTabContent("Foods"),
                    buildTabContent("Adventure"),
                  ],
                ),
              )
            ],
          ),
          // Floating Bottom Navigation Bar
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildNavBarItem(Icons.home_filled, 0),
                      buildNavBarItem(Icons.search, 1),
                      buildNavBarItem(Icons.favorite, 2),
                      buildNavBarItem(Icons.person, 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: _selectedIndex == index
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF176FF2).withOpacity(0.1),
              )
            : null,
        child: Icon(
          icon,
          size: 30,
          color: _selectedIndex == index ? Color(0xFF176FF2) : Colors.black38,
        ),
      ),
    );
  }

  Widget buildTabContent(String tab) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF232323),
                  ),
                ),
                Text(
                  "See All",
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xFF176FF2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PopularItem(
                      title: "Padma Hotel",
                      rating: "5.0",
                      image: "assets/images/padma_exp.jpg"),
                  SizedBox(width: 16),
                  PopularItem(
                      title: "GH Universal",
                      rating: "4.9",
                      image: "assets/images/gh_universal.jpg"),
                  SizedBox(width: 16),
                  PopularItem(
                      title: "Intercontinental",
                      rating: "4.8",
                      image: "assets/images/intercontinental.jpg"),
                ],
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF232323),
                  ),
                ),
                Text(
                  "See All",
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xFF176FF2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RecommendedCard(
                      title: "Explore Bandung",
                      duration: "Flexible",
                      deal: "New Deal",
                      image: "assets/images/dago.jpg"),
                  SizedBox(width: 16),
                  RecommendedCard(
                      title: "Luxurious Bandung",
                      duration: "2N/3D",
                      deal: "Hot Deal",
                      image: "assets/images/gh_universal.jpg"),
                  SizedBox(width: 16),
                  RecommendedCard(
                      title: "Luxurious Bandung",
                      duration: "2N/3D",
                      deal: "Hot Deal",
                      image: "assets/images/padma.jpg"),
                ],
              ),
            ),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
