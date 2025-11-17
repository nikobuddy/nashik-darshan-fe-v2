import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Itineraries Screen
/// Displays travel itineraries and trip plans for Nashik
class ItinerariesScreen extends StatefulWidget {
  const ItinerariesScreen({super.key});

  @override
  State<ItinerariesScreen> createState() => _ItinerariesScreenState();
}

class _ItinerariesScreenState extends State<ItinerariesScreen> {
  String selectedDuration = '1-Day';
  String selectedBudget = 'Low';
  String selectedType = 'Family';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Itineraries',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Section with overlapping filter box
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildHeroImageSection(),
                // Overlapping filter box
                Positioned(
                  bottom: -78.h,
                  left: 16.w,
                  right: 16.w,
                  child: _buildFilterBox(),
                ),
              ],
            ),
            
            // Add spacing for the overlapping box
            SizedBox(height: 90.h),
            
            // Rest of content
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AI Suggestion Box
                  _buildAISuggestionBox(),
                  SizedBox(height: 16.h),
                  
                  // Festive Highlight Box
                  _buildFestiveHighlightBox(),
                  SizedBox(height: 24.h),
                  
                  // Recommended Itineraries Section
                  _buildRecommendedItinerariesSection(),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedItinerariesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Itineraries',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111827),
          ),
        ),
        SizedBox(height: 16.h),
        _buildItineraryCard(
          imagePath: 'assets/images/home-hero.png',
          tag: 'Weekend',
          tagColor: const Color(0xFF3B82F6),
          title: 'Family Heritage Tour',
          duration: '1 Day',
          durationColor: const Color(0xFF16A34A),
          createdDate: 'Created Sep 5, 2025',
          stops: '3 stops',
          distance: '1,800',
          walkInfo: 'Walk',
          crowdInfo: 'Low crowd expected',
          crowdColor: const Color(0xFF15803D),
        ),
        SizedBox(height: 16.h),
        // View All Button
        Center(
          child: Text(
            'View all',
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFEA580C),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        // Popular from Users Section
        _buildPopularFromUsersSection(),
      ],
    );
  }

  Widget _buildPopularFromUsersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular from Users',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF111827),
          ),
        ),
        SizedBox(height: 16.h),
        _buildUserReviewCard(
          name: 'Priya Sharma',
          location: 'Mumbai',
          title: 'Solo Spiritual Journey',
          description: 'Perfect 1-day plan for peaceful darshan and meditation',
          rating: 4.8,
          reviewCount: 124,
        ),
        SizedBox(height: 12.h),
        _buildUserReviewCard(
          name: 'Rahul Patel',
          location: 'Pune',
          title: 'Family Weekend Trip',
          description: 'Amazing temple tour with kids-friendly stops',
          rating: 4.6,
          reviewCount: 89,
        ),
      ],
    );
  }

  Widget _buildUserReviewCard({
    required String name,
    required String location,
    required String title,
    required String description,
    required double rating,
    required int reviewCount,
  }) {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            children: [
              // Profile Picture
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: const Color(0xFF6B7280),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              // Name and Location
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000),
                        height: 20 / 14,
                      ),
                    ),
                    Text(
                      location,
                      style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF6B7280),
                        height: 16 / 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Title
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF000000),
            ),
          ),
          SizedBox(height: 4.h),
          // Description
          Text(
            description,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF4B5563),
            ),
          ),
          SizedBox(height: 12.h),
          // Rating and Use Plan Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: const Color(0xFFFFA201),
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '$rating ($reviewCount reviews)',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
              Text(
                'Use Plan',
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFF6B35),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItineraryCard({
    required String imagePath,
    required String tag,
    required Color tagColor,
    required String title,
    required String duration,
    required Color durationColor,
    required String createdDate,
    required String stops,
    required String distance,
    required String walkInfo,
    required String crowdInfo,
    required Color crowdColor,
  }) {
    return Container(
      width: 358.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with overlays
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                child: Image.asset(
                  imagePath,
                  width: 358.w,
                  height: 192.h,
                  fit: BoxFit.cover,
                ),
              ),
              // Tag at top left
              Positioned(
                top: 12.h,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: BorderRadius.circular(9999.r),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Heart icon at top right
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: const Color(0xFF6B7280),
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
          // Card Content
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Duration Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF111827),
                          height: 24 / 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: durationColor,
                        borderRadius: BorderRadius.circular(9999.r),
                      ),
                      child: Text(
                        duration,
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                // Created Date
                Text(
                  createdDate,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 8.h),
                // Stops, Distance, Walk Info
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16.sp,
                      color: const Color(0xFF4B5563),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      stops,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF4B5563),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.straighten,
                      size: 16.sp,
                      color: const Color(0xFF4B5563),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      distance,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF4B5563),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.directions_walk,
                      size: 16.sp,
                      color: const Color(0xFF4B5563),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      walkInfo,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Crowd Info and Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCFCE7),
                          borderRadius: BorderRadius.circular(9999.r),
                        ),
                        child: Text(
                          crowdInfo,
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: crowdColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Container(
                      width: 132.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF914D),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          'View Full Plan',
                          style: GoogleFonts.montserrat(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAISuggestionBox() {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEFF6FF),
            Color(0xFFEEF2FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFBFDBFE),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI Icon
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 20.sp,
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
                  'AI Suggestion',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1E40AF),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Since you\'re visiting Sula Vineyards, do you also want to explore York Winery nearby?',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF1D4ED8),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Add to Itinerary',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2563EB),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFestiveHighlightBox() {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFF7ED),
            Color(0xFFFEF2F2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFFED7AA),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                '🪔',
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(width: 8.w),
              Text(
                'Festive Highlight',
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC2410C),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Kumbh Mela is happening this month! Special darshan timings and crowd management tips included.',
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFFC2410C),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFF914D),
              borderRadius: BorderRadius.circular(9999.r),
            ),
            child: Text(
              'View Festival Itineraries',
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImageSection() {
    return Container(
      width: 390.w,
      height: 256.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Image
          Image.asset(
            'assets/images/home-hero.png',
            width: 390.w,
            height: 256.h,
            fit: BoxFit.cover,
          ),
          // Dark overlay
          Container(
            width: 390.w,
            height: 256.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ),
          // Text content
          Positioned(
            top: 60.h,
            left: 24.w,
            right: 24.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your Personalized Nashik Darshan Itinerary',
                  style: GoogleFonts.montserrat(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                    height: 32 / 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Explore. Experience. Remember.',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBox() {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Search Bar
          Container(
            width: 326.w,
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: const Color(0xFF6B7280),
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search destinations, activities...',
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFFADAEBC),
                        height: 24 / 16,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // Filter Dropdowns Row
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: 'Duration',
                  value: selectedDuration,
                  items: ['1-Day', '2-Days', '3-Days', '4-Days', '5-Days'],
                  onChanged: (value) {
                    setState(() {
                      selectedDuration = value!;
                    });
                  },
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildDropdown(
                  label: 'Budget',
                  value: selectedBudget,
                  items: ['Low', 'Medium', 'High'],
                  onChanged: (value) {
                    setState(() {
                      selectedBudget = value!;
                    });
                  },
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildDropdown(
                  label: 'Type',
                  value: selectedType,
                  items: ['Family', 'Solo', 'Couple', 'Group'],
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6B7280),
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          height: 38.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: const Color(0xFFE5E7EB),
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: const Color(0xFF6B7280),
                size: 20.sp,
              ),
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF000000),
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

