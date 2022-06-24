
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score,{Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

 Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Congratulation', style: TextStyle(color: Colors.white,
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            ),),

const SizedBox(height: 30,),

  const Text('Your Score is', style: TextStyle(color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w400,
            ),),

 const SizedBox(height: 50,),

 Text("${widget.score}", style: const TextStyle(color: Colors.orange,
 fontSize: 85.0,
 fontWeight: FontWeight.bold,

 ),),
 
 const SizedBox(height: 60,),

 MaterialButton(onPressed: (){

 Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MyHomePage()
          )

  );
 },
 color: Colors.orange,
 elevation: 0.0,
 textColor: Colors.white,
 child: const Text('Repeat the Quizz'),
 )

          ],
        ),
      ),
      
    );
  }
}