import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/RESULT.dart';

void main() {
  runApp(MaterialApp(
    title: 'TestApp',
    home: Test(),
  ));
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController _controller1,_controller2,_controller3,_controller4, _controller5;
  num _total=0;
  num _totalQues=0;
  num _attQues=0;
  num _correctAns=0;
  num _mark=0;
  num _negMark=0;
  num _wrongans=0;

  void _calculate(){
    _wrongans= _attQues-_correctAns;
    _total=(_correctAns*_mark)-(_wrongans*_negMark);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF21243D),
          appBar: AppBar(
              backgroundColor: Color(0xFF21243D),
              title: Text('MARK CALCULATOR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.w700,
                ),)
          ),
          body: ListView(
            children: [Container(
              height: height/1.2,
              decoration: BoxDecoration(
                  color: Color(0xFF373B5A),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5,5),
                      color: Colors.black,
                      blurRadius: 10,
                    )
                  ]
              ),
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  EnterField(label: 'Total Number of Questions',
                    controller: _controller1,
                    color:Color(0xFF88E1F2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EnterField(label: 'No. of Questions Attended',
                    controller: _controller5,
                    color:Color(0xFF88E1F2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EnterField(label: 'Number of Correct Answers',
                    controller: _controller2,
                    color:Color(0xFF88E1F2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EnterField(label: 'Mark for One Correct Answer',
                    controller: _controller3,
                    color:Color(0xFF88E1F2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EnterField(label: 'Negative Mark for One Wrong Answer',
                    controller: _controller4,
                    color:Color(0xFF88E1F2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color:  Colors.pinkAccent,
                    splashColor:Color(0xFF88E1F2),
                    child: Text('CALCULATE',
                        style:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
                    onPressed: (){
                      setState(() {
                        _totalQues = double.parse(_controller1.text);
                        _correctAns = double.parse(_controller2.text);
                        _mark = double.parse(_controller3.text);
                        _negMark = double.parse(_controller4.text);
                        if(_totalQues>=_correctAns){
                          _calculate();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(total: _total,)));
                        }
                      });
                    },
                  )
                ],
              ),
            )],
          )
      ),
    );
  }
}

// ignore: must_be_immutable
class EnterField extends StatelessWidget {
  TextEditingController controller;
  String label;
  Color color;

  EnterField({@required this.label,@required this.controller,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30),
      child: TextField(
        controller: controller,
        cursorColor: color,
        style: TextStyle(
          color:Colors.white,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: color,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}