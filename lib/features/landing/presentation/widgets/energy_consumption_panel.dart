import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../styles/styles.dart';
import '../providers/landing_providers.dart';
import 'energy_consumption_column.dart';

class EnergyConsumptionPanel extends ConsumerWidget {
  const EnergyConsumptionPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final energyConsumption = ref.read(energyConsumptionProvider);

    return Column(
      children: [
        HomeAutomationStyles.smallVGap,
        Row(
          children: [
            HomeAutomationStyles.smallHGap,
            Icon(
              Icons.energy_savings_leaf,
              color: Theme.of(context).colorScheme.primary,
            ),
            HomeAutomationStyles.xsmallHGap,
            Text('My Energy Consumption (kW)',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ))
          ],
        )
            .animate(
              delay: 200.ms,
            )
            .slideX(
                begin: 0.25,
                end: 0,
                duration: 0.5.seconds,
                curve: Curves.easeInOut)
            .fadeIn(duration: 0.5.seconds, curve: Curves.easeInOut),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(
              left: HomeAutomationStyles.mediumSize,
              bottom: HomeAutomationStyles.smallSize,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: energyConsumption.values.length,
            itemBuilder: (context, index) {
              return EnergyConsumptionColumn(
                  consumption: energyConsumption.values[index]);
            },
          ),
        )
      ],
    );
  }
}
