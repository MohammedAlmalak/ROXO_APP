import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Theme/app_colors.dart';
import '../../../utils/services.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchSocial({required String url, required String fallbackUrl}) async {
      //! Don't use canLaunch because of fbProtocolUrl (fb://)
      try {
        bool launched = await launch(url, forceSafariVC: false, forceWebView: false);
        if (!launched) {
          await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
        }
      } catch (e) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    }

    final TextStyle textStyle = AppServices.getLangBassedOnAppLang();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! facebook
            IconButton(
              onPressed: () {
                _launchSocial(url: "https://m.facebook.com/roxn.BID", fallbackUrl: "https://m.facebook.com/roxn.BID/?fbclid=IwAR1DHp1ZQd7TRw6OnFgnXsn5zrheNZIdCc5CnzXrDwVqdiHZoNLjzJpxsZo");
              },
              icon: Icon(
                LineIcons.facebook,
                color: AppColors.activeDotColor,
                size: 35.sp,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            //! instagram
            IconButton(
              onPressed: () {
                _launchSocial(url: "https://www.instagram.com/roxn_gmbh/", fallbackUrl: "");
              },
              icon: Icon(
                LineIcons.instagram,
                color: AppColors.activeDotColor,
                size: 35.sp,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 15.h),
          child: Table(
            border: TableBorder.all(color: AppColors.activeDotColor),
            children: [
              //! Telephone
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Telephone",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "06461-9896087",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              //! Email
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Email",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "info@rexon.de",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              //! Fax
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Fax",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "064619896088",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              //! location
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "location",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Hospitalstr. 5 ,35216\nBiedenkopf,Deutschland",
                      style: textStyle.copyWith(
                        color: AppColors.activeDotColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
