
import 'dart:ui';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {

  SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement context
  BuildContext get context => throw UnimplementedError();

  @override
  void deactivate() {
    // TODO: implement deactivate
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  // TODO: implement mounted
  bool get mounted => throw UnimplementedError();

  @override
  void reassemble() {
    // TODO: implement reassemble
  }



  @override
  // TODO: implement widget
  StatefulWidget get widget => throw UnimplementedError();
}

class _SecondRouteState extends State<SecondRoute> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }
  List<Widget> container =[
    Container(
      width: 200,
      height: 200,
      color: Colors.red,
      alignment: Alignment.center,
      child: Row(
        children: [
          WebView(
            initialUrl: 'https://krishworks.com/',
          ),

        ],
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
backgroundColor: Color(0xff002633),
        title: Row(
          children: [
            MaterialButton(
              onPressed:(){
                Navigator.pop(context);

              } ,
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(60.0),
              ),
              height: 10,
              child: Text(
                "close",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17 * MediaQuery.of(context).textScaleFactor,
                  color:  Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed:(){
              } ,
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(60.0),
              ),
              height: 10,
              child: Text(
                "setting",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                  color:  Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )

      ),

      body:navigator(),
    );
  }
}
class navigator extends StatefulWidget {
  const navigator({Key? key}) : super(key: key);

  @override
  State<navigator> createState() => _navigatorState();
}
int _selectedIndex = 0;
class _navigatorState extends State<navigator> {

  List<Widget> containers=[
    Container(

      child:WebView(
        initialUrl: 'https://krishworks.com/gallery/',
      ),

    ),
    Container(
      child: Container(
        child: WebView(
          initialUrl: 'https://krishworks.com/contact/',
        ),
      ),
    )




  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(

            groupAlignment: -1,
            labelType: NavigationRailLabelType.all,
         unselectedLabelTextStyle: TextStyle(
         color: Color(0xff002633)
              ),
            selectedLabelTextStyle: TextStyle(
                color: Color(0xffFFAD33)
          ),
          onDestinationSelected: (index) {
            setState(() {

              _selectedIndex = index;
            });
          },

            backgroundColor: Colors.white,
          destinations:  [
            NavigationRailDestination(

              icon: SizedBox.shrink(),
              label:  SizedBox(
                  width: 200,
                  child: Text('Gallery')
              ),


            ),
            NavigationRailDestination(
              icon: SizedBox.shrink(),
              label: SizedBox(
width: 200,

                child: Text('Contact Us')
              )
            ),



          ],selectedIndex: _selectedIndex
        ),
        VerticalDivider(thickness: 0, width: 10),
        // This is the main content.
        Expanded(
          child: Center(
            child: containers[
              _selectedIndex
            ],
          ),
        )
      ],
    );
  }
}
