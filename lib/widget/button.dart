import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      {this.onPressed,
      this.label,
      this.backgroundColor,
      this.width,
      this.height,
      this.preload,
      this.icon,
      this.disabled = false,
      this.labelColor,
      this.borderColor});

  final GestureTapCallback onPressed;
  final String label;
  final double width;
  final double height;
  final bool preload;
  final Color backgroundColor;
  final Color labelColor;
  final Widget icon;
  final bool disabled;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final btnBackgoundColor = Color.fromRGBO(1, 178, 102, 1);
    return Container(
      width: this.width,
      height: this.height ?? 60.0,
      decoration: BoxDecoration(
          color: !disabled
              ? (this.backgroundColor != null
                  ? backgroundColor
                  : btnBackgoundColor)
              : Colors.grey,
          border: Border.all(
              color: borderColor != null
                  ? borderColor
                  : (backgroundColor != null
                      ? backgroundColor
                      : btnBackgoundColor),
              width: 2.0),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            onTap: !disabled ? onPressed : () {},
            child: Center(
              child: (preload == null || preload == false)
                  ? (this.icon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15),
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: this.icon,
                                    )),
                                new Expanded(
                                    flex: 3,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        this.label,
                                        style: TextStyle(
                                            color: !disabled
                                                ? (labelColor != null
                                                    ? labelColor
                                                    : Colors.white)
                                                : Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ))
                              ]))
                      : Text(
                          label,
                          style: TextStyle(
                              color: !disabled
                                  ? (labelColor != null
                                      ? labelColor
                                      : Colors.white)
                                  : Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ))
                  : Container(
                      child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              btnBackgoundColor)),
                      width: 20.0,
                      height: 20.0,
                      margin: EdgeInsets.only(left: 28, right: 28),
                    ),
            )),
      ),
    );
  }
}
