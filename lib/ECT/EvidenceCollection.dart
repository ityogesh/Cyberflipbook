import 'package:cyberflipbook/ECT/EvidenceArray.dart';
import 'package:cyberflipbook/HOME/HomePage.dart';
import 'package:cyberflipbook/Resouce/CostomDrawer.dart';
import 'package:flutter/material.dart';

class EvidenceCollectionPage extends StatefulWidget {
  @override
  _EvidenceCollectionPageState createState() => _EvidenceCollectionPageState();
}

class _EvidenceCollectionPageState extends State<EvidenceCollectionPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();
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
            image: AssetImage("assets/backgroundhome.jpg"),
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
              child: Column(
            children: [
              _logo(),
              _menusearh(),
              _gridView(),
              _back(),
              _space(40)
              /*Container(
                height: 100,
              )*/
            ],
          )),
        ));
  }

  _space(double space) {
    return SizedBox(height: space);
  }

  _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
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
                '   Evidence\nCollection &\n    Transfer',
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
        Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      },
    );
  }

  _gridView() {
    return Container(
      height: MediaQuery.of(context).size.height * 2.2,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: evidencecollection.length,
        itemBuilder: (context, index) {
          return InkWell(
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
                    evidencecollection[index]['image2'],
                    height: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    evidencecollection[index]['Ename'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              //Navigator.pop(context, ((context) => Home[index]));
              /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home[index]['onTap']));*/
              print(index);
            },
          );
        },
      ),
    );
  }
}
