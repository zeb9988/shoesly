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

Widget _buildPayment() {
  return Column(
    children: [
      Container(
        width: 375,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      const Column(
        children: [
          Row(
            children: [
              Text(
                'Payment',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Grand Total',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Text(
              //   '\$$totalOrder',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    ],
  );
}
