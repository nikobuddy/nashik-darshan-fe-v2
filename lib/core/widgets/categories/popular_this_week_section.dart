import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'popular_card.dart';

/// Popular This Week Section Widget
/// Displays a list of popular places for the week
class PopularThisWeekSection extends StatelessWidget {
  const PopularThisWeekSection({super.key});

  @override
  Widget build(BuildContext context) {
    final popularItems = [
      {
        'title': 'Art Museums',
        'rating': '4.3',
        'distance': '2.1 km • 1-2 hrs',
        'locations': '24 locations',
        'image': 'assets/images/home-hero.png',
      },
      {
        'title': 'National Parks',
        'rating': '4.6',
        'distance': '8.5 km • 3-4 hrs',
        'locations': '18 locations',
        'image': 'assets/images/home-hero.png',
      },
      {
        'title': 'Local Markets',
        'rating': '4.1',
        'distance': '1.2 km • 1-2 hrs',
        'locations': '12 locations',
        'image': 'assets/images/home-hero.png',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular this week',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF111827),
                height: 28 / 18,
              ),
            ),
            Text(
              'View all',
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFF97316),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // Popular Items List
        ...popularItems.map((item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: PopularCard(
              title: item['title'] as String,
              rating: item['rating'] as String,
              distance: item['distance'] as String,
              locations: item['locations'] as String,
              imagePath: item['image'] as String,
            ),
          );
        }).toList(),
      ],
    );
  }
}

