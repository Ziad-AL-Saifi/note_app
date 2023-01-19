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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: BlocConsumer<AddCubit, AddState>(
          listener: (context, state) {
            if (state is AddSuccess) {
              Navigator.pop(context);
            } else if (state is AddFiald) {
              debugPrint(state.errMassege);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
                child: AbsorbPointer(
                    absorbing: state is AddLoading ? true : false,
                    child: const CustomForm()));
          },
        ),
      ),
    );
  }
}
