import 'package:cyberflipbook/References/referenceArray.dart';
import 'package:cyberflipbook/Resouce/CostomDrawer.dart';
import 'package:cyberflipbook/Resouce/Strings/Strings.dart';

//import 'preventionArray.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class References extends StatefulWidget {
  @override
  _ReferencesState createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();
  bool descTextShowFlag = false;
  String _dropdown1;
  String _dropdown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: new Drawer(child: CustomDrawer()),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/backgroundhome.jpg"),
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _logo(),
              _menusearh(),
              _countrySelection(),
              _gridView(),
              /* _help(),
              
              _image(),*/
              Container(height: 100),
            ],
          )),
        ));
  }

  _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 120),
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
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                'REFERENCES',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  _countrySelection() {
    return Row(
      children: [_countrySelect(), _jurisdictionSelect1()],
    );
  }

  _countrySelect() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        height: 40,
        width: 210,
        //width: MediaQuery.of(context).size.width * 0.53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
          color: Color.fromRGBO(224, 231, 255, 100),
        ),
        child: new DropdownButton<String>(
          isDense: true,
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'COUNTRY',
                style: TextStyle(fontSize: 11),
              ),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      map['image'],
                      height: 40,
                      width: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: new Text(map['name']),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  _jurisdictionSelect1() {
    //final data = MediaQuery.of(context);
    return Container(
      height: 40,
      width: 145,
      //width: MediaQuery.of(context).size.width * 0.34,
      //width: data.size.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
        color: Color.fromRGBO(224, 231, 255, 100),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: new DropdownButton(
          isDense: true,
          //isExpanded: true,
          hint: _dropdown1 == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'JURISDICTION',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Text(
                    _dropdown1,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
          items: getJuris.map((Juris lang) {
            return new DropdownMenuItem<String>(
                value: lang.type, child: new Text(lang.type));
          }).toList(),
          onChanged: (val) {
            setState(() {
              _dropdown1 = val;
            });
            print(val);
          },
        ),
      ),
    );
  }

  _menusearh() {
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
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.topLeft,
          child: Image.asset('assets/menu.png'),
        ),
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

  _gridView() {
    return Container(
      height: 550,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        itemCount: reference.length,
        itemBuilder: (context, index) {
          // var service = prevention[index];
          return InkWell(
            child: Container(
              //height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 200,
                    ),
                    child: Text(
                      reference[index]['topics'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  postText(index),
                  showmoreless(index)
                ],
              ),
            ),
            /*onTap: () {
                //Navigator.pop(context, ((context) => Home[index]));
                /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home[index]['onTap']));*/
                print(index);
              },*/
          );
        },
      ),
    );
  }

  postText(index) {
    return Container(
      child: Text(
          '${reference[index]['text']}' == "null"
              ? ""
              : reference[index]['text'],
          style: TextStyle(fontSize: 16.0),
          maxLines: descTextShowFlag ? '${reference[index]['text']}'.length : 3,
          textAlign: TextAlign.start),
    );
  }

  showmoreless(index) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          '${reference[index]['text']}'.length <= 120
              ? Text(
                  "",
                  style: TextStyle(
                    fontSize: 1.0,
                  ),
                )
              : descTextShowFlag
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Moredetail>>',
                          style: TextStyle(color: Colors.blue)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Moredetail>>',
                          style: TextStyle(color: Colors.blue)),
                    )
        ],
      ),
      onTap: () {
        setState(() {
          descTextShowFlag = !descTextShowFlag;
        });
      },
    );
  }
}
