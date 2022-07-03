import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yellow_page_assignment/Constants/constants.dart';
import 'package:yellow_page_assignment/HomePageScreen/videotile.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

class YouTubeHomePage extends StatefulWidget {
  const YouTubeHomePage({Key? key}) : super(key: key);

  @override
  State<YouTubeHomePage> createState() => _YouTubeHomePageState();
}

class _YouTubeHomePageState extends State<YouTubeHomePage>
    with AutomaticKeepAliveClientMixin {
  List<String> categories = category;
  String selectedCategory = category[0];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    super.build(context);
    return Scaffold(
      backgroundColor: ytbgcolor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: ytcolor),
        elevation: 0,
        backgroundColor: ytcolor,
        leading: SvgPicture.asset('assets/YouTube-Logo.svg'),
        leadingWidth: 150,
        actions: [
          IconButton(
            splashRadius: 0.1,
            onPressed: () {},
            icon: screencast,
          ),
          IconButton(
            splashRadius: 0.1,
            onPressed: () {},
            icon: notification,
          ),
          IconButton(
            splashRadius: 0.1,
            onPressed: () {},
            icon: search,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              child: IconButton(
                  splashRadius: 0.1, onPressed: () {}, icon: profile),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(height * 0.07),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                SizedBox(
                  height: height * 0.045,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.explore_outlined,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Explore",
                            style: defaultTextStyle,
                          ),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(backgroundColor: tabunselected),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      thickness: 1,
                      color: tabunselected,
                    ),
                  ),
                ),
                Wrap(
                    spacing: 5,
                    children: categories
                        .map((category) => FilterChip(
                            showCheckmark: false,
                            label: Text(
                              category,
                              style: TextStyle(
                                  color: selectedCategory == category
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            backgroundColor: tabunselected,
                            selectedColor: Colors.white,
                            selected: selectedCategory == category,
                            onSelected: (bool value) {
                              setState(() {
                                selectedCategory = category;
                              });
                            }))
                        .toList())
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/dataset.json'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<dynamic> data = json.decode(snapshot.data.toString());
                return Expanded(
                  child: InViewNotifierList(
                    scrollDirection: Axis.vertical,
                    isInViewPortCondition:
                        (deltaTop, deltaBottom, viewPortDimension) {
                      return deltaTop < (0.25 * viewPortDimension) &&
                          (deltaBottom > 0.25 * viewPortDimension);
                    },
                    itemCount: data.length,
                    builder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return InViewNotifierWidget(
                                id: '$index',
                                builder: (BuildContext context, bool isInView,
                                    Widget? child) {
                                  log(isInView.toString() +
                                      data[index]['title']);
                                  return VideoWidget(
                                      img: data[index]['coverPicture'],
                                      url: data[index]['videoUrl'],
                                      desc: data[index]['title'],
                                      play: isInView);
                                });
                          },
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
