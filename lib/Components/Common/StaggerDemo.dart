import 'package:flutter/material.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key? key, required this.controller, required this.title, required this.contents})
      :
        height = Tween<double>(begin: 60.0, end: 200).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.5,
              curve: Curves.ease,
            ),
          ),
        ),
        opacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.5,
              1.0,
              curve: Curves.ease,
            ),
          ),
        ),
  // padding = EdgeInsetsTween(
  //   begin: const EdgeInsets.only(bottom: 16.0),
  //   end: const EdgeInsets.only(bottom: 75.0),
  // ).animate(
  //   CurvedAnimation(
  //     parent: controller,
  //     curve: const Interval(
  //       0.250,
  //       0.375,
  //       curve: Curves.ease,
  //     ),
  //   ),
  // ),

        super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> height;
  final Widget title;
  final Widget contents;
  bool visibility =false;
  //final Animation<EdgeInsets> padding;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    visibility = !visibility;
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        height: height.value,
        decoration: BoxDecoration(
          color: AppColors.backgroundColorWhite,
          boxShadow: [Shadows.whiteBackgroundShadow],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              child: Wrap(
                children: [
                  title,
                  Opacity(
                      opacity: opacity.value,
                      child: contents
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  StaggerDemo({Key? key, required this.title, required this.contents}){

  }

  final Widget title;
  final Widget contents;
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final timeDilation = 10.0;
  bool isOpened = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<void> _reverseAnimation() async {
    try {
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }
  @override
  Widget build(BuildContext context) {
    // 1.0 is normal animation speed.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        isOpened = !isOpened;
        isOpened ? _reverseAnimation(): _playAnimation() ;
      },
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.none,

        child: StaggerAnimation(controller: _controller.view, title: widget.title,contents: widget.contents, ),
      ),
    );
  }
}