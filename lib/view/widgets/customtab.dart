import 'package:flutter/material.dart';

class CustomTab extends StatefulWidget {
  final String text;
  final int index;
  final TabController tabController;

  const CustomTab({
    Key? key,
    required this.text,
    required this.index,
    required this.tabController,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  // Color _backgroundColor = Colors.transparent;
  Color _textColor = Colors.black26;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_handleTabControllerChange);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabControllerChange);
    super.dispose();
  }

  void _handleTabControllerChange() {
    if (widget.tabController.index == widget.index) {
      setState(() {
        _textColor = Colors.black;
      });
    } else {
      setState(() {
        _textColor = Colors.black26;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.tabController.animateTo(widget.index);
      },
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  // color: _backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 16,
                right: 16,
                child: AnimatedContainer(
                  height: 2,
                  duration: const Duration(milliseconds: 300),
                  // color: _backgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
