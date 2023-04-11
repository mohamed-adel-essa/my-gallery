import 'package:flutter/material.dart';

void setErroBuilder() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      color: Colors.green,
      child: Center(
        child: Text(
          details.exception.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  };
}
