import 'package:flutter/material.dart';

import 'package:sneakerapp/view/screens/filter.dart';
import 'package:sneakerapp/view/widgets/shoegrid.dart';

class DiscoverPage extends StatefulWidget {
  static const String id = '/homepage';
  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/cart.png'),
          )
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 150,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/filter.png',
                color: Colors.white,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Filter.id);
                },
                child: const Text(
                  'Filter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomTab(
                            text: 'All',
                            index: 0,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: 'Nike',
                            index: 1,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: 'Adidas',
                            index: 2,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: 'Reebok',
                            index: 3,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: 'Jordan',
                            index: 4,
                            tabController: _tabController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ShoeGrid(), // Display all shoes initially
                    ShoeGrid(filterBrand: 'Nike'),
                    ShoeGrid(filterBrand: 'Adidas'),
                    ShoeGrid(filterBrand: 'Reebok'),
                    ShoeGrid(filterBrand: 'Jordan'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Nike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Jordan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Adidas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Reebok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FilterTab extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;

  const FilterTab({
    Key? key,
    required this.iconData, // Pass the icon data
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5), // Customize the border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Customize the shadow color
            spreadRadius: 2, // Customize the shadow spread radius
            blurRadius: 4, // Customize the shadow blur radius
            offset: const Offset(0, 2), // Customize the shadow offset
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Icon(
              iconData, // Use the provided icon data
              size: 24, // Customize the icon size
              color: Colors.black, // Customize the icon color
            ),
          ),
        ),
      ),
    );
  }
}

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
