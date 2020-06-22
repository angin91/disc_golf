import 'dart:async';

import 'package:flutter/material.dart';

class MSwitch extends StatefulWidget {
  final Function onChange;
  final bool value, round;
  final Color activeColor;
  final Color unActiveColor;
  final double width, height;
  MSwitch(
      {this.value,
        this.onChange,
        this.activeColor = Colors.green,
        this.unActiveColor = Colors.grey,
        this.width = 40,
        this.height = 20,
        this.round = true});
  @override
  _MSwitchState createState() => _MSwitchState();
}

class _MSwitchState extends State<MSwitch> {
  ScrollController controller = ScrollController();
  bool value;
  @override
  void initState() {
    value = widget.value ?? false;
    super.initState();
    if (value)
      Timer(Duration(milliseconds: 1), () {
        controller.animateTo(controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      });
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = (widget.width - (widget.height / 2)) * 2;
    return GestureDetector(
        onTap: () {
          setState(() {
            value = !value;
          });
          if (widget.onChange != null) widget.onChange(value);

          if (controller.position.pixels == 0) {
            controller.animateTo(controller.position.maxScrollExtent,
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          } else {
            controller.animateTo(0,
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.height),
          child: Container(
            color: Colors.white,
            width: widget.width,
            height: widget.height,
            child: ScrollConfiguration(
              behavior: CustomBehavior(),
              child: ListView(
                controller: controller,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    width: fullWidth,
                    height: widget.height,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: fullWidth / 2),
                          width: fullWidth / 2,
                          height: widget.height,
                          color: widget.activeColor,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: fullWidth / 2),
                          width: fullWidth / 2,
                          height: widget.height,
                          color: widget.unActiveColor,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: (fullWidth / 2) - (widget.height / 2)),
                          width: widget.height,
                          height: widget.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  widget.round ? widget.height : 0),
                              color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
class CustomBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
