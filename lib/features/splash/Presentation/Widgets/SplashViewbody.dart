import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app4/core/utils/app_textstyle.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required AnimationController verticalController,
    required Animation<double> scaleAnimation,
    required Animation<double> verticalAnimation,
    required Animation<double> textAnimation,
  })  : _verticalController = verticalController,
        _scaleAnimation = scaleAnimation,
        _verticalAnimation = verticalAnimation,
        _textAnimation = textAnimation;

  final AnimationController _verticalController;
  final Animation<double> _scaleAnimation;
  final Animation<double> _verticalAnimation;
  final Animation<double> _textAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _verticalController,
          builder: (context, child) {
            return AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Container(
                    alignment: Alignment.center,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Transform.translate(
                        offset: Offset(0, _verticalAnimation.value),
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          width: 120.w,
                          height: 120.h,
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ],
    );
  }
}
