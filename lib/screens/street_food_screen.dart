import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nashik/core/widgets/shared/category_selection_widget.dart';
import 'package:nashik/core/widgets/shared/result_count_widget.dart';
import 'package:nashik/core/widgets/shared/search_bar_widget.dart';

/// Street Food Screen
/// Displays street food and local food stalls in Nashik
class StreetFoodScreen extends StatefulWidget {
  const StreetFoodScreen({super.key});

  @override
  State<StreetFoodScreen> createState() => _StreetFoodScreenState();
}

class _StreetFoodScreenState extends State<StreetFoodScreen> {
  String selectedCategory = 'Street Food';
  String selectedFilter = 'All';

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
          'Street Food',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              SearchBarWidget(
                hintText: 'Search street food',
                onFilterTap: () {
                  // Handle filter tap
                },
              ),
              SizedBox(height: 16.h),
              
              // Category Selection
              CategorySelectionWidget(
                categories: const ['Restaurants', 'Hotels', 'Street Food'],
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              SizedBox(height: 16.h),
              
              // Filter Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildFilterButton('All'),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _buildFilterButton('Near Me'),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _buildFilterButton('Most popular'),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              
              
              // Result Count
              const ResultCountWidget(
                count: 147,
                itemType: 'Street food Places',
              ),
              SizedBox(height: 16.h),
              
              // Festival Foods Box
              _buildFestivalFoodsBox(),
              SizedBox(height: 24.h),
              
              // Featured Street Food Section
              _buildFeaturedStreetFoodSection(),
              SizedBox(height: 24.h),
              
              // Food Trails and Trending Row
              Row(
                children: [
                  Expanded(
                    child: _buildInfoBox(
                      backgroundColor: const Color(0xFFFFEDD5),
                      icon: Icons.explore,
                      title: 'Food Trails',
                      subtitle: 'Evening Chaat Trail',
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildInfoBox(
                      backgroundColor: const Color(0xFFF3E8FF),
                      icon: Icons.trending_up,
                      title: 'Trending Now',
                      subtitle: 'Live user photos',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              
              // Popular Food Spots Section
              _buildPopularFoodSpotsSection(),
              SizedBox(height: 16.h),
              
              // Street Food Safety Tips
              _buildSafetyTipsBox(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSafetyTipsBox() {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFBFDBFE),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left - Shield Icon
          Icon(
            Icons.shield_outlined,
            color: const Color(0xFF2563EB),
            size: 32.sp,
          ),
          SizedBox(width: 12.w),
          // Right - Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Street Food Safety Tips',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E40AF),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Prefer bottled water, eat freshly made food, avoid rush-hour overstocked stalls',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF1D4ED8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularFoodSpotsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Food Spots',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F2937),
                height: 28 / 18,
              ),
            ),
            Text(
              'View All',
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xFFFF6B35),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // Food Spot Cards
        _buildFoodSpotCard(
          imagePath: 'assets/images/home-hero.png',
          name: 'Bedekar Misal',
          status: 'Open Now',
          cuisine: 'Famous Misal Pav • Spicy',
          rating: 4.5,
          reviewCount: 820,
          location: 'Near CBS Bus Stand',
          priceRange: '₹80-150 per person',
        ),
        SizedBox(height: 12.h),
        _buildFoodSpotCard(
          imagePath: 'assets/images/home-hero.png',
          name: 'Chaat Corner',
          status: 'Open Now',
          cuisine: 'Street Chaat • Popular',
          rating: 4.3,
          reviewCount: 654,
          location: 'Panchavati Market',
          priceRange: '₹50-100 per person',
        ),
      ],
    );
  }

  Widget _buildFoodSpotCard({
    required String imagePath,
    required String name,
    required String status,
    required String cuisine,
    required double rating,
    required int reviewCount,
    required String location,
    required String priceRange,
  }) {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(12.w),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left - Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              imagePath,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          // Right - Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name and Status Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCFCE7),
                        borderRadius: BorderRadius.circular(9999.r),
                      ),
                      child: Text(
                        status,
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF15803D),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                // Cuisine
                Text(
                  cuisine,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF4B5563),
                  ),
                ),
                SizedBox(height: 4.h),
                // Rating
                Row(
                  children: [
                    // Stars
                    ...List.generate(5, (index) {
                      return Icon(
                        index < rating.floor()
                            ? Icons.star
                            : (index < rating ? Icons.star_half : Icons.star_border),
                        color: const Color(0xFFFFA201),
                        size: 14.sp,
                      );
                    }),
                    SizedBox(width: 6.w),
                    Text(
                      '$rating ($reviewCount)',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                // Location
                Text(
                  location,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 3.h),
                // Price Range
                Text(
                  priceRange,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFFF6B35),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedStreetFoodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          'Featured Street Food',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 16.h),
        // Horizontal Scrolling Cards
        SizedBox(
          height: 192.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFeaturedCard(
                imagePath: 'assets/images/home-hero.png',
                badge: 'Most Loved',
                title: 'Misal Pav',
                subtitle: 'Spicy lentil curry with bread',
              ),
              SizedBox(width: 16.w),
              _buildFeaturedCard(
                imagePath: 'assets/images/home-hero.png',
                badge: 'Popular',
                title: 'Vada Pav',
                subtitle: 'Spicy potato fritter in bun',
              ),
              SizedBox(width: 16.w),
              _buildFeaturedCard(
                imagePath: 'assets/images/home-hero.png',
                badge: 'Must Try',
                title: 'Sabudana Vada',
                subtitle: 'Crispy sago fritters',
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedCard({
    required String imagePath,
    required String badge,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 280.w,
      height: 192.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            // Image with dark overlay
            Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: 280.w,
                  height: 192.h,
                  fit: BoxFit.cover,
                ),
                // Dark overlay
                Container(
                  width: 280.w,
                  height: 192.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Badge at top right
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444),
                  borderRadius: BorderRadius.circular(9999.r),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Title and Subtitle at bottom left
            Positioned(
              bottom: 12.h,
              left: 12.w,
              right: 12.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
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

  Widget _buildInfoBox({
    required Color backgroundColor,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32.sp,
            color: const Color(0xFF1F2937),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
              height: 20 / 14,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String filter) {
    final isSelected = selectedFilter == filter;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF914D) : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: const Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            filter,
            style: GoogleFonts.montserrat(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : const Color(0xFF6B7280),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildFestivalFoodsBox() {
    return Container(
      width: 358.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF944D),
            Color(0xFFFFB247),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Festival Foods ',
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 28 / 18,
                ),
              ),
              Text(
                '🪔',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            'Special foods during Kumbh Mela season',
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              height: 20 / 14,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE68A),
                  borderRadius: BorderRadius.circular(9999.r),
                ),
                child: Text(
                  'Puran Poli',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF92400E),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE68A),
                  borderRadius: BorderRadius.circular(9999.r),
                ),
                child: Text(
                  'Basundi',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF92400E),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

