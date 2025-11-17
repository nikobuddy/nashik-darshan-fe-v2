import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Upcoming Event Box Widget
/// Displays upcoming event information with gradient icon
class UpcomingEventBox extends StatelessWidget {
  const UpcomingEventBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFC5C5C5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon and "Upcoming Event" text
          Row(
            children: [
              Icon(
                Icons.wine_bar,
                color: const Color(0xFF9333EA),
                size: 20.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'Upcoming Event',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9333EA),
                  height: 16 / 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // Content Row (Left: Title & Subtitle, Right: Icon Box)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Side: Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sula-fest',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                        height: 20 / 14,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Experience premium wines & local culture',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF4B5563),
                        height: 16 / 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              // Right Side: Icon Box with Gradient
              Container(
                width: 64.w,
                height: 64.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFC084FC),
                      Color(0xFFF472B6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.wine_bar,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // Book Now Button
          Container(
            width: 82.86.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: const Color(0xFF9333EA),
              borderRadius: BorderRadius.circular(9999.r),
            ),
            child: Center(
              child: Text(
                'Book Now',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

