import 'package:cred/widget/slider/circular_slider.dart';
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



class BottomSheet extends StatelessWidget {
  final List<dynamic> emiData; // Add a data field to accept data

  const BottomSheet({super.key, required this.emiData}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6, // Set height to 30% of the screen
      // height: 400,
      width: double.infinity,

      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),

          Text(
            emiData[1]['open_state']['body']['title'],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            emiData[1]['open_state']['body']['subtitle'],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 150,
            width: 150,
            color: Colors.blue,
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {},
              child: Text('Change account'),
          ),
          SizedBox(height: 25,),
          CustomButton(
            text: emiData[1]['cta_text'],
            onPressed: () {
              BottomSheetHelper2.showSecondBottomSheet(context, emiData);
            },
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