import 'package:flutter/material.dart';

class catagoerypage extends StatefulWidget {
  @override
  _CategorySelectionScreenState createState() =>
      _CategorySelectionScreenState();
      
}

class _CategorySelectionScreenState extends State<catagoerypage> {
  
  final List<Category> categories = [
    Category(name: 'Business', isSelected: true),
    Category(name: 'Covid-19', isSelected: true),
    Category(name: 'Crime', isSelected: true),
    Category(name: 'Editorials', isSelected: true),
    Category(name: 'Education', isSelected: false),
    Category(name: 'Entertainment', isSelected: false),
    Category(name: 'Health', isSelected: true),
    Category(name: 'International', isSelected: true),
    Category(name: 'Lifestyle', isSelected: true),
    Category(name: 'Regional', isSelected: true),
  ];

  bool selectAll = false;

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      for (var category in categories) {
        category.isSelected = selectAll;
      }
    });
  }

  void toggleCategorySelection(int index) {
    setState(() {
      categories[index].isSelected = !categories[index].isSelected;
      selectAll = categories.every((category) => category.isSelected);
    });
  }

  List<String> getSelectedCategories() {
    return categories
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
            )),
        title: Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Row(
            children: [
              Text('Select All'),
              Checkbox(
                value: selectAll,
                onChanged: (bool? value) {
                  toggleSelectAll();
                },
                activeColor: Colors.red,
                checkColor: Colors.white,
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: InkWell(
                      onTap: () => toggleCategorySelection(index),
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            right: 4,
                            child: Checkbox(
                              value: categories[index].isSelected,
                              onChanged: (bool? value) {
                                toggleCategorySelection(index);
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                List<String> selectedCategories = getSelectedCategories();
                print(selectedCategories);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Update',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  bool isSelected;

  Category({required this.name, this.isSelected = false});
  
}