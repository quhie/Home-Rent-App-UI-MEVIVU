import 'package:flutter/material.dart';
import 'package:mevivu/component/read_more_text.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final String imagePath;

  const Detail({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildImageStack(context),
                  const SizedBox(height: 16),
                  buildDescription(),
                  const SizedBox(height: 16),
                  buildOwnerInfo(),
                  const SizedBox(height: 16),
                  buildGallery(),
                  const SizedBox(height: 16),
                  buildMap(),
                  const SizedBox(height: 16),
                  SizedBox(height: 50),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildPrice(),
            ),
          ),
        ],
      ),
    );
  }

  Stack buildImageStack(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.76),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.32),
                ],
                stops: const [
                  0.0,
                  0.32,
                  0.76,
                  1.0,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: buildBackButton(context),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: buildBookmarkButton(),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 0,
          child: buildImageInfo(),
        ),
      ],
    );
  }

  Container buildBackButton(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.24),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Image(
              image: AssetImage('assets/icons/ic_back.png'),
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Container buildBookmarkButton() {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.24),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/icons/ic_bookmark.png'),
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }

  Container buildImageInfo() {
    return Container(
      color: Colors.black.withOpacity(0.07),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Dreamsville House',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Raleway',
              ),
            ),
            const Text(
              'Jl. Sultan Iskandar Muda, Jakarta selatan',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Raleway',
                color: Color(0xFFD4D4D4),
              ),
            ),
            buildRoomInfo(),
          ],
        ),
      ),
    );
  }

  Row buildRoomInfo() {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              'assets/icons/ic_bedroom.png',
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 5),
            const Text(
              '5 Bedroom',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color(0xFFD7D7D7),
              ),
            ),
          ],
        ),
        const SizedBox(width: 34),
        Row(
          children: <Widget>[
            Image.asset('assets/icons/ic_bathroom.png', width: 16, height: 16),
            const SizedBox(width: 5),
            const Text(
              '4 Bathroom',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color(0xFFD7D7D7),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Description',
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Raleway',
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold),
        ),
        ReadMoreText(
          text:
              'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars. The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
          trimLength: 100,
        ),
      ],
    );
  }

  Widget buildOwnerInfo() {
    return Row(
      children: [
        Image.asset(
          'assets/images/img_avt.png',
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 8.0),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Garry Allen',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF000000),
                fontFamily: 'Raleway',
              ),
            ),
            Text(
              'Owner',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF858585),
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
        const Spacer(),
        buildCallButton(),
        const SizedBox(width: 8.0),
        buildMessageButton(),
      ],
    );
  }

  Container buildCallButton() {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFF0A8ED9).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () async {
          const url = 'tel: 0934.177.422 (Mevivu)';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Center(
          child: Image.asset(
            'assets/icons/ic_call.png',
            width: 12,
            height: 12,
          ),
        ),
      ),
    );
  }

  Container buildMessageButton() {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFF0A8ED9).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/ic_mess_detail.png',
          width: 12,
          height: 12,
        ),
      ),
    );
  }

  Widget buildGallery() {
    List<String> images = [
      'assets/images/img_gallery_1.png',
      'assets/images/img_gallery_2.png',
      'assets/images/img_gallery_3.png',
      'assets/images/img_gallery_1.png',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Gallery',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Raleway',
          ),
        ),
        SizedBox(
          height: 72,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length + 1,
            itemBuilder: (context, index) {
              if (index < images.length) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    images[index],
                    width: 72,
                    height: 72,
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        Text(
                          '+${images.length - 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildMap() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/img_map.png'),
        ),
      ],
    );
  }

  Widget buildPrice() {
    return Row(
      children: <Widget>[
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Price',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF858585),
                fontFamily: 'Raleway',
              ),
            ),
            Text(
              'Rp. 2.500.000.000 / Year',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF000000),
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            // Handle button tap
          },
          child: Container(
            width: 122,
            height: 43,
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
              child: Text(
                'Rent Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
