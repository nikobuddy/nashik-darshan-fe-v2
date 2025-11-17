import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_card.dart';

/// Categories Grid Widget
/// Displays categories in a 2-column grid layout
class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Spiritual',
        'subtitle': 'Temples, caves, forts',
        'info': '12 places',
        'icon': Icons.temple_hindu,
      },
      {
        'title': 'Nature',
        'subtitle': 'Parks & Wildlife',
        'info': '8 wineries',
        'icon': Icons.nature,
      },
      {
        'title': 'Adventure',
        'subtitle': 'Outdoor & Sports',
        'info': '12+ Places',
        'icon': Icons.hiking,
      },
      {
        'title': 'Family',
        'subtitle': 'Kid Friendly',
        'info': '16 options',
        'icon': Icons.family_restroom,
      },
      {
        'title': 'Culture',
        'subtitle': 'Traditional Events & Art Museums',
        'info': 'Live booking',
        'icon': Icons.museum,
      },
      {
        'title': 'Shopping',
        'subtitle': 'Market & Malls',
        'info': '22+ Places',
        'icon': Icons.shopping_bag,
      },
    ];

    return Column(
      children: List.generate((categories.length / 2).ceil(), (rowIndex) {
        int startIndex = rowIndex * 2;
        int endIndex = (startIndex + 2).clamp(0, categories.length);
        List<Map<String, dynamic>> rowCategories = categories.sublist(startIndex, endIndex);

        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            children: [
              ...rowCategories.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> category = entry.value;
                return [
                  Expanded(
                    child: CategoryCard(
                      title: category['title'] as String,
                      subtitle: category['subtitle'] as String,
                      info: category['info'] as String,
                      icon: category['icon'] as IconData,
                    ),
                  ),
                  if (index < rowCategories.length - 1) SizedBox(width: 12.w),
                ];
              }).expand((element) => element),
            ],
          ),
        );
      }),
    );
  }
}

