import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../styles/styles.dart';
import '../../data/models/energy_consumption_value.dart';

class EnergyConsumptionColumn extends StatelessWidget {
  final EnergyConsumptionValue consumption;

  const EnergyConsumptionColumn({
    super.key,
    required this.consumption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(HomeAutomationStyles.smallSize),
            width: 35,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.05),
              borderRadius:
                  BorderRadius.circular(HomeAutomationStyles.mediumRadius),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.only(
                      top: HomeAutomationStyles.smallSize),
                  width: constraints.maxWidth,
                  height: (consumption.value / 100) * (constraints.maxHeight),
                  decoration: BoxDecoration(
                    color: consumption.aboveThreshold
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                        : Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(
                        HomeAutomationStyles.mediumRadius),
                  ),
                  child: Text(
                    '${consumption.value.toInt()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
                    .animate()
                    .scaleY(
                      alignment: Alignment.bottomCenter,
                      begin: 0.5,
                      end: 1,
                      duration: 0.5.seconds,
                      curve: Curves.easeInOut,
                    )
                    .fadeIn(
                      duration: 0.5.seconds,
                      curve: Curves.easeInOut,
                    );
              },
            ),
          ),
        ),
        Text(
          consumption.day,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ]
          .animate()
          .scaleXY(
            alignment: Alignment.bottomCenter,
            begin: 0.5,
            end: 1,
            duration: 0.5.seconds,
            curve: Curves.easeInOut,
          )
          .fadeIn(
            duration: 0.5.seconds,
            curve: Curves.easeInOut,
          ),
    );
  }
}
