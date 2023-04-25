import 'package:flutter/material.dart';

class Profile1 extends StatefulWidget {
  const Profile1({Key? key}) : super(key: key);

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joboy Estamo'),
      ),
      body: Container(
        padding: EdgeInsets.all(90),
        child: Column(
          children: const [
            SizedBox(
              child: Icon(Icons.image,
                size: 100,
              ),
            ),
            SizedBox(height: 40,),
            Text('Email: joboy.estamo@gmail.com'),
            SizedBox(height: 40,),
            Text('ID Number: 1231252525255552'),
          ],
        ),),
    );
  }
}
