import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbot_ai/utils/theme/font_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InitialHomeBody extends StatelessWidget {
  const InitialHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.deepPurple,
      Colors.pink,
      Colors.purple,
    ];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/gemini-color.svg', height: 40.h),
          SizedBox(height: 14.h),
          AnimatedTextKit(animatedTexts: [
            ColorizeAnimatedText('What can I help with?',
                textStyle:
                    FontHelper.fontText(26.sp, FontWeight.w800, Colors.white),
                colors: colorizeColors)
          ]),
        ],
      ),
    );
  }
}
