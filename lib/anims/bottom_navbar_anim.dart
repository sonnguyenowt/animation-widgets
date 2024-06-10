import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNavbarAnim extends StatefulWidget {
  final double width;
  final Function(int)? onChange;
  const BottomNavbarAnim({super.key, this.width = 300, this.onChange});

  @override
  State<BottomNavbarAnim> createState() => _BottomNavbarAnimState();
}

class _BottomNavbarAnimState extends State<BottomNavbarAnim> {
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff020925),
        borderRadius: BorderRadius.circular(100),
      ),
      width: widget.width,
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
                    widget.onChange?.call(i);
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
            left: selectedIndex * (widget.width - 26 * 2) / 3 + 26 - 3,
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
