import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          new UserAccountsDrawerHeader(
            accountName: new Text('Afzal Khan'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.yellow,
              /* backgroundImage: AssetImage(
                "assets/drawerIcon.png",
              ),*/
              child: Image.asset(
                'assets/drawerIcon.png',
                height: 60,
                fit: BoxFit.fill,
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[300], Colors.indigoAccent[700]],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.clamp)),
          ),
          ListTile(
            title: Text('Home'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Communications'),
            selected: false,
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/training.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Investigation'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/investication.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Take Assessment'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/ect.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Post Incident Review'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/pir.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Crime Legislation'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/criminallegis.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Vicctim Support'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/victim.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('References'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/references.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('About App'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/about.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          ListTile(
            title: Text('Terms and Condition'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/terms-and-conditions.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/privacy-policy.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Log Out'),
            contentPadding: const EdgeInsets.only(left: 30),
            leading: Image.asset(
              'assets/logout.png',
              height: 20,
              color: Colors.black,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
