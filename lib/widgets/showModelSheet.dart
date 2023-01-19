import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/Bloc/add_cubir/add_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constante.dart';
import '../forms/add_form.dart';
import 'custom_text_field.dart';

class CustomShowModelBottomSheet extends StatelessWidget {
  const CustomShowModelBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: SingleChildScrollView(
        child: BlocConsumer<AddCubit, AddState>(
          listener: (context, state) {
            if (state is AddSuccess) {
              Navigator.pop(context);
            } else if (state is AddFiald) {
              debugPrint('Somthing wrong');
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddLoading ? true : false,
                child: CustomForm());
          },
        ),
      ),
    );
  }
}
