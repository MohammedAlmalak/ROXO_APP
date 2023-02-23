import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/cart/model/creditcard.dart';
import 'package:roxo/pages/widgets/field.dart';

import '../../../Theme/app_colors.dart';
import '../controller/credit_card_controller.dart';
import 'credit_card_input.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.textStyle,
  }) : super(key: key);
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (contex, index) {
                    return CreditCarrd.cards.isEmpty
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                "There is no Credit Card Added",
                                style: textStyle.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : Container();
                  },
                  separatorBuilder: (contex, index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                  itemCount: CreditCarrd.cards.isEmpty ? 1 : CreditCarrd.cards.length,
                ),
              ),
              //!
              GetBuilder<CreditCardController>(
                init: CreditCardController(),
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Field(
                            hintText: "",
                            focusNode: controller.ccv,
                            showtext: true,
                            inputType: TextInputType.emailAddress,
                            label: "cvv",
                            prefixicIcon: Icons.credit_card,
                            suffixcIcon: null,
                            makeSufficIconButton: false,
                            ontap: () => controller.update(),
                            validate: (value) {},
                            onSaved: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 160.w,
                          child: IconButton(
                            splashRadius: 0.2,
                            splashColor: Colors.transparent,
                            onPressed: () => Get.to(
                              () => const CreditCardInput(),
                            ),
                            icon: Row(
                              children: [
                                Text(
                                  "Add Credit Card",
                                  style: textStyle.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Icon(
                                  Icons.add,
                                  color: AppColors.activeDotColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
