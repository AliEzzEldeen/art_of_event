import 'package:art_of_event/Core/Cubit/Main%20Screen/main_screen_cubit.dart';
import 'package:art_of_event/Core/Style/colors.dart';
import 'package:art_of_event/Features/Home%20Screen/Presentation/home_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  bool visible = true;
  MainScreenCubit cubit = MainScreenCubit();

  int index = 0;
  List<Widget> listScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocBuilder<MainScreenCubit, MainScreenState>(
  builder: (context, state) {
    return SafeArea(child: Scaffold(
      extendBody: true,
      body: cubit.screens[cubit.index],
        bottomNavigationBar: DotNavigationBar(
          enablePaddingAnimation: true,
          marginR: EdgeInsets.symmetric(horizontal: 25.sp,vertical: 1.sp),
          paddingR: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 1.sp),
          enableFloatingNavBar: true,
          backgroundColor: AppColors.bottomNav,
          currentIndex: cubit.index,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: AppColors.unSelected,
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: (value) {
            cubit.index = value;
            setState(() {});
          },
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home,size: 20.sp),
              selectedColor: AppColors.selected
            ),

            DotNavigationBarItem(
              icon:  Icon(Icons.shopping_cart,size: 20.sp,),
              selectedColor: AppColors.selected
            ),

            DotNavigationBarItem(
              icon:  Icon(Icons.shopping_bag,size: 20.sp,),
              selectedColor: AppColors.selected
            ),

            DotNavigationBarItem(
              icon:  Icon(Icons.person,size: 20.sp,),
              selectedColor: AppColors.selected
            ),
          ],
        ),
    )
    );
    }));
  }
}

