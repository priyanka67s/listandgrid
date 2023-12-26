
import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  const secondPage({required this.names, required this.images});
  final String names;
  final String images;

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
        title: Text(widget.names),
        backgroundColor: Colors.deepOrange[200],
      ),
       Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset(widget.images, height: 200,width: 200,),
            Text(widget.names , style: TextStyle(fontSize: 20, color: Colors.pinkAccent[200]),),
          ],
        ) 
    
      ),
    ]
    );
  }
}
