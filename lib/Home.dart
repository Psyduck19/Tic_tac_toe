import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ohTurn = true; // the first player is o
  List <String> display_X_or_O = ['','','','','','','','','',];

  int oscore = 0;
  int xscore = 0;
  int filled_boxes =0;
  @override
  Widget build(BuildContext context) {
    return

      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF0F0C29),
              const Color(0xFF302B63),
              const Color(0xFF24243E),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),




        child: Scaffold(

          backgroundColor: Colors.transparent,


          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('X', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)),
                                Text(xscore.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('O',style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)),
                                Text(oscore.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),

                ),
              ),
              Expanded(
                flex:4,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: (){
                          tapped(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey)
                            ),
                            child: Center(

                              child: Text(display_X_or_O[index],
                                style: TextStyle(color: Colors.white, fontSize: 40 ),),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
              Expanded(child: Container(
                child: Center(child: Column(
                  children: [
                    Text('TIC TAC TOE', style: TextStyle(color:Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),),
                    SizedBox(height: 60,),
                  ],
                ),


                ),

              ),
              )
            ],
          ),


        ),
      );

  }







  void tapped(int index){

    setState(() {
      if(ohTurn && display_X_or_O[index] == ''){
        display_X_or_O[index] = 'o';
        filled_boxes += 1;
      }
      else if(!ohTurn && display_X_or_O[index] == '')
      {
        display_X_or_O[index] = 'x';
        filled_boxes += 1;
      }

      ohTurn = !ohTurn;
      checkwinner();



    });




  }

  void checkwinner(){
    if(display_X_or_O[0] == display_X_or_O[1] &&
        display_X_or_O[0]== display_X_or_O[2] &&
        display_X_or_O[0] != ''){
      show_winner(display_X_or_O[0]);

    }

    if(display_X_or_O[3] == display_X_or_O[4] &&
        display_X_or_O[3]== display_X_or_O[5] &&
        display_X_or_O[3] != ''){
      show_winner(display_X_or_O[3]);

    }

    if(display_X_or_O[6] == display_X_or_O[7] &&
        display_X_or_O[6]== display_X_or_O[8] &&
        display_X_or_O[6] != ''){
      show_winner(display_X_or_O[6]);

    }

    if(display_X_or_O[0] == display_X_or_O[3] &&
        display_X_or_O[0]== display_X_or_O[6] &&
        display_X_or_O[0] != ''){
      show_winner(display_X_or_O[0]);

    }

    if(display_X_or_O[1] == display_X_or_O[4] &&
        display_X_or_O[1]== display_X_or_O[7] &&
        display_X_or_O[1] != ''){
      show_winner(display_X_or_O[1]);

    }

    if(display_X_or_O[2] == display_X_or_O[5] &&
        display_X_or_O[2]== display_X_or_O[8] &&
        display_X_or_O[2] != ''){
      show_winner(display_X_or_O[2]);

    }

    if(display_X_or_O[0] == display_X_or_O[4] &&
        display_X_or_O[4]== display_X_or_O[8] &&
        display_X_or_O[0] != ''){
      show_winner(display_X_or_O[0]);

    }

    if(display_X_or_O[2] == display_X_or_O[4] &&
        display_X_or_O[2]== display_X_or_O[6] &&
        display_X_or_O[2] != ''){
      show_winner(display_X_or_O[2]);

    }

    else if(filled_boxes == 9 &&

        !(display_X_or_O[0] == display_X_or_O[1] &&
            display_X_or_O[0]== display_X_or_O[2] &&
            display_X_or_O[0] != '') &&

        !(display_X_or_O[3] == display_X_or_O[4] &&
            display_X_or_O[3]== display_X_or_O[5] &&
            display_X_or_O[3] != '') &&

        !(display_X_or_O[6] == display_X_or_O[7] &&
            display_X_or_O[6]== display_X_or_O[8] &&
            display_X_or_O[6] != '') &&

        !(display_X_or_O[0] == display_X_or_O[3] &&
            display_X_or_O[0]== display_X_or_O[6] &&
            display_X_or_O[0] != '') &&

        !(display_X_or_O[1] == display_X_or_O[4] &&
            display_X_or_O[1]== display_X_or_O[7] &&
            display_X_or_O[1] != '') &&

        !(display_X_or_O[2] == display_X_or_O[5] &&
            display_X_or_O[2]== display_X_or_O[8] &&
            display_X_or_O[2] != '') &&

        !(display_X_or_O[0] == display_X_or_O[4] &&
            display_X_or_O[4]== display_X_or_O[8] &&
            display_X_or_O[0] != '') &&

        !(display_X_or_O[2] == display_X_or_O[4] &&
            display_X_or_O[2]== display_X_or_O[6] &&
            display_X_or_O[2] != '')



    ){
      show_draw();
    }

  }

  void show_draw(){

    showDialog(
        barrierDismissible: false,
        context: context,
        builder : (BuildContext context){
          return AlertDialog(
            title: Text("Its a Draw!"),
            actions: [

              ElevatedButton(onPressed: (){
                clear_board();
                Navigator.of(context).pop();
              },
                child: Text('Play Again!'),)
            ],

          );
        }

    );


  }

  void show_winner(String winner){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder : (BuildContext context){
          return AlertDialog(
            title: Text('Winner is $winner'),
            actions: [

              ElevatedButton(onPressed: (){
                clear_board();
                Navigator.of(context).pop();
              },
                child: Text('Play Again!'),)
            ],

          );
        }

    );
    if (winner =='o'){
      oscore += 1;
    }else if( winner == 'x'){
      xscore += 1;
    }


  }

  void clear_board(){
    setState(() {
      for(int i= 0; i < 9; i++){
        display_X_or_O[i] = '';
      }

    });
    filled_boxes = 0;
  }


}
