import 'package:art_of_event/Core/Services/Location/location.dart';
import 'package:art_of_event/Core/Style/colors.dart';
import 'package:art_of_event/Core/Utills/app_svg.dart';
import 'package:art_of_event/Core/Utills/safe_print.dart';
import 'package:art_of_event/Core/Widgets/text_form_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  Position? currentPosition;
  String city = "";
  String country = "";

  @override
  void initState() {
    super.initState();
    LocationService(onLocationUpdate: _updateLocation).checkPermission(context);
  }

  void _updateLocation(Position position) async {
    setState(() {
      currentPosition = position;
    });

    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        currentPosition!.latitude,
        currentPosition!.longitude,
      );
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks.first;
        city = placeMark.locality ?? "N/A"; // Update the city variable
        country = placeMark.country ?? "N/A"; // Get the country
        setState(() {});
      }
    } catch (e) {
      safePrint("Error fetching location information: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return
       LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
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
                      Column(
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
                            '$city,$country',
                            style: TextStyle(
                                color: AppColors.hintText,
                                fontSize: 15.6.sp,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          ),
                        ],
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
                  AppTextField(
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
                    height: 7.h,
                    width: double.infinity,
                    child: ListView.builder(

                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                          width: 18.w,
                          margin: EdgeInsetsDirectional.only(end: 10.sp),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(
                              50.sp,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.sp, horizontal: 8.sp),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                      AppSVG(assetName: 'wedding', height: 4.h),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
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
                          decorator: const DotsDecorator(
                              activeColor: AppColors.selected,
                              color: AppColors.primary),
                          dotsCount: 3,
                          position: currentIndex,
                        )
                      ],
                    ),
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
                        Icons.arrow_forward_ios,
                        size: 1.5.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsetsDirectional.only(end: 13.sp),
                              child: SizedBox(
                                width: 65.w,
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(16),
                                              child: Image.network(
                                                  'https://img.freepik.com/free-psd/elegant-wedding-banner-template_23-2148945298.jpg?w=1380&t=st=1696941421~exp=1696942021~hmac=9f5fdfe5a1f06f0283f1f4eec3cb5027ed1302f1b2bffa3d845eaab931c43087'),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30.sp),
                                                child: Center(
                                                  child: Text(
                                                    'Trending',
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.textColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.sp, vertical: 8.sp),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.sp, vertical: 5.sp),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          16.sp,
                                        ),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        size: 19.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                  Text(
                    'Recommended For You',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsetsDirectional.only(end: 13.sp),
                              child: SizedBox(
                                width: 46.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                        topEnd: Radius.circular(
                                          16.sp,
                                        ),
                                        topStart: Radius.circular(
                                          16.sp,
                                        ),
                                      ),
                                      child: Image.network(
                                          'https://img.freepik.com/free-psd/elegant-wedding-banner-template_23-2148945298.jpg?w=1380&t=st=1696941421~exp=1696942021~hmac=9f5fdfe5a1f06f0283f1f4eec3cb5027ed1302f1b2bffa3d845eaab931c43087'),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            'Trending',
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 1,
                                          ),
                                        ),
                                        const Spacer(),
                                        Icon(CupertinoIcons.heart, size: 16.sp),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            'Guest Book',
                                            style: TextStyle(
                                                color: AppColors.secondColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 1,
                                          ),
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Icon(CupertinoIcons.star,
                                                color: Colors.yellowAccent,
                                                size: 16.sp),
                                            Text(
                                              '5.0',
                                              style: TextStyle(
                                                  color: AppColors.secondColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.sp,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '200 EGP',
                                      style: TextStyle(
                                          color: AppColors.secondColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
