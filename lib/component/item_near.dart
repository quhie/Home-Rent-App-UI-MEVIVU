import 'package:flutter/material.dart';

import '../data/near_item_model.dart';
import '../presentation/detail.dart';

class ItemNear extends StatelessWidget {
  final NearItemModel item;

  ItemNear({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(imagePath: item.image)),
        );
      },
      child: Container(
        width: 222,
        height: 272,
        margin: const EdgeInsets.only(right: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  height: 24,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/icons/ic_location.png'),
                        width: 12,
                        height: 12,
                      ),
                      Text(
                        item.distance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.07),
                  child: ListTile(
                    title: Text(item.title,
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    subtitle: Text(item.address,
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xFFD7D7D7),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}