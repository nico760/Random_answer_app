import 'package:flutter/material.dart';
import 'package:random_app/app/widgets/animated_ball.dart';
import 'dart:math';

class RandomQuestion extends StatelessWidget {
  RandomQuestion({super.key,
  });
  
  final List<String> _messages = [
    'No puedo predecirlo',
    'Claramente no',
    'Obvio sí'
  ];

  String _getMessage(){
    Random random = Random();
    return _messages[random.nextInt(3)];
  }

  @override
  Widget build(BuildContext context) {
    double radiusCircles = MediaQuery.of(context).size.width/2;

    String screenMessage = _getMessage();
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 217, 236, 252),
      body: SingleChildScrollView(
        child: Stack(
          children: [Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  const EdgeInsets.fromLTRB(0,70,0,0),
                  child: AnimatedBall(radius: radiusCircles*0.5),
                ),
                CircleAvatar(radius: radiusCircles*0.95, backgroundColor: const Color.fromARGB(255, 220, 188, 228),)
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height: radiusCircles*1.25,),
              Text(screenMessage, style: const TextStyle(color: Colors.black, 
                fontSize: 20,
                fontWeight: FontWeight.bold),),
              const SizedBox(height: 15,),
              ElevatedButton(onPressed: (){Navigator.pop(context);}, 
                child:  const Text('Volver a preguntar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
            ],),
          )
          ]
        ),
      ),
    );
  }
}