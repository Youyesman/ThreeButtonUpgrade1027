import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:threebuttons/pages/air_page.dart';
import 'package:threebuttons/pages/second_page.dart';
import 'package:threebuttons/pages/third_page.dart';

void main() {
  runApp(MyApp());
}

// 1027 sum format 변경
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '3 buttons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      getPages: [
        GetPage(name: '/SecondPage', page: () => SecondPage()),
        GetPage(name: '/ThirdPage', page: () => ThirdPage()),
        GetPage(name: '/AirPage', page: () => AirPage()),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자동견적시스템!'),
        centerTitle: true,
      ),
      body: ThreeButtons(),
    );
  }
}

class ThreeButtons extends StatefulWidget {
  const ThreeButtons({Key? key}) : super(key: key);

  @override
  State<ThreeButtons> createState() => _ThreeButtonsState();
}

class _ThreeButtonsState extends State<ThreeButtons> {
  // var cbmController = TextEditingController();
  // var weightController = TextEditingController();
  final cbmcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final numberformat = new NumberFormat.simpleCurrency(locale: "ko_KR",name: "",decimalDigits: 0);
  int one = 1;
  String sum1 = '';
  String sum2 = '';
  String sum3 = '';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: TextField(
                  autofocus: true,
                  controller: cbmcontroller,

                  // onChanged: (text){
                  //   setState(() {
                  //     cbmvalue = text;
                  //   });
                  // },

                  style: TextStyle(color: Colors.red),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'CBM을 입력하세요',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'CBM'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: TextField(
                  controller: weightcontroller,
                  // onChanged: (text){
                  //   setState(() {
                  //     cbmvalue = text;
                  //   });
                  // },

                  style: TextStyle(color: Colors.red),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '무게(KG)을 입력하세요',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'KG'),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (double.parse(cbmcontroller.text) < 1) {
                    double result1 = 70 * 1200 + 30000 + 40000;
                    double result2 = 60000 + 15000;
                    sum1 = '$result1' ;
                    sum2 = '$result2' ;
                  } else {
                    double result1 = double.parse(cbmcontroller.text) * 70 * 1200 + 30000 + 40000;
                    double result2 = double.parse(cbmcontroller.text) * 60000 + double.parse(cbmcontroller.text) * 15000;
                    sum1 = '$result1' ;
                    sum2 = '$result2' ;
                  }
                  if (double.parse(weightcontroller.text) < 45) {
                    double result3 = double.parse(weightcontroller.text) * 5*1200;
                    sum3 = '$result3';
                  } else if (double.parse(weightcontroller.text) < 100) {
                    double result3 = double.parse(weightcontroller.text) * 4*1200;
                    sum3 = '$result3';
                  } else if (double.parse(weightcontroller.text) < 300) {
                    double result3 = double.parse(weightcontroller.text) * 3*1200;
                    sum3 = '$result3';
                  } else if (double.parse(weightcontroller.text) < 500) {
                    double result3 =  double.parse(weightcontroller.text) * 2*1200;
                    sum3 = '$result3';
                  } else {
                    double result3 =  double.parse(weightcontroller.text) * 1*1200;
                    sum3 = '$result3' ;
                  }
                });
              },
              child: Text('견적보기')),
          Text('FERRY 예상금액 : $sum1원'),
          ElevatedButton(
            child: Text('FERRY 견적 상세보기'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
            onPressed: () {
              if (double.parse(cbmcontroller.text) <= one) {
                Get.toNamed("/SecondPage", arguments: 1);
              } else {
                Get.toNamed("/SecondPage", arguments: cbmcontroller.text);
              }

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('FERRY 견적 페이지 입니다.'),
                duration: Duration(seconds: 2),
              ));
            },
          ),
          Text('LCL 예상금액 : $sum2원'),
          ElevatedButton(
            child: Text('LCL 견적 상세보기'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              if (double.parse(cbmcontroller.text) <= one) {
                Get.toNamed("/ThirdPage", arguments: 1);
              } else {
                Get.toNamed("/ThirdPage", arguments: cbmcontroller.text);
              }

              Get.toNamed("/ThirdPage", arguments: cbmcontroller.text);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'LCL 견적 페이지 입니다.',
                ),
                duration: Duration(seconds: 2),
              ));
            },
          ),
          Text('AIR 예상금액 : $sum3원'),
          ElevatedButton(
            child: Text('AIR 견적 상세보기'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber)),
            onPressed: () {
              if (double.parse(weightcontroller.text) <= 45) {
                Get.toNamed("/AirPage",
                    arguments: double.parse(weightcontroller.text) * 5);
              } else if (double.parse(weightcontroller.text) <= 100) {
                Get.toNamed("/AirPage",
                    arguments: double.parse(weightcontroller.text) * 4);
              } else if (double.parse(weightcontroller.text) <= 300) {
                Get.toNamed("/AirPage",
                    arguments: double.parse(weightcontroller.text) * 3);
              } else if (double.parse(weightcontroller.text) <= 500) {
                Get.toNamed("/AirPage",
                    arguments: double.parse(weightcontroller.text) * 2);
              } else {
                Get.toNamed("/AirPage",
                    arguments: double.parse(weightcontroller.text) * 1);
              }


              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('AIR 견적 페이지 입니다.'),
                duration: Duration(seconds: 2),
              ));
            },
          ),
        ],
      ),
    );
  }
}
