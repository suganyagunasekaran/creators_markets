import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../booking/booking_provider.dart';


class ProjectSummaryScreen
    extends ConsumerWidget {
  const ProjectSummaryScreen(
      {super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final booking =
    ref.watch(
      bookingProvider,
    );

    if (booking == null) {
      return const Scaffold(
        body: Center(
          child:
          Text("No Booking"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title:
        const Text(
          "Project Summary",
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(
            16),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment
              .start,
          children: [
            summary(
              "Creator",
              booking.creatorName,
            ),
            summary(
              "Package",
              booking.packageName,
            ),
            summary(
              "Budget",
              "₹${booking.amount}",
            ),
            summary(
              "Campaign",
              booking.campaignName,
            ),

            const SizedBox(
                height: 40),

            SizedBox(
              width:
              double.infinity,
              child:
              ElevatedButton(
                onPressed:
                    () {},
                child:
                const Text(
                  "Payment Successful",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summary(
      String title,
      String value,
      ) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          Text(value),
        ],
      ),
    );
  }
}