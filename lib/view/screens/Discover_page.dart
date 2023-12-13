import 'package:flutter/material.dart';
import 'package:sneakerapp/common/shoelist.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/cart_page.dart';

import 'package:sneakerapp/view/screens/filter_page.dart';
import 'package:sneakerapp/view/widgets/customtab.dart';
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
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.id);
                },
                child: Image.asset('assets/cart.png')),
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
                  Navigator.pushNamed(context, Filter.id,
                      arguments: dummyShoes);
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
