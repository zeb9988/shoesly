import 'package:flutter/material.dart';
import 'package:sneakerapp/common/shoelist.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/FilteredScreen.dart';

class Filter extends StatefulWidget {
  static const String id = '/filter';

  const Filter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  // State variables
  String selectedBrand = '';
  RangeValues _priceRange = const RangeValues(0.0, 1750.0);
  String selectedSortOption = '';
  String selectedSortOption2 = '';
  String selectedSortOption3 = '';
  double reset = 0;
  List<Shoe> filteredShoes = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredShoes with allShoes initially
    filteredShoes = dummyShoes;
  }

  void updateFilteredShoes() {
    setState(() {
      filteredShoes = _performFiltering();
      _performSorting();
    });

    // Navigate to the new screen displaying filtered products
    Navigator.pushNamed(context, FilteredProductsScreen.id,
        arguments: filteredShoes);
  }

  List<Shoe> _performFiltering() {
    List<Shoe> result = dummyShoes;

    // Filter based on selectedBrand
    if (selectedBrand.isNotEmpty) {
      result = result.where((shoe) => shoe.brand == selectedBrand).toList();
    }

    // Filter based on price range
    result = result
        .where((shoe) =>
            shoe.price >= _priceRange.start && shoe.price <= _priceRange.end)
        .toList();

    // Add more filtering logic based on other selected filters

    return result;
  }

  void _performSorting() {
    switch (selectedSortOption) {
      case 'Most Recent':
        // Implement sorting logic for most recent
        filteredShoes.sort((a, b) => b.id.compareTo(a.id));
        break;
      case 'Lowest Price':
        // Implement sorting logic for lowest price
        filteredShoes.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Highest Reviews':
        // Implement sorting logic for highest reviews
        filteredShoes
            .sort((a, b) => b.averageRating.compareTo(a.averageRating));
        break;
      // Add more sorting options as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold widget with AppBar, BottomNavigationBar, and body
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        title: const Text(
          'Filter',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        // Bottom navigation bar with RESET and Apply buttons
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // RESET button
            Container(
              // Container for RESET button
              padding: const EdgeInsets.all(16.0),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black45),
              ),
              child: const Center(
                child: Text(
                  'RESET (4)',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            // Apply button
            InkWell(
              onTap: () {
                updateFilteredShoes();
              },
              child: Container(
                // Container for Apply button
                padding: const EdgeInsets.all(16.0),
                width: 150,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // SingleChildScrollView to allow scrolling
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brands section
                const Text(
                  "Brands",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Brand items
                    buildBrandItem("Nike", "1001 Items", "assets/logo1.png",
                        "assets/vector.png"),
                    buildBrandItem("Puma", "601 Items", "assets/logo2.png",
                        "assets/vector.png"),
                    buildBrandItem("Adidas", "709 Items", "assets/logo3.png",
                        "assets/vector.png"),
                    buildBrandItem("Reebok", "555 Items", "assets/logo4.png",
                        "assets/vector.png"),
                    buildBrandItem("Jordan", "800 Items", "assets/logo1.png",
                        "assets/vector.png"),
                  ],
                ),
                const SizedBox(height: 16),
                // Price Range section
                const Text(
                  "Price Range",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildPriceRangeSlider(), // Price Range Slider
                const SizedBox(height: 25),
                // Sort By section
                const Text(
                  "Sort By",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildSortBySection(), // Sort By Options
                const SizedBox(height: 25),
                // Gender section
                const Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildGender(), // Gender Options
                const SizedBox(height: 25),
                // Color section
                const Text(
                  "Color",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildColor(), // Color Options
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build Color Options
  Widget buildColor() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildColorSortOption("black", Colors.black),
          buildColorSortOption("white", Colors.white),
          buildColorSortOption("red", Colors.red),
        ],
      ),
    );
  }

  // Widget to build individual Color Option
  Widget buildColorSortOption(String option, Color color) {
    bool isSelected = selectedSortOption3 == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSortOption3 = isSelected ? '' : option;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 2,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 15, // Adjust the size as needed
                  height: 15,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build Gender Options
  Widget buildGender() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildGenderSortOption("Man"),
          buildGenderSortOption("Women"),
          buildGenderSortOption("Unisex"),
        ],
      ),
    );
  }

  // Widget to build individual Gender Option
  Widget buildGenderSortOption(String option) {
    bool isSelected = selectedSortOption2 == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSortOption2 = isSelected ? '' : option;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 1,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              option,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build Sort By Options
  Widget buildSortBySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildSortOption("Most Recent"),
          buildSortOption("Lowest Price"),
          buildSortOption("Highest Reviews"),
        ],
      ),
    );
  }

  // Widget to build individual Sort By Option
  Widget buildSortOption(String option) {
    bool isSelected = selectedSortOption == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSortOption = isSelected ? '' : option;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 1,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              option,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build individual Brand Item
  Widget buildBrandItem(String brandName, String itemCount, String ellipseImage,
      String vectorImage) {
    bool isSelected = selectedBrand == brandName;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBrand = isSelected ? '' : brandName;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(31, 109, 107, 107),
                ),
                child: Image.asset(
                  ellipseImage,
                  width: 50,
                  height: 50,
                ),
              ),
              if (isSelected)
                Positioned(
                  child: Image.asset(
                    vectorImage,
                    width: 24,
                    height: 18.580644607543945,
                  ),
                ),
            ],
          ),
          Column(
            children: [
              Text(
                brandName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                itemCount,
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build Price Range Slider
  Widget buildPriceRangeSlider() {
    return Column(
      children: [
        const SizedBox(height: 8),
        RangeSlider(
          values: _priceRange,
          onChanged: (values) {
            setState(() {
              _priceRange = values;
            });
          },
          min: 0.0,
          max: 1750.0,
          divisions: 100,
          labels: RangeLabels(
            _priceRange.start.toStringAsFixed(1),
            _priceRange.end.toStringAsFixed(1),
          ),
          activeColor: Colors.black,
          inactiveColor: Colors.black12,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${_priceRange.start.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.black45),
            ),
            Text(
              '\$${_priceRange.end.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ],
    );
  }
}
