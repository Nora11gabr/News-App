import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app4/features/splash/Presentation/Widgets/SplashViewbody.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _verticalController;
  late Animation<double> _verticalAnimation;
  late AnimationController _textController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    SplashAnimation();
    Timer(Duration(seconds: 7), () => context.go('/allnews'));
  }

  void SplashAnimation() {
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.5,
    ).animate(_scaleController);

    _verticalController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _verticalAnimation = Tween<double>(
      begin: 0,
      end: -50,
    ).animate(_verticalController);

    _scaleController.forward().then((_) {
      _verticalController.forward().then((_) {});
    });

    _textController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _textAnimation =
        CurvedAnimation(parent: _textController, curve: Curves.easeOutBack);
    _verticalController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _textController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _verticalController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashViewBody(
          verticalController: _verticalController,
          scaleAnimation: _scaleAnimation,
          verticalAnimation: _verticalAnimation,
          textAnimation: _textAnimation),
    );
  }
}
