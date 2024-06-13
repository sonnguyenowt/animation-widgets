import 'dart:math';

import 'package:flutter/material.dart';

class BottomNavbarFloatingAnimation extends StatefulWidget {
  const BottomNavbarFloatingAnimation({super.key});

  @override
  State<BottomNavbarFloatingAnimation> createState() =>
      _BottomNavbarFloatingAnimationState();
}

class _BottomNavbarFloatingAnimationState
    extends State<BottomNavbarFloatingAnimation> {
  bool isExpanded = false;
  double bottom = 50;

  var items = [
    Icons.home,
    Icons.shop,
    Icons.notifications_active,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 400),
              turns: isExpanded ? 0 : 0.5,
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 400),
              turns: isExpanded ? -0.5 : 0.5,
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 400),
              turns: isExpanded ? 0 : -0.5,
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform.rotate(
                      angle: -pi / 4,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: 0,
                      child: Container(
                        height: 100,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.qr_code,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi / 4,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.cabin_sharp,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 80,
            child: Row(
              children: [
                for (var i = 0; i < items.length / 2; i++)
                  Expanded(child: _itemButton(items[i])),
                const SizedBox(width: 60),
                for (int j = items.length ~/ 2; j < items.length; j++)
                  Expanded(child: _itemButton(items[j])),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: bottom - 30 / 2),
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: const CircleAvatar(
                radius: 30,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemButton(IconData icon) {
    return IconButton(onPressed: () {}, icon: Icon(icon));
  }
}
