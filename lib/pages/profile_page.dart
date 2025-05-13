import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // Main column
  Column mainColumn = Column(
    children: [
      // Profile pic, username and email
      Row(children: [
        Image.asset('assets/images/pilot.png'),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Pilot',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                textAlign: TextAlign.right,
              ),
              Text(
                'spelunkypilot@gmail.com'
              )
            ],
          ),
        )
      ],)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red.shade200,
            borderRadius: BorderRadius.circular(15)
            ),
          child: SizedBox(height: 200, child: mainColumn),
        )
      )

    );
  }
}