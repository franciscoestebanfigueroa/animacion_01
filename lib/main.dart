import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        //appBar: AppBar(),
        body:  Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,

          child: CustomPaint(
            painter: _MyPainter(),
          ),
        ),
      ),
    );
  }
}



class _MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
const Gradient gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,

  colors: [Colors.black,
  Colors.yellow,
  Colors.orange]);

Rect rect = Rect.fromCenter(center: Offset(size.width*.36, size.height*.54),width: 10,height: 10) ;
    final paint = Paint();//lapiz
    paint.shader=gradient.createShader(rect);
    paint.color=Colors.blue;
    paint.strokeWidth=20;
    paint.style=PaintingStyle.stroke;// punta
    paint.style=PaintingStyle.fill;//rellena


    final paint1 = Paint();//lapiz
    paint1.color=Colors.blue;
    paint1.strokeWidth=20;
    paint1.style=PaintingStyle.stroke;// punta
    paint1.style=PaintingStyle.fill;//rellena

final Path path = Path(); //ruta del lapiz
path.lineTo(size.width, 100.0);
path.lineTo(size.width*.5, size.height*.3);
path.lineTo(size.width*.75,size.height*.4);
path.lineTo(size.width*.5, size.height*.5);
path.quadraticBezierTo(size.width*.15, size.height*.29,0, size.height);//los primeros puntos es el punto de estirar y el ultimo es el punto final
path.moveTo(size.width*.8, size.height*.8);

Rect rect0 = Rect.fromCenter(center: Offset(size.width*.36, size.height*.54),width: 100,height: 100) ;
path.arcTo(rect0, 0, pi*1.99, true);//rec rectangulo de trabajo,angulo de inicio que se puede usar para rotar,el arco que dibuja en radianes
Rect rect2 = Rect.fromCenter(center: Offset(size.width*.19, size.height*.70),width: 60,height: 60) ;
path.arcTo(rect2, 0, pi*1.99, true);

Rect rect3 = Rect.fromCenter(center: Offset(size.width*.09, size.height*.85),width: 30,height: 30) ;
path.arcTo(rect3, 0, pi*1.99, true);
canvas.drawPath(path,paint1);

Rect rect4 = Rect.fromCenter(center: Offset(size.width*.05, size.height*.95),width: 15,height: 15) ;
path.arcTo(rect4, 0, pi*1.99, true);

canvas.drawPath(path,paint);

  }

  @override
  bool shouldRepaint(_MyPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_MyPainter oldDelegate) => false;
}



class _Cuadrado extends StatefulWidget {
  const _Cuadrado({super.key});


  @override
  State<_Cuadrado> createState() => __CuadradoState();
}

class __CuadradoState extends State<_Cuadrado> with SingleTickerProviderStateMixin{
 late AnimationController controller;
  late Animation<double> animation;

@override
void initState() { 
  controller = AnimationController(vsync: this,duration: Duration(milliseconds: 4000));

 animation = Tween(begin: 0.0,end: 9.0).animate(controller);
controller.forward();
  super.initState();
}



@override
  void dispose() {
controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation, 
      builder: ( context,_){
        return  Transform.rotate(
          angle: controller.value,
          child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
              ),
        );});
  }
}