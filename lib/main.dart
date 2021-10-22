import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threebuttons/pages/second_page.dart';
import 'package:threebuttons/pages/third_page.dart';


void main() {
  runApp(MyApp());
}

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

String cbmvalue = '';


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: TextField(
                onChanged: (text){
                  setState(() {
                    cbmvalue = text;
                  });
                },

                style: TextStyle(color:Colors.red),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'CBM을 입력하세요',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ) ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('위해-인천 FERRY'),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
            onPressed: (){
              Get.toNamed("/SecondPage" , arguments: cbmvalue);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('FERRY 견적 페이지 입니다.'),
                duration: Duration(seconds: 2),
              ));
            },
          ),
          ElevatedButton(
            child: Text('상해-인천 LCL'),

            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: (){
              Get.toNamed("/ThirdPage" , arguments: cbmvalue);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('LCL 견적 페이지 입니다.',),
                duration: Duration(seconds: 2),
              ));
            },
          ),
          ElevatedButton(
            child: Text('3번 버튼'),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('3번 버튼을 클릭했습니다.'),
                duration: Duration(milliseconds: 10),
              ));
            },
          ),
        ],
      ),
    );
  }
}


