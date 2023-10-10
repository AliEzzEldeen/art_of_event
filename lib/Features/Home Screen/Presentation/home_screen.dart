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
          height: 110.h,
          child: Scaffold(
            backgroundColor: AppColors.primaryLight,
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 14.sp),

              child: Column(
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
                          hint: 'What are you looking for...',
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
                        child: AppSVG(assetName: "sort", height: 3.h),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
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
                            width: 75.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  'https://img.freepik.com/free-psd/elegant-wedding-banner-template_23-2148945298.jpg?w=1380&t=st=1696941421~exp=1696942021~hmac=9f5fdfe5a1f06f0283f1f4eec3cb5027ed1302f1b2bffa3d845eaab931c43087',
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
                          decorator: DotsDecorator(activeColor: AppColors.selected,color: AppColors.primary),
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
                        width: 30.w,
                          margin: EdgeInsetsDirectional.only(end: 15.sp),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                              16.sp,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.sp, horizontal: 15.sp),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                      'https://img.freepik.com/free-vector/golden-wedding-rings-3d-realistic-illustration-engagement_33099-519.jpg?w=826&t=st=1696941503~exp=1696942103~hmac=0782abe040a71a407fa29418e0e0b799cde88c5ab01833b00312aa9b9fe82a57'),
                                ),
                                Text(
                                  'welcome Board efgefg egaefrgadsfgs gads',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Trending',
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
                  SizedBox(
                    height: 20.h,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10.sp,horizontal: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.sp, horizontal: 20.sp),
                                    height: 15.h,
                                    width: 50.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(
                                        15.sp,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                            Image.network(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnszDLM2muvyCEMz9E7CjM24n7MW2srp0U1w'),
                                          ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 7.sp,horizontal: 8.sp),
                                    margin: EdgeInsets.symmetric(vertical: 7.sp,horizontal: 8.sp),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.sp),
                                    color: AppColors.primaryLight),
                                    child: AppSVG(
                                      assetName: 'heart',
                                      height: 3.h,
                                    ),
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
                                  height: 0.3.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '200 EGP',
                                      style: TextStyle(
                                          color: AppColors.selected,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                    SizedBox(width: 11.w,),
                                    Icon(Icons.star,size: 2.h,color: Colors.yellow,),
                                    SizedBox(
                                      width: 0.3.h,
                                    ),
                                    Text(
                                      '5.0',
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    'Single offers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, index, realIndex) => SizedBox(
                          width: 75.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                'https://img.freepik.com/free-psd/elegant-wedding-banner-template_23-2148945298.jpg?w=1380&t=st=1696941421~exp=1696942021~hmac=9f5fdfe5a1f06f0283f1f4eec3cb5027ed1302f1b2bffa3d845eaab931c43087',
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
                        decorator: DotsDecorator(activeColor: AppColors.selected,color: AppColors.primary),
                        dotsCount: 3,
                        position: currentIndex,
                      )
                    ],
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
