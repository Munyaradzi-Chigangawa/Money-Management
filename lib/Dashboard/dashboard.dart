import 'package:flutter/material.dart';
import 'package:money_management_app/auth/signin.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool showSpinner = false;
  final Color primary = Color(0xFF5B16D0);
  final Color active = Colors.white;
  final Color divider = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF5B16D0),
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.menu),
         onPressed: (){
           _key.currentState.openDrawer();
          }
         ),
      ),
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: new Container(
                height: 250.00,
                width: 400.00,
                decoration: BoxDecoration(
                color: Color(0xFF5B16D0),
                boxShadow: [
                BoxShadow(
                  offset: Offset(0.00,3.00),
                  color: Color(0xff000000).withOpacity(0.16),
                  blurRadius: 6,
              ),
            ], borderRadius: BorderRadius.circular(11.00), 
          ), 
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 25),
              children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Current Balance'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height:5),
                          Text(
                            '5020.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'ZWL\$',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
        SizedBox(height: 20),
        new Text('Transactions'.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Color(0xFF5B16D0),
          fontSize: 20,),),
      ],
    ),
  )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF5B16D0),
        ),
    );
  }

_buildDrawer() {
  return ClipPath(
    clipper: OvalRightBorderClipper(),
    child: Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
          color: primary, boxShadow: [BoxShadow(color: Colors.white)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment:Alignment.centerRight,
                    child:IconButton(
                      icon: Icon(Icons.power_settings_new,
                      color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Signin()));
                      },
                    ),
                  ),
                  Container(
                    height:90,
                  ),
                  SizedBox(height:5),
                  Text("@user",
                    style: TextStyle(color: Colors.white,fontSize:15,),
                  ),
                  SizedBox(height:50),
                  _buildRow(Icons.home, 'Home'),
                  _buildDivider(),
                  _buildRow(Icons.email, 'Contact Us'),
                  _buildDivider(),
                  _buildRow(Icons.feedback, 'Feedback'),
                  _buildDivider(),
                  _buildRow(Icons.help, 'About',),
                  _buildDivider(),
                  _buildRow(Icons.power_settings_new, 'Logout'),
                  _buildDivider(),
            ],)
          )
        ),
      ),
    )
  );
}

Divider _buildDivider() {
  return Divider(
  color: Colors.white,
  );
}

Widget _buildRow(IconData icon, String title,) {
  final TextStyle tStyle = TextStyle(color: Colors.white, fontSize: 16.0);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      children:[
        Icon(icon,
        color: active,
        ),
        SizedBox(width:10),
        Text(
          title,
          style:tStyle,
        ),
      ],),
  );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width-40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height/2);
    path.quadraticBezierTo(
        size.width, size.height - (size.height / 4), size.width-40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}