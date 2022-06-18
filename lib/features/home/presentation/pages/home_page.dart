import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/features/home/presentation/manager/home_cubit.dart';
import 'package:widgetbook_challenge/features/home/presentation/widgets/home_widget.dart';
import 'package:widgetbook_challenge/injection_container.dart';

/// Home Page.
class HomePage extends StatelessWidget {
  /// Creates a new instance of [HomePage].
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: const HomeWidget(),
    );
  }
}
