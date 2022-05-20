import 'package:flutter/material.dart';

class StrongZoneScreen extends StatefulWidget {
  const StrongZoneScreen({Key? key}) : super(key: key);

  @override
  State<StrongZoneScreen> createState() => _StrongZoneScreenState();
}

class _StrongZoneScreenState extends State<StrongZoneScreen> {
  Widget _buildPicture() => Image.asset(
        'assets/images/strong_zones.jpg',
        height: 200,
        width: 200,
        colorBlendMode: BlendMode.saturation,
      );

  _buildPlayerName() => Container(
          child: const Text(
        'Babar Azam \n Strong Zone: Cover Drive',
        textAlign: TextAlign.center,
      ));

  Widget _buildTopHalf() => Row(
        children: <Widget>[
          _buildPicture(),
          _buildPlayerName(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scoring Zone Analysis'),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(children: <Widget>[_buildTopHalf()]),
              ],
            )));
  }
}
