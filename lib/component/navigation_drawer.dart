import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String iconPath;
  final Function onTap;
  bool isSelected;

  MenuItem(
      {required this.title,
      required this.iconPath,
      this.onTap = _emptyFunction,
      this.isSelected = false});

  static void _emptyFunction() {}
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final List<MenuItem> menuItems = [
    MenuItem(
        title: 'Home', iconPath: 'assets/icons/ic_home.png', isSelected: true),
    MenuItem(title: 'Profile', iconPath: 'assets/icons/ic_profile.png'),
    MenuItem(title: 'Nearby', iconPath: 'assets/icons/ic_location.png'),
    MenuItem(title: 'Bookmark', iconPath: 'assets/icons/ic_bookmark.png'),
    MenuItem(title: 'Notification', iconPath: 'assets/icons/ic_noti2.png'),
    MenuItem(title: 'Message', iconPath: 'assets/icons/ic_mess.png'),
    MenuItem(title: 'Setting', iconPath: 'assets/icons/ic_setting.png'),
    MenuItem(title: 'Help', iconPath: 'assets/icons/ic_help.png'),
    MenuItem(title: 'Logout', iconPath: 'assets/icons/ic_logout.png'),
  ];

  void selectItem(int index) {
    setState(() {
      for (var i = 0; i < menuItems.length; i++) {
        menuItems[i].isSelected = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF0A8ED9),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: menuItems.length * 60.0,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: menuItems[index].isSelected
                          ? BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )
                          : BorderRadius.circular(0),
                      child: Container(
                        color:
                            menuItems[index].isSelected ? Colors.white : null,
                        child: ListTile(
                          leading: Image.asset(
                            menuItems[index].iconPath,
                            color: menuItems[index].isSelected
                                ? const Color(0xFF0A8ED9)
                                : null,
                            width: 24,
                            height: 24,
                          ),
                          title: Text(
                            menuItems[index].title,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: menuItems[index].isSelected
                                  ? const Color(0xFF0A8ED9)
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            selectItem(index);
                            menuItems[index].onTap();
                          },
                        ),
                      ),
                    ),
                    if ((index + 1) % 3 == 0 && index != menuItems.length - 1)
                      const Divider(color: Colors.white),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
