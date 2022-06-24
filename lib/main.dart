import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_list.dart';
import 'package:quiz_app/screen/result_screen.dart';

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
      home:  const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);

final PageController? _controller = PageController(initialPage: 0);
bool isPress = false;
Color isTrue = Colors.green;
Color isWrong = Colors.red;
Color btnColor = const Color(0xFF117eeb);
int score = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
       body: Padding(padding: const EdgeInsets.all(18.0),
       child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller!,
        onPageChanged: (page){
         setState(() {
           isPress = false;
         });
        },
        itemCount: question.length,
        itemBuilder: (context, index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text("Question ${index + 1} / ${question.length}",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300,
                fontSize: 23,
 ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 1.0,
                height: 8.0,
              ),
              const SizedBox(height: 10,),
              Text(question[index].question!, style: const TextStyle(
               color: Colors.white,
               fontSize: 20,

 ),),
 const SizedBox(height: 35,),
 for(int i=0;i<question[index].answer!.length;i++)
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: MaterialButton(
    shape: const StadiumBorder(),
    color: isPress ? question[index].answer!.entries.toList()[i].value ? isTrue : isWrong : secondColor ,
    onPressed: isPress ? (){} : (){
      setState(() {
        isPress = true;
      });
      if(question[index].answer!.entries.toList()[i].value){
        score=score+10;
        print(score);
      }
   },
   child: Text(question[index].answer!.keys.toList()[i], style: const TextStyle(color: Colors.white),),

   ),
 ),

 const SizedBox(height: 30,),
 Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
OutlinedButton(
onPressed: isPress ? index + 1 == question.length ? () {

Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ResultScreen(score)
          )

  );

// Navigator.push(context, MaterialPageRoute(
//   builder: (context) =>  ResultScreen(score), ));
  } 
  : (){
    _controller!.nextPage(
      duration: const Duration(milliseconds: 500), 
        curve: Curves.linear);
        setState(() {
          isPress = false;
        });
  }
   : null ,
   style : OutlinedButton.styleFrom(
    shape: const StadiumBorder(),
    side: const BorderSide(color: Colors.orange, width: 2.0),
    
   ),
 child: Text( 
  index+1 == question.length ? 'View Marks' 
  : 'Next Question' , 
  style: const TextStyle(color: Colors.white),),
 ),
  ],
 )
 
            ],
          );
       },
       ),
       ),
    );
  }
}
