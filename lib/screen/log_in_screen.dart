import 'package:cone05/widget/textForm_m1_widget.dart';
import 'package:flutter/material.dart';
import 'package:cone05/screen/reg_screen.dart';

class LogIn extends StatefulWidget
{
  static String route = 'LogIn';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn>
{
  String _userName;
  String _passWord;

  void sendLogin()
  {

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'CoolME.me',
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormM1(
                keyboardType: TextInputType.text,
                letterSpacing: 2.0,
                color: Colors.purple,
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                labelText: 'User Name',
                onChanged: (value)
                {
                  _userName = value;
                },
              ),
              TextFormM1(
                obscureText: true,
                keyboardType: TextInputType.text,
                letterSpacing: 1.0,
                color: Colors.purple,
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                labelText: 'PassWord',
                onChanged: (value)
                {
                  _passWord = value;
                },
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.pink,
                    ),
                  ),
                  onPressed: ()
                  {
                    sendLogin();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(20.0),
                  onPressed: ()
                  {
                    Navigator.pushNamed(context, Reg.route);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
