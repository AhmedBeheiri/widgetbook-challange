import 'package:darty_commons/darty_commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/features/home/presentation/manager/home_cubit.dart';

///Home Widget.
class HomeWidget extends StatefulWidget {
  ///Creates a new instance of [HomeWidget].
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeCubit _cubit;
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ErrorState) {
          state.message.showErrorSnackBar(
            context,
            backgroundColor: Colors.black,
            duration: const Duration(
              seconds: 1,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(state.message,
                textAlign: TextAlign.center,
                style:const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  child: const Text('Enter Again',
                    style: TextStyle(color: Colors.white,
                      fontSize: 16,),
                  ),
                  onPressed: () {
                    _cubit.reset();
                  },
                ),
              ),
            ],
          );
        }
        if(state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text('Hello Flutter enthusiast!')),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (num.tryParse(value) != null) {
                      return 'Name Can Not Be A Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Submit',
                    style: TextStyle(color: Colors.white,
                    fontSize: 16,),
                    ),
                    onPressed: () {

                      if (_formKey.currentState!.validate()) {
                        _cubit.getWelcomeMessage(_nameController.text);
                      }
                    },
                ),)
              ],
            ),
          ),
        );
      },
    );
  }
}
