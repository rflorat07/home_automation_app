import 'dart:math';

import 'package:intl/intl.dart';

import '../models/energy_consumption.dart';
import '../models/energy_consumption_value.dart';

class EnergyConsumptionDataRepository {
  EnergyConsumption getEnergyConsuption() {
    List<EnergyConsumptionValue> consumptionValues = [];

    var date = DateTime.now();
    var random = Random();
    var thresholdValue = 70;
    var maxValues = 20;

    for (var i = 0; i < maxValues; i++) {
      double currentValues = random.nextInt(50) + 30;
      consumptionValues.add(EnergyConsumptionValue(
        day: DateFormat.E().format(date).substring(0, 2).toUpperCase(),
        value: currentValues,
        aboveThreshold: currentValues > thresholdValue,
      ));

      date = date.add(const Duration(days: 1));
    }

    return EnergyConsumption(values: consumptionValues);
  }
}
