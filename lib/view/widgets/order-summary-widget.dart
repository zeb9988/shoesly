// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildPaymentDetailRow(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black45),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
