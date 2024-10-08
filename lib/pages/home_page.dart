import 'package:flutter/material.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';

 class HomePage extends StatelessWidget {
   const HomePage({super.key});

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: DefaultTabController(
           length: 3,
           child: Scaffold(
             appBar: AppBar(
               bottom: const TabBar(
                 tabs: [
                   Tab(icon: Icon(Icons.face)),
                   Tab(icon: Icon(Icons.security)),
                   Tab(icon: Icon(Icons.verified_outlined)),
                 ],
               ),
               title: const Text('Tabs Demo'),
             ),
             body: const TabBarView(
               children: [
                 FirstPage(),
                 SecondPage(
                   title: 'sss',
                   text: 100,
                 ),
                 ThirdPage(
                   text: 'text',
                   title: 'title',
                 ),
               ],
             ),
           ),
         ),
     );
   }

 }
