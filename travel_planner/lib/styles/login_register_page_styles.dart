import 'package:flutter/material.dart';

class CustomInputDecoration extends InputDecoration {
  const CustomInputDecoration(this.role, this.errorMessage);

  final String role;
  final String errorMessage;

  @override
  bool? get filled => true;

  @override
  Color? get fillColor => Colors.white;

  @override
  Color? get hoverColor => Colors.white;

  @override
  Color? get focusColor => Colors.white;

  @override
  EdgeInsetsGeometry? get contentPadding =>
      const EdgeInsets.only(left: 25, bottom: 10);

  @override
  InputBorder? get border => UnderlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      );

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 2,
        ),
      );

  @override
  InputBorder? get errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      );

  @override
  InputBorder? get focusedErrorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      );

  @override
  String? get hintText => role;

  @override
  String? get errorText => errorMessage == '' ? null : errorMessage;

  @override
  FloatingLabelBehavior? get floatingLabelBehavior =>
      FloatingLabelBehavior.never;

  @override
  Widget? get suffixIcon => role == 'Username'
      ? const Icon(Icons.person)
      : (role == 'Email'
          ? const Icon(Icons.email)
          : const Icon(Icons.key_rounded));
}
