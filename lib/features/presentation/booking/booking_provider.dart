import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/booking_model.dart';


final bookingProvider =
StateProvider<BookingModel?>(
      (ref) => null,
);