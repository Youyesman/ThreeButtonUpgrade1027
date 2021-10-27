import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  double sum = double.parse('${Get.arguments}') * 70 * 1150 + 30000 + 40000;

  double ofc = double.parse('${Get.arguments}') * 70 * 1150;
  double hdc = 30000;
  double doc = 40000;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FERRY 견적 운임'),
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
              child: Text('OCEAN FREIGHT CHARGE :${NumberFormat('###,###,###').format(ofc).replaceAll(' ', '')}원'),
            ),
            Container(
              child: Text('HANDLING :${NumberFormat('###,###,###').format(hdc).replaceAll(' ', '')}원'),
            ),
            Container(
              child: Text('DOCUMENT CHARGE :${NumberFormat('###,###,###').format(doc).replaceAll(' ', '')}원'),
            ),
          ],
        ),
      ),
    );
  }
}
