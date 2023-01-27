import 'package:flutter/material.dart';
import 'package:dev_hackathon/worksInCategory.dart';

class ItemCategory extends StatefulWidget {
  const ItemCategory({Key? key,
    required this.imageURL,
    required this.category}) : super(key: key);

  final imageURL;
  final category;

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WorksInCategory(title: widget.category, title_code: widget.imageURL,)));
      },
      child: Container(
        width: 110,
        height: 140,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: const Offset(5, 5),
              blurRadius: 2.0,
              spreadRadius: 0
            )
          ]
        ),
        child: Column(
          children: [
            Container(
              width: 110,
              height: 100,
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
                child: Image(
                  image: AssetImage(
                    'assets/images/${widget.imageURL}.png'
                  ),
                ),
              )
            ),
            Container(
              child: Text(
                widget.category,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                  "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemCategory(imageURL: "farming", category: "Farming",),
                ItemCategory(imageURL: "kitchen", category: "Chef",),
                ItemCategory(imageURL: "mining", category: "Mining",),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemCategory(imageURL: "nuclear", category: "Nuclear",),
                ItemCategory(imageURL: "shipping", category: "Shipping",),
                ItemCategory(imageURL: "waste_management", category: "Waste Management",),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemCategory(imageURL: "pest_control", category: "Pest Control",),
                ItemCategory(imageURL: "transportation", category: "Transportation",),
                ItemCategory(imageURL: "construction", category: "Contruction",),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
