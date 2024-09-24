import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cred/model/model.dart'; // Assuming this is where your ItemData model is


class EmiSelection extends StatefulWidget {
  final List<ItemData> items;
  final void Function(ItemData item) onItemClicked;

  const EmiSelection({super.key, required this.items,     required this.onItemClicked, // Initialize new callback
  });

  @override
  _EmiSelectionState createState() => _EmiSelectionState();
}

class _EmiSelectionState extends State<EmiSelection> {
  int? selectedEmiIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200, // Set height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isRecommended = item.tag?.toLowerCase() == 'recommended';
                final isSelected = selectedEmiIndex == index;
      
                return GestureDetector(
                  onTap: () {
                    widget.onItemClicked(item);
                    setState(() {
                      selectedEmiIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150, // Width for each item
                          decoration: BoxDecoration(
                            color: item.color, // Use color from ItemData
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            border: Border.all(
                              color: isSelected ? Colors.blue : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  if (isSelected)
                                    Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    item.emi ?? 'N/A',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              // Text(
                              //   item.duration ?? 'N/A',
                              //   style: TextStyle(fontSize: 14, color: Colors.grey),
                              // ),
                              SizedBox(height: 8),
                              Text(
                                item.title ?? 'N/A',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                item.subtitle ?? 'N/A',
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        if (isRecommended)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16.0),
                                  bottomLeft: Radius.circular(16.0),
                                ),
                              ),
                              child: Text(
                                'Recommended',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // if (selectedEmiIndex != null)
          //   Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text(
          //       'Selected EMI: ${widget.items[selectedEmiIndex!].emi ?? 'N/A'} for ${widget.items[selectedEmiIndex!].duration ?? 'N/A'}',
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //     ),
          //   )
          // else
          //   Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text(
          //       'No EMI selected',
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
