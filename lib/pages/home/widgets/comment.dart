import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/app_colors.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key, required this.comment, required this.date, required this.name, required this.rate, required this.textStyle}) : super(key: key);
  final int rate;
  final String comment;
  final String name;
  final String date;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 8,
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Stars
              SizedBox(
                height: 40,
                width: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ((index + 1) > rate)
                        ? const Icon(
                            Icons.star_border,
                            size: 18,
                            color: Colors.amber,
                          )
                        : const Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.amber,
                          );
                  },
                  itemCount: 5,
                ),
              ),
              //! Names
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      date,
                      style: textStyle.copyWith(
                        color: AppColors.gray,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              //! Comments
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  comment,
                  style: textStyle.copyWith(
                    color: AppColors.gray,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
