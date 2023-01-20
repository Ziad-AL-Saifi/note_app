import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/add_cubir/add_cubit.dart';
import '../constante.dart';
import 'color_item.dart';

class ListColorCircle extends StatefulWidget {
  const ListColorCircle({super.key});

  @override
  State<ListColorCircle> createState() => _ListColorCircleState();
}

class _ListColorCircleState extends State<ListColorCircle> {
  int isClick2 = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: c.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
                onTap: () {
                  isClick2 = index;
                  BlocProvider.of<AddCubit>(context).cc = c[isClick2];
                  setState(() {});
                },
                child: ColorItem(
                  isClick: isClick2 == index,
                  index: index,
                )),
          );
        },
      ),
    );
  }
}
