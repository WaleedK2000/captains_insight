import 'package:flutter/material.dart';

class cc extends StatelessWidget {
  const cc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Column(
        children: [
          Row(
            children: [
              _buildCard(),
              _buildCard(),
            ],
          )
        ],
      )),
    );
  }

  _buildCard() => Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 4,
            style: BorderStyle.solid,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color.fromARGB(199, 255, 255, 255),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        child: Column(children: [
          Row(
            children: [
              _buildPicture(),
              // _buildPlayerName(),
            ],
          ),
          Row(children: const [
            Text(
              'Babar Azam',
              textAlign: TextAlign.center,
            )
          ]),
          Row(children: const [Text('Right Hand Bat')]),
          Row(children: const [Text('Pakistan')])
        ]),
      );

  Widget _buildPicture() => Image.asset(
        'assets/images/babar_azam.png',
        height: 150,
        width: 150,
        colorBlendMode: BlendMode.saturation,
      );
}
