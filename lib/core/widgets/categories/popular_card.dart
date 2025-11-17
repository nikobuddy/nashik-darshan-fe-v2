import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Popular Card Widget
/// Displays a popular place with image, rating, distance, and location count
class PopularCard extends StatelessWidget {
  final String title;
  final String rating;
  final String distance;
  final String locations;
  final String imagePath;

  const PopularCard({
    super.key,
    required this.title,
    required this.rating,
    required this.distance,
    required this.locations,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: const Color(0xFFF3F4F6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.asset(
              imagePath,
              width: 48.w,
              height: 48.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF111827),
                    height: 24 / 16,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14.sp,
                      color: const Color(0xFFFFA201),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      rating,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF4B5563),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        distance,
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  locations,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          // Right Arrow Icon
          Icon(
            Icons.chevron_right,
            color: const Color(0xFF9CA3AF),
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}

