import 'package:cyberflipbook/INVESTIGATION/InvestigationArray.dart';
import 'package:cyberflipbook/Resouce/CostomDrawer.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();
  bool someBooleanValue = false;
  String _dropdown;
  String _dropdown1;
  String _dropdown2;
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
              //_textHelp(),
              _gridView(),
              _countrySelect(),
              space(10),
              _countrySelect1(),
              space(10),
              _countrySelect2(),
              space(10),
              _botton(),
              Container(
                height: 100,
              )
            ],
          )),
        ));
  }

  space(double space) {
    return SizedBox(height: space);
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

  _gridView() {
    return Container(
        height: 250,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: result.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 8),
                        child: Text(
                          result[index]['text'],
                          style: TextStyle(
                              color: Colors.indigoAccent[400],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 8),
                        child: Icon(
                          Icons.edit,
                          color: Colors.indigoAccent[400],
                        ),
                      ),
                    ],
                  ),
                ],
              ));
            }));
  }

  _countrySelect() {
    return Container(
      height: 62,
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue[900]),
        color: Colors.indigoAccent[700],
      ),
      child: Container(
        height: 60,
        width: 310,
        color: Colors.indigoAccent[700],
        child: Column(
          children: [
            Text(
              'Possible Criminal Activity',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            new DropdownButton<String>(
              dropdownColor: Colors.grey,
              iconEnabledColor: Colors.white,
              isDense: true,
              //isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Text(
                  'Intrusion',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              value: _dropdown,
              onChanged: (String map) {
                setState(() {
                  _dropdown = map;
                });
              },
              items: getDrops.map((Map map) {
                return new DropdownMenuItem<String>(
                  value: map['name'].toString(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: new Text(
                      map['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  _countrySelect1() {
    return Container(
      height: 62,
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue[900]),
        color: Colors.indigoAccent[700],
      ),
      child: Container(
        height: 60,
        width: 310,
        color: Colors.indigoAccent[700],
        child: Column(
          children: [
            Text(
              'Criminal Activity Expaned',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            new DropdownButton<String>(
              dropdownColor: Colors.grey,
              iconEnabledColor: Colors.white,
              isDense: true,
              //isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Compromised Account',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              value: _dropdown1,
              onChanged: (String map) {
                setState(() {
                  _dropdown1 = map;
                });
              },
              items: getDrops1.map((Map map) {
                return new DropdownMenuItem<String>(
                  value: map['name'].toString(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: new Text(
                      map['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  _countrySelect2() {
    return Container(
      height: 62,
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blue[900]),
        color: Colors.indigoAccent[700],
      ),
      child: Container(
        height: 60,
        width: 310,
        color: Colors.indigoAccent[700],
        child: Column(
          children: [
            Text(
              'Criminal Codes',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            new DropdownButton<String>(
              dropdownColor: Colors.grey,
              iconEnabledColor: Colors.white,
              isDense: true,
              //isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'CFAA 18 USC 1030(a)',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              value: _dropdown2,
              onChanged: (String map) {
                setState(() {
                  _dropdown2 = map;
                });
              },
              items: getDrops2.map((Map map) {
                return new DropdownMenuItem<String>(
                  value: map['name'].toString(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: new Text(
                      map['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
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

  _botton() {
    return Padding(
      padding: const EdgeInsets.only(right: 200),
      child: InkWell(
        child: Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[900]),
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Text(
              'PREVIOUS',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
