import 'package:flutter/material.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
import 'package:medisync/features/home/ui/widgets/doctor_listview_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, required this.doctors});
  final List<Doctors> doctors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorListViewItem(
            doctor: doctors[index],
          );
        },
      ),
    );
  }
}
