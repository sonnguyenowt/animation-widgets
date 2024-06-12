import 'package:anim_app/anims/bottom_navbar_anim.dart';

import '/anims/shake_animation.dart';
import '/anims/ripple_animation.dart';
import 'package:flutter/material.dart';

import 'bottom_navbar_floating_anim.dart';

class ScreenBottomNavbarAnimation extends StatelessWidget {
  const ScreenBottomNavbarAnimation({super.key});

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
            const BottomNavbarFloatingAnimation(),
            const SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
