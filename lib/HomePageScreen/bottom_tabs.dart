import 'package:flutter/material.dart';
import 'package:yellow_page_assignment/Constants/constants.dart';
import 'package:yellow_page_assignment/HomePageScreen/youtube_homepage.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
            backgroundColor: ytcolor,
            bottomNavigationBar: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 10),
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                    height: height * 0.065,
                    icon: home,
                    text: "Home"),
                Tab(
                    height: height * 0.065,
                    icon: shorts,
                    text: "Shorts"),
                Tab(
                  height: height * 0.065,
                  icon: upload
                ),
                Tab(
                    height: height * 0.065,
                    icon: subs,
                    text: "Subscriptions"),
                Tab(
                    height: height * 0.065,
                    icon: library,
                    text: "Library"),
              ],
            ),
            body: TabBarView(
              controller: tabController,
              children: const [
                YouTubeHomePage(),
                Center(
                  child: Text("Shorts"),
                ),
                Center(
                  child: Text(" "),
                ),
                Center(
                  child: Text("Subscritions"),
                ),
                Center(
                  child: Text("Library"),
                ),
              ],
            ),
          );
  }
}
