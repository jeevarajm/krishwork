
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'second.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  List<String> currentPin = ["","","",""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();

  var outlineInputBorder= OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(color: Colors.transparent),


);
  final now = DateTime.now();

int pinindex=0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }




  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff002633),
        title: Row(
          children: [
            IconButton(onPressed: () {

              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),

              );
              for(int t= 6;t>0;t--){
                clean(t.toString());

              }
              pinindex=0;


            }, icon:Icon(Icons.settings)),
            Spacer(flex: 15,),
            Container(
              height: 50,
              width: 400,
              decoration: const BoxDecoration(
                color : Color(0xff015574),
                borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              child: TabBar(padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                unselectedLabelColor: Colors.white,
                controller: tabController,
                tabs: [

                  Text('Home'),
                  Text('about us'),
                  Text('Updates'),
                ],
                labelColor: Color(0xff015574),
              ),
            ),
            Spacer(flex: 13),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: tabController,
          children: [


            WebView(
              initialUrl: 'https://krishworks.com/',
            ),
            WebView(
              initialUrl: 'https://krishworks.com/about/',
            ),
            WebView(
              initialUrl: 'https://krishworks.com/updates/',
            )



          ],

        ),

      ),

    );


  }
  clean(String text){
    if(pinindex == 0) {
      pinindex =1;
      setPin(pinindex,text="");
    } else if(pinindex <6) {
      pinindex++;
      setPin(pinindex,text="");
    }

  }
  pinindexsetup(String text){
    if(pinindex == 0)
      pinindex =1;
    else if(pinindex <6)
      pinindex++;
    setPin(pinindex,text);
    currentPin[pinindex - 1]=text;
    String strpin ="";
    currentPin.forEach((e) {
      strpin +=e;
    });
    if(pinindex ==6)
      print(setPin);
  }
  String j="";
  setPin(int n,String text){

    switch(n){
      case 1:
        pinOneController.text=text;
        j=text;

        break;
      case 2:
        pinTwoController.text=text;
        j=j+text;
        break;
      case 3:
        pinThreeController.text=text;
        j=j+text;
        break;
      case 4:
        pinFourController.text=text;
        j=j+text;
        break;
      case 5:
        pinFiveController.text=text;
        j=j+text;
        break;
      case 6:
        pinSixController.text=text;
        j=j+text;
        check(j);
        break;
    }

  }
  check(String j){

    int o=now.day,p=now.year,q=now.month;
    int u=o*p*q;
    int y= u.toString().length;
    String i="";
    if(y!=6){
      int o=6-y;
      String w="";
      for(;o>0;o--){

        w='0'+w;

      }
      i=w+u.toString();
    }else{
      i=u.toString();
    }
    if(j==i){
      Navigator.pop(context);
      Navigator.pop(context);
Navigator.push(context,
MaterialPageRoute(builder: (context)=> SecondRoute())
);
    }
  }


  buildPinRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        GestureDetector(
        onTap: (){
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog2(context),

          );
    },
    child: Container(
      width: 400,
 alignment: Alignment.center,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      PINNumber(
        outlineInputBorder:outlineInputBorder,
        textEditingController: pinOneController,
      ),
      PINNumber(
        outlineInputBorder:outlineInputBorder,
        textEditingController: pinTwoController,
      ),
      PINNumber(
        outlineInputBorder:outlineInputBorder,
        textEditingController: pinThreeController,
      ),
      PINNumber(
        outlineInputBorder:outlineInputBorder,
        textEditingController: pinFourController,

      ),
      PINNumber(
        outlineInputBorder:outlineInputBorder,
        textEditingController: pinFiveController,
      ),
      PINNumber(
        outlineInputBorder:outlineInputBorder,
        textEditingController: pinSixController,

      ),

    ]
    ),

    )
    ),

      ],
    );
  }
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: Center(
        child:Text('Developer Passcode'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPinRow(),

        ],
      ),

      actions: <Widget>[
        FlatButton(
          onPressed: () {

            for(int t= 6;t>0;t--){
              clean(t.toString());

            }
            pinindex=0;
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Clear'),
        ),
      ],
    );
  }
  Widget _buildPopupDialog2(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomLeft,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title:Column(

        children: [

          Container(
            width: 1100,
            height: 50,
            padding: EdgeInsets.only(top:5,bottom: 10),
            decoration: const BoxDecoration(

              color: Color(0xff222324),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Container(
                  width: 70.0,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                        color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("1");

                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


                Container(
                  width: 70.0,
                  height: 60.0,

                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("2");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("3");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("4");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "4",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("5");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "5",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("6");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "6",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("7");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "7",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("8");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "8",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10.0),
                    ),
                    onPressed:(){
                      pinindexsetup("9");
                    } ,

                    height: 10,
                    child: Text(
                      "9",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color:Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed:(){
                      pinindexsetup("0");
                    } ,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(60.0),
                    ),
                    height: 10,
                    child: Text(
                      "0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  PINNumber({required this.textEditingController,required this.outlineInputBorder});

  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
          color: Colors.black
        ),
      ),
    );
  }
}
