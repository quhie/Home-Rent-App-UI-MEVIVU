import 'package:flutter/material.dart';
import 'package:mevivu/data/near_data.dart';
import 'package:mevivu/data/best_data.dart';
import 'package:mevivu/component/navigation_drawer.dart' as custom;

import '../component/button.dart';
import '../component/item_best.dart';
import '../component/item_near.dart';
import 'detail.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = [
    'House',
    'Apartment',
    'Hotel',
    'Villa',
    'Cottage'
  ];

  String? selectedCategory;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: custom.NavigationDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                buildHeader(),
                const SizedBox(height: 16.0),
                buildSearchBar(),
                const SizedBox(height: 16.0),
                buildCategoryButtons(),
                const SizedBox(height: 16.0),
                buildNearItemsList(),
                const SizedBox(height: 16.0),
                buildBestItemsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          // Add this
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF838383),
                  fontFamily: 'Raleway',
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Jakata',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF000000),
                      fontFamily: 'Raleway',
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF838383),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('assets/icons/ic_noti.png'),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 279,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Color(0xFF838383)),
              labelText: 'Search address, or near you',
              labelStyle: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF838383),
                fontFamily: 'Raleway',
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF0A8ED9),
                  Color(0xFFA0DAFB).withOpacity(0.14),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/ic_filter.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        )
      ],
    );
  }

//
  Widget buildCategoryButtons() {
    return SizedBox(
      height: 41.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          return CustomButton(
            text: category,
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            isSelected: selectedCategory == category,
          );
        },
      ),
    );
  }

  Widget buildNearItemsList() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Near from you',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Raleway',
                color: Color(0xFF000000),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See more',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Raleway',
                  color: Color(0xFF858585),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: nearItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detail(imagePath: nearItems[index].image)),
                  );
                },
                child: ItemNear(item: nearItems[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildBestItemsList() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Best from you',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Raleway',
                color: Color(0xFF000000),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See more',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Raleway',
                  color: Color(0xFF858585),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Column(
          children: bestItems.map((item) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail(imagePath: item.image)),
                );
              },
              child: ItemBest(item: item),
            );
          }).toList(),
        ),
      ],
    );
  }
}