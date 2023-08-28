import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  final String name;
  final bool isSwitchable;
  final List values;
  final bool first;
  final bool last;

  final void Function(String, dynamic) updateValue;

  const Setting(
      {super.key,
      required this.name,
      required this.isSwitchable,
      this.values = const [],
      required this.updateValue,
      this.first = false,
      this.last = false});

  @override
  State<StatefulWidget> createState() => SettingState();
}

class SettingState extends State<Setting> {
  bool switchState = false;
  var crtVal = 0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        //padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      //margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.first ? 15 : 0),
          topRight: Radius.circular(widget.first ? 15 : 0),
          bottomLeft: Radius.circular(widget.last ? 15 : 0),
          bottomRight: Radius.circular(widget.last ? 15 : 0),
        ),
        color: Colors.black54,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          widget.isSwitchable
              ? CupertinoSwitch(
                  value: switchState,
                  onChanged: (value) {
                    setState(() {
                      switchState = !switchState;
                      widget.updateValue(widget.name, switchState);
                    });
                  },
                  activeColor: Colors.green,
                )
              : CupertinoButton(
                  child: Text(
                    widget.values[crtVal].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => _showDialog(
                    CupertinoPicker(
                      backgroundColor: Colors.black87,
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: 32,
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          crtVal = selectedItem;
                          widget.updateValue(widget.name, crtVal);
                        });
                      },
                      scrollController: FixedExtentScrollController(
                        initialItem: crtVal,
                      ),
                      children: List<Widget>.generate(widget.values.length,
                          (int index) {
                        return Center(
                          child: Text(
                            widget.values[index].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
