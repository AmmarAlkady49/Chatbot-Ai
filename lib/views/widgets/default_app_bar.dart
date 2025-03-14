import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.grey.shade900,
      surfaceTintColor: Colors.grey.shade900,
      shadowColor: Colors.grey.shade900,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded, color: Colors.white)),
      title: SvgPicture.asset(
        // 'assets/images/gemini-brand-color.svg',
        'assets/images/gemini-brand.svg',
        height: 30.h,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        )
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
