import 'package:cyberflipbook/CustomListView.dart';
import 'package:cyberflipbook/Resouce/CostomDrawer.dart';
import 'preventionArray.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PreventionPage extends StatefulWidget {
  @override
  _PreventionPageState createState() => _PreventionPageState();
}

class _PreventionPageState extends State<PreventionPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: new Drawer(child: CustomDrawer()),
        body: Container(
          /*decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/backgroundhome.png"),
            fit: BoxFit.fill,
          )),*/
          child: SingleChildScrollView(
              child: Column(
            children: [
              _logo(),
              _menusearh(),
              _help(),
              _gridView(),
              _image(),
              _back()
            ],
          )),
        ));
  }

  _image() {
    return Container(
        height: 250,
        width: 400,
        child: Image.asset(
          "assets/Video.png",
        ));
  }

  _help() {
    return Padding(
      padding: const EdgeInsets.only(left: 280, top: 10),
      child: InkWell(
        child: Container(
          child: Icon(
            Icons.help_sharp,
            color: Colors.blue,
          ),
        ),
        onTap: () {
          /* showDialog(
            context: context,
            builder: (context) => Help(),
          );*/
        },
      ),
    );
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
                '       VICTIM\nMANAGEMENT',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  _menusearh() {
    return Row(
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
          left: 30,
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
      height: 1500,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        itemCount: prevention.length,
        itemBuilder: (context, index) {
          // var service = prevention[index];
          return InkWell(
            child: Container(
              //height: 130,
              child: CustomListView(
                title: prevention[index]['topics'],
                description: prevention[index]['description'],
                link: prevention[index]['link'],
                thumbnailImage: prevention[index]['thumbnailImage'],
                videoUrl: prevention[index]['videourl'],
              ),
            ),
          );
        },
      ),
    );
  }

  postText(index) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            '${prevention[index]['text']}' == "null"
                ? ""
                : prevention[index]['text'],
            style: TextStyle(fontSize: 16.0),
            maxLines:
                descTextShowFlag ? '${prevention[index]['text']}'.length : 3,
            textAlign: TextAlign.start),
      ),
    );
  }

  showmoreless(index) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          '${prevention[index]['text']}'.length <= 120
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

  _back() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 200),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(46, 91, 255, 2)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          height: 30,
          width: 100,
          child: Center(
              child: Text(
            'Back',
            style: TextStyle(color: Colors.green),
          )),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
