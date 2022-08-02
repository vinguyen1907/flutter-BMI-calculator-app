import 'package:bmi_calculator_app/values/app_colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String gender;
  final int height;
  final int weight;
  final int age;

  const ResultPage({
    Key? key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    late String commend;

    double calculateBMI() {
      double bmi = weight / ((height / 100) * 2);

      if (bmi < 18.5) {
        commend = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 25) {
        commend = 'Normal';
      } else if (bmi >= 25 && bmi < 30) {
        commend = 'Overweight';
      } else {
        commend = 'Obese';
      }

      return bmi;
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textColor,
                ),
              )),
          centerTitle: true,
          title: const Text('BMI RESULT',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Container(
          color: AppColors.backgroundColor,
          width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('YOUR INFO',
                            style: TextStyle(
                                fontSize: 32,
                                color: AppColors.lightGreen,
                                fontWeight: FontWeight.bold)),
                        Text('Your gender: ${gender.toUpperCase()}',
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 20,
                            )),
                        Text('Your weight: $weight',
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 20,
                            )),
                        Text('Your height: $height',
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 20,
                            )),
                        Text('Your age: $age',
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 20,
                            )),
                        const Text('BMI:',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(calculateBMI().toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 80,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold)),
                        Text(commend,
                            style: const TextStyle(
                              fontSize: 20,
                              color: AppColors.textColor,
                            )),
                      ]),
                )
              ]),
        ));
  }
}
