import 'package:flutter/material.dart';

import 'AlertStyle.dart';

/// Main class to create alerts.
///
/// You must call the "show()" method to view the alert class you have defined.
class Alert {
  final BuildContext context;
  final AlertStyle style;
  final Image image;
  final String title;
  final String desc;
  final Widget content;
  final Function closeFunction;

  /// Alert constructor
  ///
  /// [context], [title] are required.
  Alert({
    @required this.context,
    this.style = const AlertStyle(),
    this.image,
    @required this.title,
    this.desc,
    this.content,
    this.closeFunction,
  });

  /// Displays defined alert window
  Future<bool> show() async {
    return await showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return _buildDialog();
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: style.overlayColor,
      transitionDuration: style.animationDuration,
      transitionBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) =>
          _showAnimation(animation, secondaryAnimation, child),
    );
  }

// Will be added in next version.
  // void dismiss() {
  //   Navigator.pop(context);
  // }

  // Alert dialog content widget
  Widget _buildDialog() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: double.infinity, height: double.infinity),
        child: Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: Theme.of(context).dialogBackgroundColor,
              shape: _defaultShape(),
              titlePadding: EdgeInsets.all(0.0),
              title: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _getCloseButton(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            20, 20, 20, 0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              title,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            desc == null
                                ? Container()
                                : Text(
                              desc,
                              textAlign: TextAlign.center,
                            ),
                            content == null ? Container() : content,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
//              contentPadding: style.buttonAreaPadding,
//              content: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: _getButtons(),
//              ),
            ),
          ),
        ),
      ),
    );
  }

  // Returns alert default border style
  ShapeBorder _defaultShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.blueGrey,
      ),
    );
  }

// Returns the close button on the top right
  Widget _getCloseButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: Container(
        alignment: FractionalOffset.topRight,
        child: Container(
          width: 20,
          height: 20,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Icon(Icons.clear, color: Colors.grey,),
              onTap: () {
                Navigator.pop(context);
                closeFunction();
              },
            ),
          ),
        ),
      ),
    );
  }

// Shows alert with selected animation
  _showAnimation(animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
  }
}
