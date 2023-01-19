import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Bloc/add_cubir/add_cubit.dart';
import '../forms/add_form.dart';

class CustomShowModelBottomSheet extends StatelessWidget {
  const CustomShowModelBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          if (state is AddSuccess) {
            Navigator.pop(context);
          } else if (state is AddFiald) {
            debugPrint(state.errMassege);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
                child: AbsorbPointer(
                    absorbing: state is AddLoading ? true : false,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: CustomForm(),
                    ))),
          );
        },
      ),
    );
  }
}
