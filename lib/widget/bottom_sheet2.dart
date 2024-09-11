import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_button.dart';

class BottomSheet2 extends StatefulWidget {
  final List<dynamic> emiData; // Add a data field to accept data

  const BottomSheet2({super.key, required this.emiData});
  @override
  State<BottomSheet2> createState() => _BottomSheet2State();
}

class _BottomSheet2State extends State<BottomSheet2> {
  bool isSelected = false; // To track if the checkbox is selected

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.6, // Set height to 30% of the screen
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
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.emiData[2]['open_state']['body']['title'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5.0,),
                Text(
                  widget.emiData[2]['open_state']['body']['subtitle'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Leading part (Icon)
                        Icon(
                            Icons.food_bank,
                            size: 40,
                            color: Colors.blue
                        ),
                        SizedBox(width: 10),
                        // Middle part (Title and Subtitle)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.emiData[2]['open_state']['body']['items'][0]['title'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.emiData[2]['open_state']['body']['items'][0]['subtitle'].toString(),
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Trailing part (Circular checkbox for selection)
                    Checkbox(
                      shape: CircleBorder(), // To make it circular
                      value: isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          isSelected = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Change account'),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Expanded(
            child: CustomButton(
              text: widget.emiData[2]['cta_text'],
              onPressed: () {
                // BottomSheetHelper2.showBottomSheet(context, emiData);
              },
            ),
          ),
        ],
      ),
    );
  }
}



class BottomSheetHelper2 {
  static void showSecondBottomSheet(BuildContext context, dynamic emiData) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // Allows the sheet to adjust dynamically

      builder: (context) => WillPopScope(
        onWillPop: () async => true, // Allows back button to close the sheet
        child: BottomSheet2(emiData : emiData), // Pass the data here
      ),
    );
  }
}