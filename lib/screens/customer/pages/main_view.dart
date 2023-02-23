// @dart=2.9
import 'package:badges/badges.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/screens/chat/chats_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../core.dart';
import 'notification/notification_view.dart';

class MainView extends GetView<MainController> {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.retrieveCustomerDetails(controller.authController.user.uid);
    notficationController.selectMyNotifications();
    print(notficationController.myNotifications.length);
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [HomeView(), ChatsPage(), NotificationView(), ProfileView()],
      ),
      bottomNavigationBar: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: Colors.grey[200],
          child: BubbleBottomBar(
            opacity: 0.2,
            currentIndex: value,
            onTap: (tab) {
              controller.pageController.animateToPage(tab,
                  duration: controller.animationDuration, curve: Curves.ease);
              updateFn(tab);
            },
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            elevation: 8,
            // backgroundColor: Colors.red,
            hasInk: true, //new, gives a cute ink effect
            // inkColor: kprimaryColor, //oprional, uses theme color if not specified
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: KPrimaryColor,
                  icon: Icon(
                    LineIcons.home,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(LineIcons.home),
                  title: Text('Home')),
              BubbleBottomBarItem(
                  backgroundColor: KPrimaryColor,
                  icon: Icon(
                    LineIcons.sms,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(LineIcons.sms),
                  title: Text('Chat')),
              BubbleBottomBarItem(
                  backgroundColor: KPrimaryColor,
                  icon: Badge(
                    padding: EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 4.0, left: 5.0),
                    animationType: BadgeAnimationType.scale,
                    animationDuration: Duration(milliseconds: 200),
                    badgeContent: Text(
                      notficationController.myNotifications.length.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    child: Icon(
                      LineIcons.bell,
                      color: Colors.black54,
                    ),
                  ),
                  activeIcon: Icon(LineIcons.bell),
                  title: Text('Notification')),
              BubbleBottomBarItem(
                  backgroundColor: KPrimaryColor,
                  icon: Icon(
                    LineIcons.userAlt,
                    color: Colors.black54,
                  ),
                  activeIcon: Icon(LineIcons.userAlt),
                  title: Text('Profile')),
            ],
          ),
        ),
      ),
    );
  }
}
