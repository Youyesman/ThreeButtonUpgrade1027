import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  double sum = double.parse('${Get.arguments}') * 60000
  +double.parse('${Get.arguments}') * 15000;

  double ofc = double.parse('${Get.arguments}') * 60000;
  double whc = double.parse('${Get.arguments}') * 15000;

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
                  '예상견적 : ${NumberFormat('###,###,###').format(sum).replaceAll(' ', '')}원',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              child: Text(
                  'OCEAN FREIGHT CHARGE :${NumberFormat('###,###,###').format(ofc).replaceAll(' ', '')}원'),
            ),
            Container(
              child: Text(
                  '보세창고료 :${NumberFormat('###,###,###').format(whc).replaceAll(' ', '')}원'),
            ),

          ],
        ),
      ),
    );
  }
}
