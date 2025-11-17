import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nashik/core/widgets/categories/categories_grid.dart';
import 'package:nashik/core/widgets/categories/popular_this_week_section.dart';
import 'package:nashik/core/widgets/categories/spiritual_circuit_card.dart';
import 'package:nashik/core/widgets/categories/upcoming_event_box.dart';

/// Categories Screen
/// Displays all categories and upcoming events
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Categories',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upcoming Event Box
              const UpcomingEventBox(),
              SizedBox(height: 24.h),
              // Categories Grid
              const CategoriesGrid(),
              SizedBox(height: 24.h),
              // Popular This Week Section
              const PopularThisWeekSection(),
              SizedBox(height: 24.h),
              // Spiritual Circuit Card
              const SpiritualCircuitCard(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
