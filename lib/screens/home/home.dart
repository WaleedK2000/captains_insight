import 'package:captains_insight/interfaces/home_Interface.dart';
import 'package:captains_insight/services/controller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var allMenu;
  home_interface controller = Controller();

  @override
  Widget build(BuildContext context) {
    this.allMenu = controller.getMenuItems();

    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(children: [
          const SizedBox(height: 35),
          const Text(
            'Captains Insight',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 45),
          Container(
            child: Column(children: _buildPlayerCards()),
          )
        ]));
  }

  _buildPlayerCards() {
    var menuList = allMenu.keys.toList();
    var columns = <Widget>[];
    for (var i = 0; i < (menuList.length); i += 2) {
      columns.add(
        Row(
          children: [
            _buildCard2(menuList[i], allMenu[menuList[i]]),
            _buildCard2(menuList[i + 1], allMenu[menuList[i + 1]]),
          ],
        ),
      );
    }

    return columns;
  }

  _buildCard2(String meMenu, meVal) => Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
          style: BorderStyle.solid,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color.fromARGB(199, 255, 255, 255),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(22)),
      ),
      child: InkWell(
        child: Column(children: [
          Row(
            children: [
              _buildPicture2(meVal['image']),
              // _buildPlayerName(),
            ],
          ),
          Row(children: [
            Text(
              meMenu,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            )
          ]),
        ]),
        onTap: () => controller.menuItemSelected(meMenu, context),
      ));

  Widget _buildPicture2(String filename) => Container(
      child: Image.asset(
        'assets/images/' + filename,
        height: 150,
        width: 150,
        colorBlendMode: BlendMode.saturation,
      ),
      padding: const EdgeInsetsDirectional.fromSTEB(2, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 0),
        borderRadius: const BorderRadius.all(Radius.circular(22)),
      ));
}
