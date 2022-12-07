import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/controllers/data_controllers.dart';
import 'package:payment_app/pages/payment_page.dart';
import 'package:payment_app/widgets/buttons.dart';
import 'package:payment_app/widgets/dimentions.dart';
import 'package:payment_app/widgets/large_buttons.dart';
import 'package:payment_app/widgets/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    print(_controller.list);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: Dimensions.screenHeight,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.loading == false) {
                return Center(
                  child: Container(
                      width: Dimensions.height100,
                      height: Dimensions.height100,
                      child: const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColor.mainColor),
                      )),
                );
              } else {
                return _listBills();
              }
            }),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: Dimensions.height310,
      child: Stack(
        children: [
          _mainBackGround(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer()
        ],
      ),
    );
  }

  _mainBackGround() {
    return Positioned(
        bottom: Dimensions.height10,
        left: 0,
        child: Container(
          height: Dimensions.height300,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/background.png"))),
        ));
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -Dimensions.width15,
        bottom: Dimensions.height10,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/curve.png"))),
        ));
  }

  _buttonContainer() {
    return Positioned(
        bottom: Dimensions.height15,
        right: Dimensions.width40,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    height: MediaQuery.of(context).size.height -
                        Dimensions.height235,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: const Color(0xFFeef1f4).withOpacity(0.7),
                              height: MediaQuery.of(context).size.height -
                                  Dimensions.height300,
                              width: MediaQuery.of(context).size.width,
                            )),
                        Positioned(
                            top: 0,
                            right: Dimensions.width40,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.height10,
                                  bottom: Dimensions.height25),
                              width: Dimensions.width60,
                              height: Dimensions.height250,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.width29)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButtons(
                                    icon: Icons.cancel,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                  ),
                                  AppButtons(
                                    icon: Icons.add,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {},
                                    text: "Add Bill",
                                  ),
                                  AppButtons(
                                    icon: Icons.history,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {},
                                    text: "History",
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: Dimensions.height60,
            width: Dimensions.width60,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/images/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: Dimensions.width15,
                      offset: const Offset(0, -1),
                      color: const Color(0xFF11324d).withOpacity(0.2))
                ]),
          ),
        ));
  }

  _listBills() {
    return Positioned(
        top: Dimensions.height320,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: _controller.list.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height20, right: Dimensions.width20),
                height: Dimensions.height150,
                width: MediaQuery.of(context).size.width - Dimensions.width20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.width30),
                        bottomRight: Radius.circular(Dimensions.width30)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFFd8dbe0),
                          offset: const Offset(1, 1),
                          blurRadius: Dimensions.width20,
                          spreadRadius: Dimensions.width10),
                    ]),
                child: Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.height10, left: Dimensions.width18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: Dimensions.height60,
                                width: Dimensions.width60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.width10),
                                    border: Border.all(
                                        width: Dimensions.width3,
                                        color: Colors.grey),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            _controller.list[index]["img"]))),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _controller.list[index]["brand"],
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Text(
                                    "ID: 548729",
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: AppColor.idColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedText(
                              text: _controller.list[index]["more"],
                              color: AppColor.green),
                          SizedBox(
                            height: Dimensions.height10 * 0.5,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.list[index]["status"] =
                                      !_controller.list[index]["status"];
                                  _controller.list.refresh();
                                },
                                child: Container(
                                  width: Dimensions.width80,
                                  height: Dimensions.height30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.width30),
                                      color: _controller.list[index]
                                                  ["status"] ==
                                              false
                                          ? AppColor.selectBackground
                                          : Colors.green),
                                  child: Center(
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          color: _controller.list[index]
                                                      ["status"] ==
                                                  false
                                              ? AppColor.idColor
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                "\$" + _controller.list[index]["due"],
                                style: TextStyle(
                                    fontSize: Dimensions.font18,
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "Due in 3 days",
                                style: TextStyle(
                                    fontSize: Dimensions.font14,
                                    color: AppColor.idColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Dimensions.height10 * 0.5,
                          ),
                          Container(
                            width: Dimensions.width10 * 0.5,
                            height: Dimensions.height35,
                            decoration: BoxDecoration(
                                color: AppColor.halfOval,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.width30),
                                    bottomLeft:
                                        Radius.circular(Dimensions.width30))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  _payButton() {
    return Positioned(
        bottom: Dimensions.height20,
        child: AppLargeButton(
          text: "Pay all bills",
          textColor: Colors.white,
          onTap: () {
            Get.to(() => PaymentPage());
          },
        ));
  }

  _textContainer() {
    return Stack(
      children: [
        Positioned(
            left: 0,
            top: Dimensions.height100,
            child: Text(
              "My Bills",
              style: TextStyle(
                  fontSize: Dimensions.font70,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF293952)),
            )),
        Positioned(
            left: Dimensions.width40,
            top: Dimensions.height20 * 4,
            child: Text(
              "My Bills",
              style: TextStyle(
                  fontSize: Dimensions.font50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ],
    );
  }
}
