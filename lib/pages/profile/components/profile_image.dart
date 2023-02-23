import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import '../../../Theme/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required TextStyle textstyle,
  })  : _textStyle = textstyle,
        super(key: key);
  final TextStyle _textStyle;
  @override
  Widget build(BuildContext context) {
    //! Profile image
    return GestureDetector(
      child: Stack(
        children: [
          Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Colors.white),
                color: Colors.white,
              ),
              child: Icon(
                Icons.person,
                color: Colors.grey.shade300,
                size: 70.0,
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.fromLTRB(75, 80, 0, 0),
              child: Icon(
                Icons.add_circle,
                color: Colors.grey.shade700,
                size: 20.0,
              ),
            ),
            onTap: () => showAnimatedDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return ClassicGeneralDialogWidget(
                  actions: [
                    //! Titile
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose",
                            style: _textStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          //!divider
                          Divider(
                            color: Colors.black.withOpacity(0.5),
                            thickness: 0.7,
                          ),
                          //! camera
                          ListTile(
                            horizontalTitleGap: 0,
                            leading: Icon(
                              Icons.camera,
                              color: AppColors.activeDotColor,
                            ),
                            title: Text(
                              "Camer",
                              style: _textStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          //! Gallery
                          ListTile(
                            horizontalTitleGap: 0,
                            leading: Icon(
                              Icons.photo,
                              color: AppColors.activeDotColor,
                            ),
                            title: Text(
                              "Gallery",
                              style: _textStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              animationType: DialogTransitionType.scale,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 1),
            ),
          ),
        ],
      ),
    );
  }
}
