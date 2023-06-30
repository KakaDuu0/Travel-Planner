import 'package:flutter/material.dart';

class BtnStyle extends ButtonStyle {
  const BtnStyle(this.size);

  final Size size;

  @override
  // TODO: implement fixedSize
  MaterialStateProperty<Size?>? get fixedSize => MaterialStateProperty.all<Size>(size);

  @override
  // TODO: implement foregroundColor
  MaterialStateProperty<Color?>? get foregroundColor => MaterialStateProperty.all<Color>(Colors.white);

  @override
  // TODO: implement overlayColor
  MaterialStateProperty<Color?>? get overlayColor => MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.grey.withOpacity(0.5);
            } else {
              return Colors.black;
            } 
          },
        );

  @override
  // TODO: implement backgroundColor
  MaterialStateProperty<Color?>? get backgroundColor => MaterialStateProperty.all<Color>(Colors.black);

  @override
  // TODO: implement shape
  MaterialStateProperty<OutlinedBorder?>? get shape => MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.height / 2),
      ),
    );

  
}