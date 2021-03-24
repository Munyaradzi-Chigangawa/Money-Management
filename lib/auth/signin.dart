import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:money_management_app/Dashboard/dashboard.dart';
import 'package:money_management_app/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: showSpinner, 
    child: Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Color(0xFF5B16D0),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height:300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5B16D0), Color(0xFF5B16D0)],
                    ), 
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height:300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5B16D0), Color(0xFF5B16D0)],
                    ), 
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child:Container(
                  child: Column(
                    children: <Widget> [
                      SizedBox(height: 100),
                      Text('Sign In',
                      style: TextStyle(
                        color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300,),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5B16D0), Color(0xFE5B16D0)]),
                  ),
                )
              )
            ],
          ),
          SizedBox(height:10),
          Padding(padding: EdgeInsets.symmetric(horizontal:32),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(30),
            child: TextField(
              onChanged:(value){
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              cursorColor: Color(0xFF5B16D0),
              decoration: InputDecoration(
                hintText:"E-mail",
                prefixIcon: Material(elevation: 0,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(30)),
                child: Icon(Icons.email,
                color: Color(0xFF5B16D0),
                ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical:13)
              ),
            ),
          ),
          ),
          SizedBox(height:30),
          Padding(padding: EdgeInsets.symmetric(horizontal:32),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(30),
            child: TextField(
              onChanged:(value){
                password = value;
              },
              cursorColor: Color(0xFF5B16D0),
              decoration: InputDecoration(
                hintText:"Password",
                prefixIcon: Material(elevation: 0,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(30)),
                child: Icon(Icons.lock,
                color: Color(0xFF5B16D0),
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical:13),
                ),
                obscureText: true,
              ),
            ),
          ),
          SizedBox(height:30),
          Center(child: Text("Forgot Password ?",
          style: TextStyle(
            color:Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          )
            ),
          ),
          SizedBox(height: 37),
          Padding(padding: EdgeInsets.symmetric(horizontal:90),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Colors.white
              ),
              child: FlatButton(
                child: Text("Sign In",
                style: TextStyle(
                  color: Color(0xFF5B16D0),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                    if  (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()));
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }catch (e) {
                    print(e);
                  }
                },
              )
            ),
          ),
          SizedBox(height:50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an Account ?", style: TextStyle(color: Colors.black,fontSize: 12, fontWeight:FontWeight.normal)),
              FlatButton(onPressed: (){
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()
                      ),
                  );
              }, 
              child: Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight:FontWeight.w400, decoration: TextDecoration.underline),
              ),
              )
            ],
          )
        ],
      ),
    )
    );
  }
}

class WaveClipper1 extends CustomClipper <Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
     firstEndPoint.dx, firstEndPoint.dy);

     var secondEndPoint = Offset(size.width, size.height - 60);
     var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
     path.lineTo(size.width, size.height);
     path.lineTo(size.width, 0);
     return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper <Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
     firstEndPoint.dx, firstEndPoint.dy);

     var secondEndPoint = Offset(size.width, size.height - 40);
     var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
     path.lineTo(size.width, size.height);
     path.lineTo(size.width, 0);
     return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper <Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
     firstEndPoint.dx, firstEndPoint.dy);

     var secondEndPoint = Offset(size.width, size.height - 45);
     var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
     path.lineTo(size.width, size.height);
     path.lineTo(size.width, 0);
     return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

    