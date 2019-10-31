import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/screens/home_screens/activity_screen.dart';
import 'package:instagram_flutter_app/screens/home_screens/create_post_screen.dart';
import 'package:instagram_flutter_app/screens/home_screens/feed_screen.dart';
import 'package:instagram_flutter_app/screens/home_screens/profile_screen.dart';
import 'package:instagram_flutter_app/screens/home_screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "home_screen";

  final String userId;

  HomeScreen({this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontFamily: "Billabong", fontSize: 35),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(userId: widget.userId)
        ],
        onPageChanged: (int index){
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.home,
            size: 32,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.search,
            size: 32,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.photo_camera,
            size: 32,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.notifications,
            size: 32,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.account_circle,
            size: 32,
          ))
        ],
      ),
    );
  }
}
