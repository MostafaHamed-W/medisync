import 'package:flutter/material.dart';
import 'package:medisync/features/home/ui/widgets/doctor_listview_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return const DoctorListViewItem();
        },
      ),
    );
  }
}
