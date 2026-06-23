import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/booking_model.dart';
import 'booking_provider.dart';


class BookCreatorScreen
    extends ConsumerStatefulWidget {
  final String creatorName;
  final String packageName;
  final double amount;

  const BookCreatorScreen({
    super.key,
    required this.creatorName,
    required this.packageName,
    required this.amount,
  });

  @override
  ConsumerState<BookCreatorScreen>
  createState() =>
      _BookCreatorScreenState();
}

class _BookCreatorScreenState
    extends ConsumerState<
        BookCreatorScreen> {
  final campaignController =
  TextEditingController();

  final requirementController =
  TextEditingController();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text(
        "Book Creator",
      )),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              widget.creatorName,
              style:
              const TextStyle(
                fontSize: 20,
              ),
            ),

            Text(
              widget.packageName,
            ),

            Text(
              "₹${widget.amount}",
            ),

            const SizedBox(
                height: 20),

            TextField(
              controller:
              campaignController,
              decoration:
              const InputDecoration(
                labelText:
                "Campaign Name",
              ),
            ),

            const SizedBox(
                height: 15),

            TextField(
              controller:
              requirementController,
              maxLines: 4,
              decoration:
              const InputDecoration(
                labelText:
                "Requirements",
              ),
            ),

            const SizedBox(
                height: 20),

            ElevatedButton(
              onPressed: () async {
                selectedDate =
                await showDatePicker(
                  context:
                  context,
                  firstDate:
                  DateTime.now(),
                  lastDate:
                  DateTime(
                      2030),
                  initialDate:
                  DateTime.now(),
                );

                setState(() {});
              },
              child: Text(
                selectedDate ==
                    null
                    ? "Select Delivery Date"
                    : selectedDate
                    .toString(),
              ),
            ),

            const SizedBox(
                height: 30),

            ElevatedButton(
              onPressed: () {
                final booking =
                BookingModel(
                  creatorName:
                  widget
                      .creatorName,
                  packageName:
                  widget
                      .packageName,
                  amount:
                  widget.amount,
                  campaignName:
                  campaignController
                      .text,
                  requirements:
                  requirementController
                      .text,
                  deliveryDate:
                  selectedDate ??
                      DateTime.now(),
                );

                ref.read(bookingProvider.notifier).state = booking;

                context.push(
                  '/project-summary',
                );
              },
              child: const Text(
                "Proceed Payment",
              ),
            ),
          ],
        ),
      ),
    );
  }
}