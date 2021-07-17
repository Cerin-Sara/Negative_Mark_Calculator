import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  num total;
  Result({@required this.total});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF21243D),
      appBar: AppBar(
          backgroundColor: Color(0xFF21243D),
          title: Text('THE RESULT',
            style: TextStyle(
              color: Colors.white,
              fontWeight:FontWeight.w700,
            ),)
      ),
      body: Center(
        child: Container(
            width: width,
            height: width*.75,
            decoration: BoxDecoration(
                color: Color(0xFF373B5A),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2,2),
                    blurRadius: 20,
                  )
                ]
            ),
            margin: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('The Total Marks:',
                    style: TextStyle(
                      color: total>0?Colors.pink:Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,

                    ),
                  ),
                  Text(total.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        color: Colors.white,
                      )
                  ),
                ]
            )
        ),
      ),
      bottomNavigationBar:
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            color: Color(0xFF88E1F2),
          ),
          height: width/6 ,
          child: Center(
            child: Text('Back to Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),),
          ),
        ),
      ),
    );
  }
}