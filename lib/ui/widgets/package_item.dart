import 'package:bank_sha/models/data_plan_model.dart';
import 'package:flutter/material.dart';

import '../../shared/shared_methods.dart';
import '../../shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;

  const PackageItem(
      {super.key, required this.dataPlan, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? blueColor : whiteColor,
            width: 2,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(formatCurrency(dataPlan.price ?? 0),
              style: greyTextStyle.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}
