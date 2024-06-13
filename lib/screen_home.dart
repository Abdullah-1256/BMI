
import 'package:BMI/constants.dart';
import 'package:BMI/model/bmi.dart';
import 'package:flutter/material.dart';

import 'result_screen.dart';
import 'widgets/counter_widget.dart';
import 'widgets/genderWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size mediaQuery;
  double sliderValue = 170;
  bool male = false;
  bool female = false;
  int weight = 0;
  int years = 0;
  double height = 0;

   late UserValue userValue;

  double result = 0;
  String classification = "";
  String description = "";

  void calculateResult() {
    height =  (sliderValue * sliderValue) / 10000;
    result = weight / height;
    if (result < 16) {
      classification = "Severe Thinness";
      description = "Need to improve diet";
    } else if (result >= 16 && result <= 17) {
      classification = "Moderate Thinness";
      description = "Need to improve diet";
    } else if (result < 18.5) {
      classification = "Mild Thinness";
      description = "you are little healthy";
    }else if (result >= 18.5 && result < 24.9) {
      classification = "Normal";
      description = "You are Normal";
    } else if (result >= 25 && result < 29.9) {
      classification = "Overweight";
      description = "You have overweight than your height";
    } else {
      classification = "Obese Class";
      description = "Unhealthy";
    }
    userValue = UserValue(result: result, classification: classification, description: description);

  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
          color: Constants.primary,
          width: double.infinity,
          height: mediaQuery.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Gender Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderWidget(
                    isSelect: male,
                      icon: Icons.male,
                      title: "Male",
                      width: (mediaQuery.width / 2) - 35,
                      height: (mediaQuery.width / 2) - 50,
                      onPress: () {
                        setState(() {
                          if(male == false || female == false){
                            male = true;
                            female = false;
                          }else{
                            male = false;
                          }
                        });
                      }),
                  const SizedBox(width: 30),
                  GenderWidget(
                    isSelect: female,
                      icon: Icons.female,
                      title: "female",
                      width: (mediaQuery.width / 2) - 35,
                      height: (mediaQuery.width / 2) - 50,
                      onPress: () {
                        setState(() {
                          if(female == false || male == false){
                            female = true;
                            male = false;
                          }else{
                            female = false;
                          }
                        });

                      }),
                ],
              ),
              const SizedBox(height: 30),
              //Slider
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: (mediaQuery.width / 2) - 10,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Constants.secondary,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "height",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: sliderValue.toStringAsFixed(0),
                        style: const TextStyle(
                            fontSize: 36,
                            color: Constants.text,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: "cm",
                        style: TextStyle(fontSize: 16, color: Colors.grey[200]),
                      ),
                    ])),
                    Slider(
                      min: 0,
                      max: 300,
                      divisions: 300,
                      value: sliderValue,
                      activeColor: Constants.accent,
                      onChanged: (value) {
                        setState(
                          () {
                            sliderValue = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //Weight and Age

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CounterWidget(
                    title: "Weight",
                    width: (mediaQuery.width / 2) - 35,
                    height: (mediaQuery.height / 3) - 50,
                    value: "$weight",
                    unit: "Kg",
                    onPressAdd: () {
                      setState(() {
                          weight++;
                      });
                    },
                    onPressMinus: () {
                      setState(() {
                        if(weight == 0){
                          weight = 0;
                        }else{
                          weight--;
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 30),
                  CounterWidget(
                    title: "AGE",
                    width: (mediaQuery.width / 2) - 35,
                    height: (mediaQuery.height / 3) - 50,
                    value: "$years",
                    unit: "Years",
                    onPressAdd: () => setState(() {
                      years++;
                    }),
                    onPressMinus: () {
                      setState(() {
                        if(years == 0){
                          years = 0;
                        }else{
                          years--;
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.infinite,
                      backgroundColor: Constants.accent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )),
                  onPressed: () {
                    calculateResult();
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) =>
                    ResultScreen(user: userValue,),
                    ));
                  },
                  child: Text(
                    "Calculate".toUpperCase(),
                    style: const TextStyle(color: Constants.text,fontSize: 35,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
