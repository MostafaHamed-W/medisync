import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/features/home/data/models/specialization_response_model.dart';
import 'package:medisync/features/home/logic/home_cubit.dart';
import 'package:medisync/features/home/ui/widgets/specializations_list/speciality_listview_Item.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationDataList});

  final List<SpecializationData?>? specializationDataList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList?.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(widget.specializationDataList?[index]?.id);
            },
            child: SpecialityListViewItem(
              specializationDataList: widget.specializationDataList?[index],
              itemIndex: index,
              selectedIndex: selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
