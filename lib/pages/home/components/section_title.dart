import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    required this.sectionTitleStyle,
    required this.viewAlltsyle,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String title;
  final TextStyle sectionTitleStyle;
  final TextStyle viewAlltsyle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //!title
        Text(
          title,
          style: sectionTitleStyle,
        ),
        //!view all
        InkWell(
          onTap: onTap,
          child: Text("view All", style: viewAlltsyle),
        ),
      ],
    );
  }
}
// AppFonts.lato(
//               AppColors.black,
//               15.sp,
//               FontWeight.w400,
//             ),
