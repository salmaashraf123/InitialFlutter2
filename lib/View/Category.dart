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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
          childAspectRatio: 1 / 1
         ),
          itemCount: category.length,
          itemBuilder: (context, index) {
            String cat = category[index];
            return Column(
              children: [
                MaterialButton(
                    onPressed: (){
                      print (cat);
                      Navigator.of(context).pushNamed(
                        '/$cat',
                      );
                    },
                    child: Image.asset('images/$cat.jpg' ,width: 300, height: 100, fit: BoxFit.contain,alignment: Alignment.center,) ,
                ),
                SizedBox(height: 10,),
                Text(cat),
              ]
            );

        }
      )
    );
  }
}
