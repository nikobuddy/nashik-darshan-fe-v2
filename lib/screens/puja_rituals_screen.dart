import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Puja Rituals Screen
/// Displays sacred rituals and puja information for Nashik
class PujaRitualsScreen extends StatefulWidget {
  const PujaRitualsScreen({super.key});

  @override
  State<PujaRitualsScreen> createState() => _PujaRitualsScreenState();
}

class _PujaRitualsScreenState extends State<PujaRitualsScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  final PageController _placesPageController = PageController();
  int _currentPage = 0;
  int _currentPlacesPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        int next = _pageController.page!.round();
        if (_currentPage != next) {
          setState(() {
            _currentPage = next;
          });
        }
      }
    });
    _placesPageController.addListener(() {
      if (_placesPageController.page != null) {
        int next = _placesPageController.page!.round();
        if (_currentPlacesPage != next) {
          setState(() {
            _currentPlacesPage = next;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _placesPageController.dispose();
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
          'Puja Rituals',
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
            // Hero Image Section
            _buildHeroImageSection(),
            SizedBox(height: 24.h),
            // Content Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'The Land of Sacred Rituals',
                    style: GoogleFonts.montserrat(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Description
                  Text(
                    'Nashik, where the holy Godavari river flows and Lord Rama once walked, has been a cradle of spirituality for millennia. It is one of the four sacred sites of Kumbh Mela and home to ancient temples that pulse with divine energy. Every ritual performed here carries the blessings of countless saints and sages who have meditated on these sacred grounds.',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF4B5563),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            // Explore Sacred Rituals Section
            _buildExploreSacredRitualsSection(),
            SizedBox(height: 24.h),
            // Explore Sacred Places Section
            _buildExploreSacredPlacesSection(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreSacredRitualsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Sacred Rituals',
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2937),
                ),
              ),
              Text(
                'View All',
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFEA580C),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // Horizontally Scrolling Cards
        SizedBox(
          height: 343.h,
          child: PageView(
            controller: _pageController,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: _buildRitualCard(
                  imagePath: 'assets/images/home-hero.png',
                  title: 'Trimbakeshwar Abhishek',
                  description:
                      'Sacred Water and Panchamrut offering to Lord Shiva at Origin of Godavari',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: _buildRitualCard(
                  imagePath: 'assets/images/home-hero.png',
                  title: 'Kumbh Mela Rituals',
                  description:
                      'Sacred bath in holy Godavari during the grand spiritual gathering',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: _buildRitualCard(
                  imagePath: 'assets/images/home-hero.png',
                  title: 'Kalaram Temple Pooja',
                  description:
                      'Traditional aarti and offerings at the sacred black stone Ram temple',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // Dot Indicators
        _buildDotIndicators(),
      ],
    );
  }

  Widget _buildRitualCard({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () => _showRitualDetailsPopup(context, title, description),
      child: Container(
        width: 273.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Image.asset(
                imagePath,
                width: 273.w,
                height: 180.h,
                fit: BoxFit.cover,
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF111827),
                      height: 24 / 16,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  // Description
                  Text(
                    description,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF6B7280),
                      height: 20 / 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  // Learn More
                  Row(
                    children: [
                      Text(
                        'Learn More',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF97316),
                          height: 20 / 13,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_forward,
                        size: 16.sp,
                        color: const Color(0xFFF97316),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRitualDetailsPopup(
      BuildContext context, String title, String description) {
    // Get ritual details based on title
    Map<String, dynamic> ritualDetails = _getRitualDetails(title);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Container(
            width: 358.w,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          ritualDetails['popupTitle'],
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      'assets/images/home-hero.png',
                      width: 338.w,
                      height: 249.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Description
                  Text(
                    ritualDetails['fullDescription'],
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Info Cards
                  _buildInfoCard(
                    icon: Icons.star_outlined,
                    title: 'Sacred Significance',
                    subtitle: ritualDetails['significance'],
                  ),
                  SizedBox(height: 12.h),
                  _buildInfoCard(
                    icon: Icons.location_on_outlined,
                    title: 'Location',
                    subtitle: ritualDetails['location'],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Map<String, dynamic> _getRitualDetails(String title) {
    switch (title) {
      case 'Trimbakeshwar Abhishek':
        return {
          'popupTitle': 'Trimbakeshwar Abhishek Puja',
          'fullDescription':
              'The Trimbakeshwar Abhishek is a profound ritual performed at one of India\'s twelve Jyotirlingas. Devotees offer sacred waters from the Godavari river, milk, honey, and bilva leaves to Lord Shiva. The temple stands at the very source of the Godavari, where mythology says the river emerged from Shiva himself.',
          'significance':
              'The only Jyotirlinga where Brahma, Vishnu & Shiva reside together',
          'location': 'Trimbakeshwar Temple, 28 km from Nashik',
        };
      case 'Kumbh Mela Rituals':
        return {
          'popupTitle': 'Kumbh Mela Sacred Rituals',
          'fullDescription':
              'The Kumbh Mela is the largest spiritual gathering on Earth, held every 12 years in Nashik. Millions of devotees take a sacred dip in the holy Godavari river to cleanse their sins and attain moksha. The ritual bath, performed at auspicious times determined by celestial alignments, is believed to grant spiritual merit and liberation.',
          'significance':
              'One of the four holy sites of Kumbh Mela, where divine nectar fell from the sky',
          'location': 'Ramkund Ghat, Godavari River, Nashik',
        };
      case 'Kalaram Temple Pooja':
        return {
          'popupTitle': 'Kalaram Temple Pooja',
          'fullDescription':
              'The Kalaram Temple houses a magnificent black stone idol of Lord Rama, along with Goddess Sita and Lord Lakshmana. The temple is known for its powerful evening aarti where hundreds of devotees gather to witness the divine ceremony. The ancient rituals performed here follow centuries-old Vedic traditions and are said to fulfill devotees\' wishes.',
          'significance':
              'Sacred temple where Lord Rama stayed during his exile, blessed with divine presence',
          'location': 'Panchavati, Nashik City Center',
        };
      default:
        return {
          'popupTitle': title,
          'fullDescription':
              'Experience the divine ritual traditions of Nashik, where ancient spirituality meets timeless devotion.',
          'significance': 'Sacred ritual of Nashik',
          'location': 'Nashik, Maharashtra',
        };
    }
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFDE68A),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: const Color(0xFFF97316),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4B5563),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreSacredPlacesSection() {
    // Define sacred places data
    final List<Map<String, String>> places = [
      {
        'title': 'Trimbakeshwar Temple',
        'subtitle': 'One of 12 Jyotirlingas',
        'image': 'assets/images/home-hero.png',
      },
      {
        'title': 'Kalaram Temple',
        'subtitle': 'Black stone Ram idol',
        'image': 'assets/images/home-hero.png',
      },
      {
        'title': 'Panchavati',
        'subtitle': 'Lord Rama\'s exile place',
        'image': 'assets/images/home-hero.png',
      },
      {
        'title': 'Ramkund',
        'subtitle': 'Sacred bathing ghat',
        'image': 'assets/images/home-hero.png',
      },
      {
        'title': 'Sita Gufa',
        'subtitle': 'Cave of Goddess Sita',
        'image': 'assets/images/home-hero.png',
      },
      {
        'title': 'Muktidham Temple',
        'subtitle': 'White marble temple',
        'image': 'assets/images/home-hero.png',
      },
    ];

    // Split places into pages (2 cards per page)
    List<List<Map<String, String>>> pages = [];
    for (int i = 0; i < places.length; i += 2) {
      pages.add(places.sublist(i, i + 2 > places.length ? places.length : i + 2));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Sacred Places',
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2937),
                ),
              ),
              Text(
                'View All',
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFEA580C),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // Horizontally Scrolling Cards (2 rows per page)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            height: 172.h, // Height for 2 cards (80 + 80 + spacing)
            child: PageView.builder(
              controller: _placesPageController,
              itemCount: pages.length,
              itemBuilder: (context, pageIndex) {
                return Column(
                  children: [
                    _buildPlaceCard(
                      title: pages[pageIndex][0]['title']!,
                      subtitle: pages[pageIndex][0]['subtitle']!,
                      imagePath: pages[pageIndex][0]['image']!,
                    ),
                    if (pages[pageIndex].length > 1) ...[
                      SizedBox(height: 12.h),
                      _buildPlaceCard(
                        title: pages[pageIndex][1]['title']!,
                        subtitle: pages[pageIndex][1]['subtitle']!,
                        imagePath: pages[pageIndex][1]['image']!,
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Dot Indicators for Places
        _buildPlacesDotIndicators(pages.length),
      ],
    );
  }

  Widget _buildPlaceCard({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Container(
      width: 342.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Image
          Padding(
            padding: EdgeInsets.all(16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                imagePath,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1F2937),
                    height: 24 / 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF4B5563),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Chevron Icon
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Icon(
              Icons.chevron_right,
              color: const Color(0xFF9CA3AF),
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlacesDotIndicators(int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          width: _currentPlacesPage == index ? 24.w : 8.w,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: _currentPlacesPage == index
                ? const Color(0xFFF97316)
                : const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(9999.r),
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // Number of ritual cards
        (index) => Container(
          width: _currentPage == index ? 24.w : 8.w,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color(0xFFF97316)
                : const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(9999.r),
          ),
        ),
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
            top: 100.h,
            left: 24.w,
            right: 24.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sacred Rituals of Nashik',
                  style: GoogleFonts.montserrat(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                    height: 32 / 24,
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
}

