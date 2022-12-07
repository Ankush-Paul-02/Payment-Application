import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/widgets/buttons.dart';
import 'package:payment_app/widgets/dimentions.dart';
import 'package:payment_app/widgets/large_buttons.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Dimensions.screenHeight;
    double w = Dimensions.screenWidth;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: Dimensions.height80,
            left: Dimensions.width20,
            right: Dimensions.width20),
        height: h,
        width: w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/paymentbackground.png"))),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h * 0.14,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/success.png"))),
            ),
            Text(
              "Success !",
              style: TextStyle(
                  fontSize: Dimensions.font30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.mainColor),
            ),
            Text(
              "Payment is completed for 2 bills",
              style: TextStyle(
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.idColor),
            ),
            SizedBox(
              height: h * 0.035,
            ),
            Container(
              height: Dimensions.height160,
              width: Dimensions.width350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.width10),
                  border: Border.all(
                      width: Dimensions.width10 * 0.2,
                      color: Colors.grey.withOpacity(0.5))),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: Dimensions.height15,
                                    left: Dimensions.width20,
                                    bottom: Dimensions.height10),
                                width: Dimensions.width25 * 2,
                                height: Dimensions.height25 * 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.width25),
                                    color: Colors.green),
                                child: Icon(
                                  Icons.done,
                                  size: Dimensions.height30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kengen Power",
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Text(
                                    "674392",
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.idColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: Dimensions.width30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.mainColor),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Text(
                                    "\$1999.00",
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.mainColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: Dimensions.height10 * 0.2,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Column(
              children: [
                Text(
                  "Total amount",
                  style: TextStyle(
                      fontSize: Dimensions.font20, color: AppColor.idColor),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Text(
                  "\$5997.00",
                  style: TextStyle(
                      fontSize: Dimensions.font30,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainColor),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButtons(
                  icon: Icons.share_sharp,
                  onTap: () {},
                  text: "share",
                ),
                AppButtons(
                  icon: Icons.print_outlined,
                  onTap: () {},
                  text: "print",
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height35,
            ),
            AppLargeButton(
              text: "Done",
              backgroundColor: Colors.white,
              textColor: AppColor.mainColor,
              onTap: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
