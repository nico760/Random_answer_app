import 'package:flutter/material.dart';
import 'package:random_app/app/screens/random_question.dart';

import '../widgets/animated_ball.dart';
import '../widgets/ball_form.dart';
import 'package:sensors_plus/sensors_plus.dart';

class BolaApp extends StatefulWidget {
  const BolaApp({super.key});

  @override
  State<BolaApp> createState() => _BolaAppState();
}

class _BolaAppState extends State<BolaApp> {
  final question = TextEditingController();
  

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      if ((event.x.abs() > 20.0 || 
            event.y.abs() > 20.0 || // el abs para los valores negativos
            event.z.abs() > 20.0) 
            ) {Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (_) => RandomQuestion()),);
    }
  });
    
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double radiusCircles = MediaQuery.of(context).size.width/2;
    
    
    return  Scaffold(
      
      backgroundColor:  const Color.fromARGB(255, 235, 220, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,10),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    AnimatedBall(radius: radiusCircles*0.25,),
                    const SizedBox(height: 20,),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 225, 199, 233), Color.fromARGB(255, 235, 220, 240)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                              ),
                            ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent, //Así se muestra el color del gradiente
                          radius: radiusCircles*0.9,),
                      ),
                      Positioned(
                        top: screenWidth/3,
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 199, 158, 215), 
                          radius: radiusCircles*0.9,))
                    ],) 
                  ],
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: radiusCircles,),
                BallForm(controller: question),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}