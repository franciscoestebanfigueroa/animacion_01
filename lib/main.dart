import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
double x=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        appBar: AppBar(),
       body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: MyProgres(porcentaje: x)          

        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
           setState(() {
           x+=10;
           if(x>100){x=0;}
             
           });
           })
        ),
       
        
        //floatingActionButton: FloatingActionButton(onPressed: (){})),
      
    );
  }
}



class MyProgres extends StatefulWidget {
  double porcentaje;

   MyProgres({super.key, required this.porcentaje});

  @override
  State<MyProgres> createState() => _MyProgresState();
}

class _MyProgresState extends State<MyProgres> with SingleTickerProviderStateMixin{
  
  late AnimationController controller;
  
  @override
  void initState() {
    
    controller= AnimationController(vsync: this,duration:const  Duration(milliseconds: 400));
    controller.addListener(() { 
    
      
    
      print("controler${controller.value}");
    });
    
    super.initState();
  }

@override
  void dispose() {
    controller.dispose();
    
    super.dispose();
  }
  
  
  
  
  
  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    return Center(
       child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
      
            width: 200,
            height: 200,
            child: CustomPaint(
              child: Center(child: Text("${((widget.porcentaje)*controller.value).ceil()}",style: TextStyle(fontSize: 20))),
             
              painter: _ProgresPainter(porcentaje:(widget.porcentaje)*controller.value),),
         
         
          );
        },
       ),
      
        
    );
  }
}




class _ProgresPainter extends CustomPainter {
double porcentaje;

_ProgresPainter({required this.porcentaje});
  
  @override
  void paint(Canvas canvas, Size size) {


    Paint paint = Paint();
    paint
    ..color=Colors.red
    ..style=PaintingStyle.stroke
    ..strokeWidth=4;

  
  

 final Offset center=Offset(size.width/2, size.height/2);
 Rect rect =Rect.fromCircle(center: center,radius: min(size.width/2, size.height/2));
 
  //canvas.drawCircle(
  //center,
  //size.width/2,
  //paint);
 

 canvas.drawArc(
  rect,
  pi,
  2*pi*porcentaje/100,//sweep barrido
  false,
  paint);
 
  }

  @override
  bool shouldRepaint(_ProgresPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_ProgresPainter oldDelegate) => false;
}