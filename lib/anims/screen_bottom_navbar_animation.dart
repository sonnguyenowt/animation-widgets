import 'dart:ui';

import '/anims/shake_animation.dart';
import '/anims/ripple_animation.dart';
import 'package:flutter/material.dart';

class ScreenBottomNavbarAnimation extends StatefulWidget {
  const ScreenBottomNavbarAnimation({super.key});

  @override
  State<ScreenBottomNavbarAnimation> createState() =>
      _ScreenBottomNavbarAnimationState();
}

class _ScreenBottomNavbarAnimationState
    extends State<ScreenBottomNavbarAnimation> {
  int selectedIndex = 0;
  var icons = [
    Icons.nightlight_round,
    Icons.music_note_rounded,
    Icons.sunny,
    Icons.color_lens_rounded,
  ];

  var colors = [
    const Color(0xffE099FD),
    const Color.fromARGB(255, 129, 194, 255),
    const Color.fromARGB(255, 255, 151, 104),
    const Color.fromARGB(255, 252, 76, 76),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff34325E),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Column(
                children: [
                  Text(
                    "Tab $selectedIndex",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                    ),
                  ),
                  ShakeWidget(
                    repeat: true,
                    duration: const Duration(seconds: 2),
                    amplitude: 2,
                    child: RippleAnimation(
                      repeat: true,
                      ripplesCount: 3,
                      minRadius: 20,
                      color: Colors.pink,
                      child: CircleAvatar(
                        backgroundColor: Colors.pink.withOpacity(0.8),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // _bottomAppbarAnim(icons, colors, width: 250),
            const SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }

  Widget _bottomAppbarAnim(List<IconData> icons, List<Color> colors,
      {double width = 300}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff020925),
        borderRadius: BorderRadius.circular(100),
      ),
      width: width,
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < icons.length; i++)
                GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = i;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      bottom: i == selectedIndex ? 16 : 0,
                      left: 8,
                      right: 8,
                    ),
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return i == selectedIndex
                                ? LinearGradient(
                                    colors: [
                                      colors[i].withAlpha(150),
                                      colors[i],
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    tileMode: TileMode.mirror,
                                  ).createShader(bounds)
                                : const LinearGradient(
                                    colors: [
                                      Color(0xff54597C),
                                      Color(0xff54597C),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    tileMode: TileMode.mirror,
                                  ).createShader(bounds);
                          },
                          child: Icon(
                            icons[i],
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
                            child: Container(
                              color: Colors.black.withOpacity(0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          AnimatedPositioned(
            left: selectedIndex * (width - 26 * 2) / 3 + 26 - 3,
            bottom: 0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: CircleAvatar(
                radius: 3,
                backgroundColor: Color(0xff54597C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
