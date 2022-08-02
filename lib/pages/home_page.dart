import 'package:bmi_calculator_app/pages/result_page.dart';
import 'package:bmi_calculator_app/values/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String male = "MALE";
  static const String female = "FEMALE";
  late String genderValue = '';
  double heightValue = 0;
  int weightValue = 30;
  int ageValue = 18;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: size.width / 6,
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('BMI calculator'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: AppColors.backgroundColor,
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GenderContainer(
                          screenSize: size,
                          title: "FEMALE",
                          icon: const Icon(Icons.female),
                          onPressed: () {
                            setState(() {
                              genderValue = female;
                            });
                          },
                          gender: genderValue,
                          buttonGender: female,
                        ),
                        GenderContainer(
                          screenSize: size,
                          title: "MALE",
                          icon: const Icon(Icons.male),
                          onPressed: () {
                            setState(() {
                              genderValue = male;
                            });
                          },
                          gender: genderValue,
                          buttonGender: male,
                        ),
                      ],
                    ),
                    Container(
                        height: size.height / 4.5,
                        width: size.width * 0.85,
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("HEIGHTcm",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.textColor)),
                              Text('${heightValue.toInt()}',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: AppColors.textColor)),
                              Slider(
                                value: heightValue,
                                min: 0,
                                max: 200,
                                onChanged: (value) {
                                  setState(() {
                                    heightValue = value;
                                  });
                                },
                              ),
                            ])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdjustInfo(
                              screenSize: size,
                              title: "WEIGHT",
                              value: weightValue,
                              onIncrease: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                              onDecrease: () {
                                setState(() {
                                  weightValue--;
                                });
                              }),
                          AdjustInfo(
                              screenSize: size,
                              title: "AGE",
                              value: ageValue,
                              onIncrease: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                              onDecrease: () {
                                setState(() {
                                  ageValue--;
                                });
                              }),
                        ]),
                  ]),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: Material(
                color: AppColors.secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: InkWell(
                    highlightColor: AppColors.textColor,
                    splashColor: AppColors.textColor,
                    hoverColor: AppColors.textColor,
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  gender: genderValue,
                                  height: heightValue.toInt(),
                                  weight: weightValue,
                                  age: ageValue)));
                    },
                    child: Container(
                      width: size.width * 0.9,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          // color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Text("Calculate".toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenderContainer extends StatelessWidget {
  final Size screenSize;
  final String title;
  final Icon icon;
  final String gender;
  final Function onPressed;
  final String buttonGender;

  const GenderContainer({
    Key? key,
    required this.screenSize,
    required this.title,
    required this.icon,
    required this.gender,
    required this.buttonGender,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: screenSize.width * 0.35,
        height: screenSize.width * 0.35,
        decoration: BoxDecoration(
            color: gender == buttonGender ? AppColors.primaryColor : null,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(icon.icon, color: AppColors.textColor, size: 50),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
        ]),
      ),
    );
  }
}

class AdjustInfo extends StatelessWidget {
  final Size screenSize;
  final String title;
  int value;
  final Function onDecrease;
  final Function onIncrease;

  AdjustInfo(
      {Key? key,
      required this.screenSize,
      required this.title,
      required this.value,
      required this.onDecrease,
      required this.onIncrease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenSize.width * 0.35,
        height: screenSize.width * 0.35,
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  onDecrease();
                },
                padding: EdgeInsets.zero,
                icon: const Text('-',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 30,
                        height: 1,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Text(value.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                )),
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: InkWell(
                  onTap: () {
                    onIncrease();
                  },
                  child: const Text("+",
                      style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 30,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
          ])
        ]));
  }
}
