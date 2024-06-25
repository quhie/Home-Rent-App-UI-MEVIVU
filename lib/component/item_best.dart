import 'package:flutter/material.dart';

import '../data/best_item_model.dart';
import '../presentation/detail.dart';

class ItemBest extends StatelessWidget {
  final BestItemModel item;

  ItemBest({required this.item});

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
        height: 70,
        margin: const EdgeInsets.only(bottom: 16.0),
        child: ClipRRect(
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                  width: 74,
                  height: 70,
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(item.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${item.price} / Year',
                          style: const TextStyle(
                            color: Color(0xFF0A8ED9),
                            fontFamily: 'Raleway',
                          )),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset('assets/icons/ic_bedroom.png',
                                  width: 16, height: 16),
                              Text(
                                ' ${item.bedroom} Bedroom',
                                style: const TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFFD7D7D7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 34),
                          Row(
                            children: <Widget>[
                              Image.asset('assets/icons/ic_bathroom.png',
                                  width: 16, height: 16),
                              Text(
                                ' ${item.bathroom} Bathroom',
                                style: const TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFFD7D7D7),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
