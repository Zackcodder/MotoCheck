// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motocheck/constants/colors.dart';
import 'package:motocheck/constants/text_style.dart';

import 'reuseable_container.dart';
import 'service_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBackground,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 24.0, top: 20.0),
            decoration: kBoxstyle,
            height: 40.0,
            width: 40.0,
            child: Center(
              child: Icon(
                FontAwesomeIcons.user,
                size: 20,
                color: kMainTextColor,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: kBox1Color,
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, bottom: 44.5, left: 32.0),
              child: Image.asset(
                'assets/logo.png',
                alignment: Alignment.topLeft,
                height: 32.0,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text(
                    'Overview',
                    style: kSidebartextstyle,
                  ),
                  leading: Image.asset('assets/overview.png')),
            ),
            SizedBox(
              height: 28.5,
            ),
            Divider(
              color: kDividerColor,
              thickness: 2.0,
              endIndent: 40.0,
              indent: 40.0,
            ),
            SizedBox(
              height: 28.5,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Inspection',
                  style: kSidebartextstyle,
                ),
                leading: Image.asset('assets/inspect.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text(
                    'Notification',
                    style: kSidebartextstyle,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.bell,
                    size: 18,
                    color: kViewalltextColor,
                  )),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Maintenance',
                  style: kSidebartextstyle,
                ),
                leading: Image.asset('assets/maintenance.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Payment Wallet',
                  style: kSidebartextstyle,
                ),
                leading: Image.asset('assets/card.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'History',
                  style: kSidebartextstyle,
                ),
                leading: Image.asset('assets/history.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Logout', 
                  style: TextStyle(
    color: kRecentSubtextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Sofia Pro',
    fontSize: 15.0,
    fontStyle: FontStyle.normal)),
                leading: Icon(Icons.logout_outlined, color: kViewalltextColor),
              ),
            ),
            SizedBox(
              height: 190.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 41.94, bottom: 41.94),
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Faith Auto's"),
                  subtitle: Text('Auto Centre'),
                  leading: Image.asset('assets/user.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0, bottom: 12.0, left: 24.0),
            child: Image.asset(
              'assets/welcome.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 20.0),
            child: Text(
              textAlign: TextAlign.left,
              'It is a long established fact lorem.',
              style: TextStyle(
                  fontFamily: "Sofia Pro",
                  color: kSubtextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: kBox1Color,
                hintText: 'Search lorem ipusum',
                hintStyle: kRecentbodytextstyle,
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  size: 13.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(2.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // Recent Checklist
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Recent Checklist',
                        style: kRecenttextstyle,
                      ),
                      Text(
                        'view all',
                        style: kRecentbodytextstyle,
                      ),
                    ],
                  ),
                ),
                ReuseableContainer(
                  label: 'Pending',
                ),
                SizedBox(height: 24.0),
                ReuseableContainer(
                  label: 'Ready',
                ),

                // Services
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 24.0),
                  child: Text(
                    'Services',
                    style: kRecenttextstyle,
                  ),
                ),
                ServiceContainer(
                  Containerchild: Image.asset(
                    'assets/Inspection.png',
                  ),
                  label: 'Inspection',
                ),
                SizedBox(height: 30.0),
                ServiceContainer(
                  Containerchild: Image.asset(
                    'assets/Vector.png',
                  ),
                  label: 'Maintenance',
                ),

                SizedBox(height: 53.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
