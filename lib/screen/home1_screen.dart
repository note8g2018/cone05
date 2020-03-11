import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RaisedButton(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(5.0),
                onPressed: ()
                {

                },
                child: Text(
                  'Wirte Something',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
