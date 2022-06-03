import 'package:animeet/bloc/user/user_cubit.dart';
import 'package:animeet/ui/widgets/allMatches_screen.dart';
import 'package:animeet/ui/widgets/profile_widget.dart';
import 'package:animeet/ui/widgets/tinder_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUser("me");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      print(state);
      if (state is UsersLoadingError) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Something went wrong.',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      }
      if (state is UsersLoading || state is GetUserLoading) {
        return const Scaffold(
          body: CupertinoActivityIndicator(),
        );
      }
      else {
        var userAvatar = state.user.avatar ??
            "https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640";
        return Scaffold(
          resizeToAvoidBottomInset: false,
            appBar: AppBar(
              // bottomOpacity: 0.5,
              centerTitle: true,
              title: const Text(
                "Animeet",
                style: TextStyle(
                    color: Color.fromRGBO(255, 46, 99, 1),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              ),
              elevation: 0.5,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: null,
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: NetworkImage(userAvatar),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.red,
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              onTap: (value) {
                // Respond to item press.
                setState(() => _currentIndex = value);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.whatshot),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: '',
                ),
              ],
            ),
            body: IndexedStack(
              index: _currentIndex,
              children: const [
                // const UserSwiper(),
                TinderSwiper(),
                Matches(),
                MyProfileScreen()
              ],
            ));
      }
    });
  }
}
