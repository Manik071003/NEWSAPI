import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/NewsCubit.dart';
import '../Cubit/NewsState.dart';
import 'Content.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final contentCubit = context.read<NewsCubit>().fetchEvents();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News Api'),
        ),
        body: SafeArea(
            child: BlocBuilder<NewsCubit, NewState>(builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoadedState) {
            return Flexible(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 250,
                    width: 100,
                    child: Content(
                      id: state.model.id.toString(),
                      first: state.model.name.first.toString(),
                      middle: state.model.name.middle.toString(),
                      last: state.model.name.last.toString(),
                      gender: state.model.gender.toString(),
                      images: state.model.images.main.toString(),
                      species: state.model.species.toString(),
                      homeplanet: state.model.homePlanet.toString(),
                      occupation: state.model.occupation.toString(),
                      sayings: state.model.sayings.toString(),
                      age: state.model.age.toString(),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("An error occured..."));
          }
        })));
  }
}
