import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Aarti Screen
/// Displays aarti and darshan timings for temples
class AartiScreen extends StatefulWidget {
  const AartiScreen({super.key});

  @override
  State<AartiScreen> createState() => _AartiScreenState();
}

class _AartiScreenState extends State<AartiScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          'Aarti & Darshan Timings',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
            height: 24 / 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            // Horizontally scrolling cards
            SizedBox(
              height: 385.h,
              child: PageView(
                controller: _pageController,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _buildTempleCard(
                      templeName: 'Trimbakeshwar Temple',
                      timings: [
                        {
                          'title': 'Morning Aarti',
                          'time': '5:30 AM',
                          'schedule': 'Daily',
                          'icon': Icons.wb_sunny_outlined,
                        },
                        {
                          'title': 'Abhishek Pooja',
                          'time': '6:00 AM',
                          'schedule': 'Special slots',
                          'icon': Icons.water_drop_outlined,
                        },
                        {
                          'title': 'Evening Aarti',
                          'time': '7:00 PM',
                          'schedule': 'Daily',
                          'icon': Icons.nightlight_outlined,
                        },
                        {
                          'title': 'Temple Closing',
                          'time': '9:00 PM',
                          'schedule': 'Daily',
                          'icon': Icons.access_time,
                        },
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _buildTempleCard(
                      templeName: 'Kalaram Temple',
                      timings: [
                        {
                          'title': 'Morning Aarti',
                          'time': '6:00 AM',
                          'schedule': 'Daily',
                          'icon': Icons.wb_sunny_outlined,
                        },
                        {
                          'title': 'Afternoon Pooja',
                          'time': '12:00 PM',
                          'schedule': 'Daily',
                          'icon': Icons.sunny,
                        },
                        {
                          'title': 'Evening Aarti',
                          'time': '7:30 PM',
                          'schedule': 'Daily',
                          'icon': Icons.nightlight_outlined,
                        },
                        {
                          'title': 'Temple Closing',
                          'time': '9:30 PM',
                          'schedule': 'Daily',
                          'icon': Icons.access_time,
                        },
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            // Dot indicators
            _buildDotIndicators(),
            SizedBox(height: 25.h),
            // Important Tips Section
            _buildImportantTipsSection(),
            SizedBox(height: 25.h),
            // Plan My Trip Section
            _buildPlanMyTripSection(),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2, // Number of temple cards
        (index) => Container(
          width: _currentPage == index ? 24.w : 8.w,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color(0xFFFF9933)
                : const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(9999.r),
          ),
        ),
      ),
    );
  }

  Widget _buildImportantTipsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Important Tips',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF003366),
              height: 28 / 20,
            ),
          ),
          SizedBox(height: 16.h),
          // 2x2 Grid
          Row(
            children: [
              Expanded(
                child: _buildTipCard(
                  icon: Icons.checkroom_outlined,
                  title: 'Dress Code',
                  subtitle: 'Traditional attire\npreferred',
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildTipCard(
                  icon: Icons.wb_sunny_outlined,
                  title: 'Best Time',
                  subtitle: 'Oct - Mar',
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _buildTipCard(
                  icon: Icons.event_available_outlined,
                  title: 'Book Advance',
                  subtitle: 'Pooja reservations',
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildTipCard(
                  icon: Icons.no_photography_outlined,
                  title: 'No Photos',
                  subtitle: 'Inside Temple',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanMyTripSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 358.w,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF954D), Color(0xFFFFB147)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Map Icon
            Icon(
              Icons.map_outlined,
              size: 40.sp,
              color: Colors.white,
            ),
            SizedBox(height: 12.h),
            // Heading
            Text(
              'Ready for Your Spiritual Journey?',
              style: GoogleFonts.poppins(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            // Subheading
            Text(
              'Plan your complete trip with accommodation and travel bookings',
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(height: 16.h),
            // Plan My Trip Button
            Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: const Color(0xFFFF9933),
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Plan My Trip',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF9933),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 173.w,
      height: 168.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFFF9933).withOpacity(0.2),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFF9933),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE5E7EB),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          SizedBox(height: 12.h),
          // Title
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF003366),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          // Subtitle
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildTempleCard({
    required String templeName,
    required List<Map<String, dynamic>> timings,
  }) {
    return Container(
      width: 358.w,
      height: 385.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFFF9933).withOpacity(0.2),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Temple Name
          Text(
            templeName,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF292D32),
              height: 28 / 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          // Timings List
          ...List.generate(timings.length, (index) {
            final timing = timings[index];
            return Column(
              children: [
                if (index > 0) ...[
                  SizedBox(height: 12.h),
                  Divider(
                    color: const Color(0xFFE5E7EB),
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(height: 12.h),
                ],
                _buildTimingRow(
                  icon: timing['icon'] as IconData,
                  title: timing['title'] as String,
                  time: timing['time'] as String,
                  schedule: timing['schedule'] as String,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimingRow({
    required IconData icon,
    required String title,
    required String time,
    required String schedule,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEDD5),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE5E7EB),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFFF9933),
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          // Title and Schedule
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF003366),
                    height: 1.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  schedule,
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF6B7280),
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          // Time
          Expanded(
            flex: 1,
            child: Text(
              time,
              style: GoogleFonts.poppins(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF9933),
                height: 1.3,
              ),
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

