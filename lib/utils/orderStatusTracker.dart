import 'package:flutter/material.dart';

class CustomOrderTracker extends StatelessWidget {
  final int status; // The current order status index (0 to 4)

  CustomOrderTracker({required this.status});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    List<String> statusLabels = [
      "Ordered",
      "Confirmed",
      "Shipped",
      "Out for Delivery",
      "Delivered"
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(statusLabels.length, (index) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // The vertical line between nodes
                    if (index != statusLabels.length - 1)
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: w * 0.07,
                        child: Container(
                          height: 60,
                          width: 2,
                          color: index < status
                              ? Colors.green
                              : Colors.grey.shade300,
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                width: 2,
                                color: index < status
                                    ? Colors.green
                                    : Colors.grey.shade300,
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                        ),
                      ),
                    // The status node (circle)
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index <= status
                              ? Colors.green
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                        color: index <= status ? Colors.green : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * .010),
                Text(
                  statusLabels[index],
                  style: TextStyle(
                    color:
                        index <= status ? Colors.green : Colors.grey.shade600,
                    fontWeight:
                        index <= status ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
