import 'dart:math';
import 'package:flutter/material.dart';

import 'bottom_sheet2.dart';
import 'custom_button.dart';

// class Bottom_Sheet extends StatelessWidget {
//   final String footer;
//
//   const Bottom_Sheet({super.key, required this.footer});
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen height using MediaQuery
//     double screenHeight = MediaQuery.of(context).size.height;
//
//
//     return return Container(
//       color: Color.fromRGBO(46, 44, 44, 50),
//       child: Container(
//           height: 200, // 60% of the screen height
//           padding: EdgeInsets.all(30.0),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20.0),
//                 topRight: Radius.circular(20.0),
//               )),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//
//               SizedBox(height: 20.0), // Add spacing before the RadialSliderScreen
//               // Use Flexible to prevent overflow
//               // Flexible(
//               //   child: RadialSliderScreen(),
//               // ),
//
//
//               SizedBox(height: 20.0),
//               Text(footer.toString()),
//             ],
//           )
//       ),
//     );
//   }
// }






// class Bottom_Sheet extends StatefulWidget {
//   // final List<dynamic> data1;
//
//   const Bottom_Sheet({super.key});
//
//   @override
//   _Bottom_SheetState createState() => _Bottom_SheetState();
// }
//
// class _Bottom_SheetState extends State<Bottom_Sheet> {
//
//   void showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       backgroundColor: Colors.white,
//       context: context,
//       isScrollControlled: true, // Allows the sheet to adjust dynamically
//       enableDrag: false, // Prevents the bottom sheet from being dragged down
//       isDismissible: true, // Allow dismissing by tapping outside
//       builder: (context) => WillPopScope(
//         onWillPop: () async => true, // Allows back button to close the sheet
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.3, // Set height to 30% of the screen
//           padding: EdgeInsets.all(30.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.0),
//               topRight: Radius.circular(20.0),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 20.0), // Add spacing
//               Text(
//                 'Hello',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('done');
//   }
// }



class BottomSheet extends StatefulWidget {
  final List<dynamic> emiData; // Add a data field to accept data

  const BottomSheet({super.key, required this.emiData});
  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  int? selectedIndex; // Track the selected container
  late List<Color> containerColors; // Store colors for containers

  @override
  void initState() {
    super.initState();
    containerColors = generateContainerColors();
  }

  List<Color> generateContainerColors() {
    final List<Color> colorList = [
      Colors.blue,
      Colors.brown,
      Colors.purple,
      Colors.red,
      Colors.pink,
    ];

    Random random = Random(); // For generating random numbers
    return List.generate(
      widget.emiData[1]['open_state']['body']['items'].length,
          (index) => colorList[random.nextInt(colorList.length)],
    );
  }

  @override
  Widget build(BuildContext context) {
    // // List of colors for random assignment
    // final List<Color> colorList = [
    //   Colors.blue,
    //   Colors.green,
    //   Colors.orange,
    //   Colors.purple,
    //   Colors.red,
    //   Colors.pink,
    // ];
    //
    // Random random = Random(); // For generating random numbers

    return Container(
      height: MediaQuery.of(context).size.height * 0.7, // Set height to 30% of the screen
      // height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  widget.emiData[1]['open_state']['body']['title'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  widget.emiData[1]['open_state']['body']['subtitle'],
                  style: TextStyle(
                    color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 10,),
                // Display the Containers in a Row with selection check
                // Display the Containers in a Row with selection check
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      widget.emiData[1]['open_state']['body']['items'].length,
                          (index) {
                        var item = widget.emiData[1]['open_state']['body']['items'][index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: containerColors[index], // Use pre-generated color
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['emi'] ?? 'No EMI',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '  for ' +item['duration'] ?? 'No EMI',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      item['subtitle'] ?? 'No EMI',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                if (selectedIndex == index) // Show check mark if selected
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Change account'),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Expanded(
            child: CustomButton(
              text: widget.emiData[1]['cta_text'],
              onPressed: () {
                BottomSheetHelper2.showSecondBottomSheet(context, widget.emiData);
              },
            ),
          ),
        ],
      ),
    );
  }
}



class BottomSheetHelper {
  static void showBottomSheet(BuildContext context, dynamic emiData) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // Allows the sheet to adjust dynamically

      builder: (context) => WillPopScope(
        onWillPop: () async => true, // Allows back button to close the sheet
        child: BottomSheet(emiData : emiData), // Pass the data here
      ),
    );
  }
}