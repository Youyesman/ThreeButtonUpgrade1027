import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AirPage extends StatefulWidget {
  const AirPage({Key? key}) : super(key: key);

  @override
  State<AirPage> createState() => _AirPageState();
}

class _AirPageState extends State<AirPage> {
  double sum = double.parse('${Get.arguments}') *1200 +30000;
  double afc = double.parse('${Get.arguments}') *1200;
  double hdc = 30000;
  double ccf = double.parse('${Get.arguments}') *1200 * 0.05;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LCL 견적 운임'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                  '예상견적 : ${NumberFormat('###,###,###').format(sum).replaceAll(
                      ' ', '')}원',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              child: Text(
                  'AIR FREIGHT CHARGE :${NumberFormat('###,###,###')
                      .format(afc)
                      .replaceAll(' ', '')}원'),
            ),
            Container(
              child: Text(
                  '취급수수료 :${NumberFormat('###,###,###').format(hdc).replaceAll(
                      ' ', '')}원'),
            ),
            Container(
              child: Text(
                  '착지수수료 :${NumberFormat('###,###,###').format(ccf).replaceAll(
                      ' ', '')}원'),
            ),

          ],

        ),
      ),
    );
  }
}
