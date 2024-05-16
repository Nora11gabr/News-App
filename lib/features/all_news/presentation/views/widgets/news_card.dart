import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app4/core/utils/app_color.dart';
import 'package:news_app4/core/utils/app_textstyle.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {super.key, required this.title, required this.time, required this.img});
  final String title;
  final String time;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.fill)),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  title,
                  maxLines: 3,
                  style: AppTextstyle.Primery600Size22.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    time,
                    style: AppTextstyle.Black600Size15.copyWith(
                        color: AppColor.LightGray),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
