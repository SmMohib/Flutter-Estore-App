import 'package:flutter/material.dart';
import 'package:practice/const/color.dart';
import 'package:practice/pages/search/search.dart';

import 'package:practice/widgets/categories_list.dart';
import 'package:practice/widgets/customText.dart';
import 'package:practice/widgets/products_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
      children: <Widget>[
        HeaderSection(),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Column(
              children: <Widget>[
                // Categories List (Horizontal)
                SizedBox(
                  height: 170,
                  child: CategoriesList()
                ),
                // Products List (Vertical)
                Expanded(
                  child: ProductsList(), 
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: const Column(children: <Widget>[
          SearchBar(),
          Header()
        ]),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
     child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => {
                  Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Search(
                                   
                  ),
                  ))
              },
              child: Container(
                height: 55.0,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                     customText('Search products ...', 15,const Color.fromARGB(239, 15, 15, 15),FontWeight.w500)
                    
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 55.0,
            padding: EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(onPressed: () {
            }, icon: const Icon(Icons.tune,color: whiteColor,)),
          ),
          const SizedBox(width: 10),
           Container(
            height: 55.0,
            padding: EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(
             color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(onPressed: () {
            }, icon: const Icon(Icons.notifications,color: whiteColor,)),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:0);
  }
}
