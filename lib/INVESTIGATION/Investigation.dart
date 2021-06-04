import 'package:cyberflipbook/Resouce/CostomDrawer.dart';
import 'package:flutter/material.dart';

import 'ResultPage.dart';

class Investigation extends StatefulWidget {
  @override
  _InvestigationState createState() => _InvestigationState();
}

class _InvestigationState extends State<Investigation> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();
  bool someBooleanValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: new Drawer(
          child: CustomDrawer(),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/Invesbackground.png"),
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
              child: Column(
            children: [
              _logo(),
              _menuSearch(),
              _text(),
              _indicator(),
              _textHelp(),
              _gridView(),
              _bottons(),
              Container(
                height: 100,
              )
            ],
          )),
        ));
  }

  _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 120),
      child: Container(
        height: 150,
        child: Row(
          children: [
            Image.asset(
              "assets/GCAlogo1.png",
              height: 90,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Text(
                '  CYBER\nFLIPBOOK',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  _text() {
    return Padding(
      padding: const EdgeInsets.only(right: 200, top: 30, bottom: 10),
      child: Text(
        'Invsetigations',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 5,
          width: 50,
          color: Colors.black,
        ),
        Container(
          height: 5,
          width: 50,
          color: Colors.black,
        ),
        Container(
          height: 5,
          width: 50,
          color: Colors.grey,
        ),
        Container(
          height: 5,
          width: 50,
          color: Colors.grey,
        ),
        Container(
          height: 5,
          width: 50,
          color: Colors.grey,
        ),
        Container(
          height: 5,
          width: 50,
          color: Colors.grey,
        ),
      ],
    );
  }

  _textHelp() {
    return Row(
      children: [_text1(), _help()],
    );
  }

  _text1() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        'DEVICE',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  _help() {
    return Padding(
      padding: const EdgeInsets.only(left: 250, top: 20),
      child: InkWell(
        child: Container(
          child: Icon(
            Icons.help_sharp,
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
    );
  }

  _menuSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _menu(),
        _buildSearchTextField(),
      ],
    );
  }

  _menu() {
    return InkWell(
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.topLeft,
        child: Image.asset('assets/menu.png'),
      ),
      onTap: () {
        _globalKey.currentState.openDrawer();
      },
    );
  }

  _gridView() {
    return Container(
        height: 470,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: device.keys.map((String key) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)),
                child: new CheckboxListTile(
                  title: new Text(key),
                  value: device[key],
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      device[key] = value;
                    });
                  },
                ),
              ),
            );
          }).toList(),
        ));
  }

  _bottons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_botton(), _botton1()],
    );
  }

  _botton() {
    return InkWell(
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue[900]),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            'PREVIOUS',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  _botton1() {
    return InkWell(
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue[900]),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            'NEXT',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(),
            ));
      },
    );
  }

  var searchText;
  _buildSearchTextField() {
    return Container(
      height: 35,
      width: 300,
      color: Colors.white,
      child: TextField(
        controller: editingController,
        decoration: InputDecoration(
            suffixIcon: IconButton(icon: Icon(Icons.mic), onPressed: () {}),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            hintText: "Search ",
            border: OutlineInputBorder()),
        onChanged: (value) {
          searchText = value;
        },
      ),
    );
  }

  Map<String, bool> device = {
    'an online account(email,social\nnetwork,bank...)': false,
    'Computer': false,
    'Phone': false,
    'Landline': false,
    'Internet Site': false,
    'Tablet': false,
    'Member of an administration or a\ncommunity': false,
  };
}
