\
import 'package:aquatic_stream_bus/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(backgroundColor: Color.fromARGB(0, 0, 0, 0))
                .copyWith(secondary: Color.fromARGB(255, 22, 239, 228)));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // hide the back arrow
        title: Row(
          children: [
            Icon(
              FontAwesomeIcons.bus,
              color: Colors.white,
            ),
            SizedBox(width: 8), // add some spacing between icon and text
            Text(
              'Aquatic Stream Bus',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 22, 239, 228),
        elevation: 0, // remove the shadow
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color.fromARGB(255, 22, 239, 228),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_online),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_rounded),
            label: 'MyAccount',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(child: HomeScreen()),
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Booking 1')),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Booking 2'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Align(
                alignment: Alignment.centerLeft, child: Text("Account Page"));
          },
        ),
      ][currentPageIndex],
    );
  }
}
