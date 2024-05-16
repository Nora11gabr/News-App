import 'package:flutter/material.dart';
import 'package:news_app4/core/utils/app_textstyle.dart';

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({super.key, required this.ErrorMessage});
  final String ErrorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(ErrorMessage,
          style: AppTextstyle.Primery600Size22.copyWith(fontSize: 18)),
    );
  }
}
