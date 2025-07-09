import 'package:flutter/material.dart';

//comes the statefulWidget part, where the parts mentioned in here can be modified or transformed into something
 
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  //creating an instance of the class called _HomePage
  //initState(), dispose(), setState() and the mutable logic
  //Without this separation, it would be hard to manage lifecycle and performance efficiently.
  @override
  State<HomePage> createState() => _HomePage(); 
}

class _HomePage extends State<HomePage>{
  
  int count = 0;
  bool showArrow = false;

  //function to increment appropriate pageNum when clicked on next button
  void nextStep(){
    setState(() {
      if (count<3){
        count++;
      }
    });
  }

  void goToStep(int step) {
  if (step != count) {
    setState(() {
      count = step;
    });
  } 
}

  //returns Color obj based on step, the current page should have darker color than the other ones
  Color getStepColor(int step){
    if (step==count){
      return Colors.red;
    }
    else{
      return const Color.fromARGB(255, 245, 137, 135);
    }
  }

  //what should be displayed on the page container based on count values
  String getDescription(){
    switch (count){
      case 1:
        return "Description for page-1";

      case 2:
        return "Description for page-2";

      case 3:
        return "Description for page-3";
      
      default:
        return "";
    }
  }

  //Main Picture of frontend starts from here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HAMNOSIS GENERATOR',
          style: TextStyle(fontFamily: 'poppins', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25)),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        //Outline of the page where everything has to come one below the other
        child: Column(
          children: [
            //first child =>Row : for circles which has to be arranged vertically
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: ()=>goToStep(1),
                  child : StepCircle(num:'1',color:getStepColor(1)),
                ),
                Container(
                  width: 40,
                  height: 2,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: ()=>goToStep(2),
                  child: StepCircle(num:'2',color:getStepColor(2)),
                ),
                Container(
                  width: 40,
                  height: 2,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: ()=>goToStep(3),
                  child: StepCircle(num:'3',color:getStepColor(3)),
                )
              ],
            ),

            const SizedBox(height: 30), //for space

            //second child => Description Box
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    getDescription(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),  
              ),
            ),

            const SizedBox(height: 20,),

            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 160,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: count <= 3 ? nextStep : null,
                  icon: const Text(
                    'NEXT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  label: const Icon(Icons.arrow_forward),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30),
                      side: BorderSide(color: Colors.white,width: 2),
                    )
                  ),

                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//my CustomBuilt widget which is stateless for the Stepcircle widget which is defined above
class StepCircle extends StatelessWidget{

  final String num;
  final Color color;

  const StepCircle({
    super.key,
    required this.num,
    required this.color,
  });



  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: color,
      child: Text(
        num,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
  
}
