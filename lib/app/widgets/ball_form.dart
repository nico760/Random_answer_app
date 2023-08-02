import 'package:flutter/material.dart';
import 'package:random_app/app/screens/random_question.dart';

class BallForm extends StatelessWidget {
  const BallForm({super.key,
  required this.controller,
  });
  
  
  final TextEditingController controller;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Hazme una pregunta'
            ),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 228, 165, 186), 
            ),
            onPressed: (){
              if (controller.value.text != ''){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (_) => RandomQuestion()),);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 5.0,
                              backgroundColor: Colors.pink.shade100,
                              content: const Text(
                                'Aún no preguntas nada',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
            }, 
            child: const Text('Conoce la respuesta', style: TextStyle(fontSize: 16),))
        ],
      ),
    );
  }
}