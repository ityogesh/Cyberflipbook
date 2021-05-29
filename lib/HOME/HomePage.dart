import 'package:cyberflipbook/HOME/homeArray.dart';
import 'package:cyberflipbook/TRAINING/TrainingPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: new Drawer(
          child: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                ),
                ListTile(
                  title: Text('HOME'),
                  contentPadding: const EdgeInsets.only(left: 30),
                ),
                Divider(
                  color: Colors.grey.shade400,
                ),
                ListTile(
                  title: Text('ABOUT US'),
                  contentPadding: const EdgeInsets.only(left: 30),
                ),
                Divider(
                  color: Colors.grey.shade400,
                ),
                ListTile(
                    title: Text('Log Out'),
                    contentPadding: const EdgeInsets.only(left: 30),
                    leading: Icon(Icons.logout, color: Colors.black))
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/backgroundhome.jpg"),
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
              child: Column(
            children: [_logo(), _menuSearch(), _gridView()],
          )),
        ));
  }

  _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 120),
      child: Image.asset(
        "assets/LogoTitle.png",
        height: 150,
        width: 200,
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

  _gridView() {
    return Container(
      height: 850,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: home.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              height: 80,
              child: Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 0.3, vertical: 0.3),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromRGBO(207, 217, 253, 5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      home[index]['image1'],
                      height: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      home[index]['buttonName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrainingPage(),
                    ));
              }
              print(index);
            },
          );
        },
      ),
    );
  }
}
