import 'package:animeet/bloc/match/match_cubit.dart';
import 'package:animeet/ui/widgets/match_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Matches extends StatelessWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MatchCubit>(context).fetchMatches();
    return BlocBuilder<MatchCubit, MatchState>(builder: (context, state) {
      switch (state.runtimeType) {
        case MatchesLoaded:
          return GridView.builder(
            itemCount: state.matches.length,
            itemBuilder: (context, index) => MatchWidget(user: state.matches[index]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        default:
          return const CupertinoActivityIndicator();
      }
    });
  }
}
