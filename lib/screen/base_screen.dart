// import 'package:cred/widget/bottom_sheet.dart';
// import 'package:flutter/material.dart';
//
// class BaseScreen extends StatefulWidget {
//   final List<dynamic> data; // Declare the data field
//   const BaseScreen({super.key, required this.data});
//
//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }
//
// class _BaseScreenState extends State<BaseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(46, 44, 44, 100),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     Icons.cancel,
//                     size: 30.0,
//                     color: Colors.grey,
//                   ),
//                   Icon(
//                     Icons.help,
//                     size: 30.0,
//                     color: Colors.grey,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//             ]),
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(46, 44, 44, 50),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       widget.data[0]['open_state']['body']['title'],
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     subtitle: Text(
//                       widget.data[0]['open_state']['body']['subtitle'],
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const Bottom_Sheet(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cred/widget/card.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_sheet.dart';
import '../widget/custom_button.dart';

class BaseScreen extends StatefulWidget {
  final List<dynamic> data; // Declare the data field
  const BaseScreen({super.key, required this.data});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    // BottomSheet bottomSheet = BottomSheet(); // Create an instance of the Bottom_Sheet

    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 44, 44, 100),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top section with icons
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.cancel,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.help,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),

          // Main content area with dynamic allocation
          Expanded(
            child: Container(
              width: double.infinity,
              // height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(46, 44, 44, 50),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      widget.data[0]['open_state']['body']['title'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      widget.data[0]['open_state']['body']['subtitle'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 450, // Set a specific height for the bottom sheet
                      child: Card_Sheet(data1: widget.data),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     BottomSheetHelper.showBottomSheet(context, widget.data[1]);
                  //   },
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 90,
                  //     padding: EdgeInsets.symmetric(horizontal: 20),
                  //     decoration: BoxDecoration(
                  //       color: Colors.blue,
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(20.0),
                  //         topRight: Radius.circular(20.0),
                  //       ),
                  //     ),
                  //     child: const Center(
                  //         child: Text(
                  //       'Proceed to EMI Selection',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         color: Colors.white,
                  //       ),
                  //     )),
                  //   ),
                  // ),

                ],
              ),
            ),
          ),
          CustomButton(
            text: 'Proceed to EMI Selection',
            onPressed: () {
              // Your button press logic
              BottomSheetHelper.showBottomSheet(context, widget.data);
            },
          ),
        ],
      ),
    );
  }
}

// return ListView.builder(
//   itemCount: data.length,
//   itemBuilder: (context, index) {
//     final item = data[index];
//     return ListTile(
//       title: Text(item['open_state']['body']['title']),
//       subtitle: Text(item['open_state']['body']['subtitle']),
//     );
//   },
// );

// child: ListView.builder(
//   itemCount: widget.data.length,
//   itemBuilder: (context, index) {
//     final item = widget.data[index];
//     return ListTile(
//       title: Text(item['open_state']['body']['title']),
//       subtitle: Text(item['open_state']['body']['subtitle']),
//     );
//   },
// ),





// BottomSheetHelper.showBottomSheet(context);