import 'package:art_of_event/Core/Style/colors.dart';
import 'package:art_of_event/Core/Utills/app_svg.dart';
import 'package:art_of_event/Core/Widgets/text_form_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 150.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 14.sp),
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 20.sp,
                        backgroundImage: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREO17hg6KvLlweeZWN0LCEdi-OXM9qGpbQ9w',
                        ),
                        onBackgroundImageError: (exception, stackTrace) =>
                            AppSVG(assetName: 'error', height: 2.h),
                      ),
                      SizedBox(width: 13.sp),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Moaz Mohamed',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.6.sp,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            Text(
                              'Location not selected yet!',
                              style: TextStyle(
                                  color: AppColors.hintText,
                                  fontSize: 15.6.sp,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(24.sp)),
                        child: AppSVG(
                            assetName: 'bell',
                            height: 3.h,
                            color: AppColors.blackColor),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(24.sp)),
                        child: AppSVG(
                            assetName: 'heart',
                            height: 3.h,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          hint: 'Search here',
                          keyboardType: TextInputType.text,
                          textColor: AppColors.primary,
                          controller: searchController,
                          isPassword: false,
                          textInputAction: TextInputAction.search,
                          textInputType: TextInputType.text,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 4.w),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(14.sp),
                            color: AppColors.primary),
                        child: AppSVG(assetName: "heart", height: 3.h),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    'Special offers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) => SizedBox(
                            width: 73.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHh6nDtbuBDnVLnOspojm5e5PfyM1bS1FM5w',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          carouselController: carouselController,
                          options: CarouselOptions(

                            animateToClosest: true,
                            pageSnapping: true,
                            padEnds: true,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                            height: 18.h,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },

                          ),
                        ),
                        DotsIndicator(
                          dotsCount: 3,
                          position: currentIndex,
                        )

                      ],
                    ),
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 12.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) => Container(
                          margin: EdgeInsetsDirectional.only(end: 15.sp),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(
                              16.sp,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.sp, horizontal: 15.sp),
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX-62j9_rn7jQl3qcyhzbOokeTQmtxEH1k6A'),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Feature Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      const Spacer(),
                      Text(
                        'See All',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      Icon(
                        Icons.arrow_right,
                        size: 3.h,
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 6,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.sp, horizontal: 15.sp),
                                  height: 15.h,
                                  width: 50.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(
                                      15.sp,
                                    ),
                                  ),
                                  child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX-62j9_rn7jQl3qcyhzbOokeTQmtxEH1k6A'),
                                ),
                                AppSVG(
                                  assetName: 'heart',
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Wedding Planner',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                'category',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                '200 EGP',
                                style: TextStyle(
                                    color: AppColors.selected,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
