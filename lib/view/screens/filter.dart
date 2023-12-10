import 'package:flutter/material.dart';
import 'package:sneakerapp/view/screens/Homepage.dart';

class Filter extends StatefulWidget {
  static const String id = '/filter';

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String selectedBrand = '';
  RangeValues _priceRange = const RangeValues(0.0, 1750.0);
  String selectedSortOption = '';
  String selectedSortOption2 = '';
  String selectedSortOption3 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black45)),
              child: const Center(
                child: Text(
                  'RESET (4)',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, DiscoverPage.id, (route) => false),
              child: Container(
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
                        fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    buildBrandItem("NIKE", "1001 Items", "assets/logo1.png",
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
                const Text(
                  "Price Range",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildPriceRangeSlider(),
                const SizedBox(height: 25),
                const Text(
                  "Sort By",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildSortBySection(),
                const SizedBox(height: 25),
                const Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildGender(),
                const SizedBox(height: 25),
                const Text(
                  "Color",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                buildColor(),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              // color: isSelected ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 1,
                color: isSelected ? Colors.black : Colors.grey,
              )),
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
                SizedBox(
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
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              option,
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

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
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              option,
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

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
                  // fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
        SizedBox(height: 8),
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
