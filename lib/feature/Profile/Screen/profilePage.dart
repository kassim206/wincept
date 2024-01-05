import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wincept/core/globelvariables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: Colors.black,
body: Container(
  width: deviceWidth * 400,
  height: 290,
  color: Colors.black,
  child: Stack(
    children: [
      Positioned(
        top: 10,
        left: 10,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 5,),
            Text("Kassim.C")
          ],
        ),
      ),
      Positioned(
        top: 40,
        left: 190,
        child: InkWell(
          onTap: (){
          },
        ),
      ),
      Positioned(
        top: 155,
        left: 10,
        child: InkWell(
          onTap: (){
          },
          child: Container(
            width: 130,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 155,
        left: 155,
        child: Container(
          width: 130,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: Center(
            child: Text(
              "Share Profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    ],
  ),
),
    ));
  }
}
