import 'package:flutter/material.dart';


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