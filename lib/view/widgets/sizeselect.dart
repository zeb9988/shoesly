import 'package:flutter/material.dart';

class SizeSelectionRow extends StatelessWidget {
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  SizeSelectionRow({
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          buildSizeContainer('39'),
          SizedBox(
            width: 10,
          ),
          buildSizeContainer('40'),
          SizedBox(
            width: 10,
          ),
          buildSizeContainer('41'),
          SizedBox(
            width: 10,
          ),
          buildSizeContainer('42'),
          SizedBox(
            width: 10,
          ),
          buildSizeContainer('43'),
        ],
      ),
    );
  }

  Widget buildSizeContainer(String size) {
    bool isSelected = size == selectedSize;

    return GestureDetector(
      onTap: () {
        onSizeSelected(size);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.black26,
            width: 2.0,
          ),
          color: isSelected ? Colors.black : Colors.transparent,
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
