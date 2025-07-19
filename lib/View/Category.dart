import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var category = [
      'medicine',
      'skincare',
      'personal care',
      'baby care',
      'haircare',
      'other',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
          ),
          itemCount: category.length,
          itemBuilder: (context, index) {
            String cat = category[index];
            return Column(
              children: [
                Container(
                  width: 150,
                  height: 165,
                  decoration: BoxDecoration(
                    // boxShadow: [BoxShadow(offset: Offset(0 , 0) , color: Color.fromRGBO(55, 6, 6, 0.2) , spreadRadius: 3, )],
                    color : Color.fromRGBO(55, 6, 6, 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          print(cat);
                          Navigator.of(context).pushNamed('/$cat');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/$cat.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(cat , style: TextStyle(color: Color.fromRGBO(55, 6, 6, 1) , fontWeight: FontWeight.bold , fontSize: 18)),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
