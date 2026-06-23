import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../data/data_source/project_status.dart';


class ProjectTimeline
    extends StatelessWidget {
 final ProjectStatus status;

 const ProjectTimeline({
  super.key,
  required this.status,
 });

 static const stages = [
  "Payment Successful",
  "Project Assigned",
  "Script Uploaded",
  "Script Approved",
  "Raw Video Uploaded",
  "Raw Video Approved",
  "Final Delivery",
 ];

 @override
 Widget build(BuildContext context) {
  final currentIndex =
  ProjectStatus.values
      .indexOf(status);

  return ListView.builder(
   shrinkWrap: true,
   physics:
   const NeverScrollableScrollPhysics(),
   itemCount: stages.length,
   itemBuilder:
       (context, index) {
    final completed =
        index <= currentIndex;

    return TimelineTile(
     isFirst: index == 0,
     isLast:
     index ==
         stages.length - 1,

     beforeLineStyle:
     LineStyle(
      color: completed
          ? Colors.green
          : Colors.grey,
      thickness: 3,
     ),

     indicatorStyle:
     IndicatorStyle(
      width: 24,
      color: completed
          ? Colors.green
          : Colors.grey,
     ),

     endChild: Padding(
      padding:
      const EdgeInsets.all(
          16),
      child: Text(
       stages[index],
       style:
       TextStyle(
        fontWeight:
        completed
            ? FontWeight
            .bold
            : FontWeight
            .normal,
       ),
      ),
     ),
    );
   },
  );
 }
}