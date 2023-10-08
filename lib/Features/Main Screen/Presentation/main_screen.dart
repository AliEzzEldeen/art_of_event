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
    return SafeArea(child: Scaffold(body: cubit.screens[cubit.index],
        bottomNavigationBar: DotNavigationBar(
          marginR: EdgeInsets.symmetric(horizontal: 25.sp,vertical: 1.sp),
          paddingR: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 1.sp),
          enableFloatingNavBar: true,
          backgroundColor: AppColors.primary,
          currentIndex: cubit.index,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[500],
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: (value) {
            cubit.index = value;
            setState(() {});
          },
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home,size: 20.sp),
              selectedColor: Color(0xff73544C),
            ),

            DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: Color(0xff73544C),
            ),

            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Color(0xff73544C),
            ),

            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
    )
    );
    }));
  }
}

