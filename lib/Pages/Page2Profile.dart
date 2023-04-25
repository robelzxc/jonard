import 'package:flutter/material.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobox Estamo'),
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
              Text('Email: jobox.estamo@gmail.com'),
              SizedBox(height: 40,),
              Text('ID Number: 192382842'),
          ],
      ),),
    );
  }
}
