import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {

  HomePage({@required this.onSignOut});
  final VoidCallback onSignOut;

  Future<void> _signOut() async{
    try{
      await FirebaseAuth.instance.signOut();
      onSignOut();
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Home Page'),
        actions:<Widget> [
          FlatButton(
              onPressed: _signOut,
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize:18.0,
                  color: Colors.white,
                )
              )
          )
        ],
      ),
    );
  }
}
