import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Spiritual Circuit Card Widget
/// Promotional card for spiritual circuit tour
class SpiritualCircuitCard extends StatelessWidget {
  const SpiritualCircuitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF9933),
            Color(0xFFF97316),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Left Side Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Spiritual Circuit',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFFFFFF),
                  height: 28 / 18,
                ),
              ),
              Text(
                'Trimbakeshwar + Pandavleni',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFFFFFFFF),
                  height: 20 / 14,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Starting from',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFFFFFFFF),
                  height: 16 / 12,
                ),
              ),
              SizedBox(height: 2.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '₹899',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFFFFF),
                        height: 28 / 20,
                      ),
                    ),
                    TextSpan(
                      text: ' /person',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Top Right Duration Box
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 60.31.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF).withOpacity(0.2),
                borderRadius: BorderRadius.circular(9999.r),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  '6-8 hrs',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
          // Bottom Right Book Tour Button
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 98.69.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Book tour',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF8B2635),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

