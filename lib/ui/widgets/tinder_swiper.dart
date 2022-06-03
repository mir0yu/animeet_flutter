import 'package:animeet/bloc/swipe/swipe_bloc.dart';
import 'package:animeet/constants/paths.dart';
import 'package:animeet/constants/storage.dart';
import 'package:animeet/data/models/match.dart';
import 'package:animeet/data/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tcard/tcard.dart';

class TinderSwiper extends StatefulWidget {
  const TinderSwiper({Key? key}) : super(key: key);

  @override
  State<TinderSwiper> createState() => _TinderSwiperState();
}

class _TinderSwiperState extends State<TinderSwiper> {
  late final TCardController _controller = TCardController();
  late List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;

  bool _nope = true;

  void refresh() {
    setState(() {
      BlocProvider.of<SwipeBloc>(context).add(LoadUsers());
    });
  }

  @override
  void initState() {
    BlocProvider.of<SwipeBloc>(context).add(LoadUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipeBloc, SwipeState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UsersLoaded) {
          var _items = state.users;
          print(_items);
          for (int i = 0; i < _items.length; i++) {
            _swipeItems.add(SwipeItem(
              content: _items[i],
              likeAction: () {
                print("like");
              },
              nopeAction: () {
                print("nope");
              },
            ));
          }
          _matchEngine = MatchEngine(swipeItems: _swipeItems);
          print(_swipeItems);
          // var users = state.users;
          return Stack(
            children: [
              SizedBox(
                height: 700,
                child: SwipeCards(
                  matchEngine: _matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PROFILE,
                            arguments: _swipeItems[index].content);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                                _swipeItems[index].content.avatar!),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 75),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      _swipeItems[index].content.username! +
                                          ', ' +
                                          _swipeItems[index]
                                              .content
                                              .age
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  // const SizedBox(width: 30, height: 1,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3),
                                    child: Icon(
                                      _swipeItems[index].content.gender == 'U'
                                          ? Icons.accessible_forward_rounded
                                          : _swipeItems[index].content.gender ==
                                                  'F'
                                              ? Icons.female_rounded
                                              : Icons.male_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                                width: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 0, 12, 15),
                                child: Text(
                                  _swipeItems[index].content.bio!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  onStackFinished: () {
                    print("finished");
                    refresh();
                  },
                  itemChanged: (SwipeItem item, int index) {},
                  upSwipeAllowed: false,
                  fillSpace: true,
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ElevatedButton(
                    //     // onPressed: () {
                    //     //   // state.users.removeAt(index);},
                    //     onPressed: () {
                    //       _matchEngine.currentItem!.nope();
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //         elevation: 0,
                    //         shape: const CircleBorder(),
                    //         padding: const EdgeInsets.all(10),
                    //         primary: Colors.white30),
                    //     child: const Icon(
                    //       Icons.close,
                    //       size: 40,
                    //       color: Color.fromRGBO(255, 46, 99, 1),
                    //     )),
                    OutlinedButton(
                      onPressed: () {
                        _matchEngine.currentItem!.nope();
                        },
                      // onLongPress: () {
                      //   setState(() {
                      //     !_nope;
                      //   });
                      // },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: _nope? Colors.transparent: const Color.fromRGBO(255, 46, 99, 1),
                          minimumSize: const Size(65, 65),
                          shape: const CircleBorder(),
                          side: BorderSide(
                              width: 1.3,
                              color: _nope? const Color.fromRGBO(255, 46, 99, 1): Colors.white
                          )
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 35,
                        color: Color.fromRGBO(255, 46, 99, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                      width: 15,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        _matchEngine.currentItem!.like();
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(65, 65),
                        shape: const CircleBorder(),
                          side: const BorderSide(
                              width: 1.3,
                              color: Color.fromRGBO(8, 217, 214, 1))),
                      child: const Icon(
                        Icons.favorite_rounded,
                        size: 35,
                        color: Color.fromRGBO(8, 217, 214, 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
          // Padding(
          //   padding: const EdgeInsets.only(top: 30.0),
          //   child: Column(
          //     children: [
          //       TCard(
          //         size: const Size(620, 600),
          //         cards: List.generate(
          //           users.length,
          //           (index) => Container(
          //             // margin: const EdgeInsets.only(
          //             //     top: 100, left: 16, right: 16, bottom: 16),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(15),
          //               image: DecorationImage(
          //                 image: NetworkImage(users[index].avatar!),
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 10.0),
          //                       child: Text(
          //                         users[index].username! +
          //                             ', ' +
          //                             users[index].age.toString(),
          //                         style: const TextStyle(
          //                             fontSize: 30,
          //                             fontWeight: FontWeight.bold,
          //                             color: Colors.white),
          //                         overflow: TextOverflow.fade,
          //                       ),
          //                     ),
          //                     // const SizedBox(width: 30, height: 1,),
          //                     Padding(
          //                       padding: const EdgeInsets.only(right: 3),
          //                       child: Icon(
          //                         users[index].gender == 'U'
          //                             ? Icons.accessible_forward_rounded
          //                             : users[index].gender == 'F'
          //                                 ? Icons.female_rounded
          //                                 : Icons.male_rounded,
          //                         color: Colors.white,
          //                         size: 35,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 const SizedBox(
          //                   height: 10,
          //                   width: 1,
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.fromLTRB(12, 0, 12, 15),
          //                   child: Text(
          //                     state.users[index].bio!,
          //                     maxLines: 3,
          //                     overflow: TextOverflow.ellipsis,
          //                     style: const TextStyle(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w400,
          //                       color: Colors.white,
          //                       fontFamily: 'Inter',
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         controller: _controller,
          //         lockYAxis: true,
          //         onEnd: () {
          //           BlocProvider.of<SwipeBloc>(context).add(LoadUsers());
          //         },
          //         onForward: (index, info) {
          //           print([index, info.direction]);
          //         },
          //       ),
          //       Column(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: <Widget>[
          //               OutlinedButton(
          //                 onPressed: () {
          //                   print(_controller);
          //                   _controller.back();
          //                 },
          //                 child: Text('Back'),
          //               ),
          //               OutlinedButton(
          //                 onPressed: () {
          //                   _controller.reset();
          //                 },
          //                 child: Text('Reset'),
          //               ),
          //               OutlinedButton(
          //                 onPressed: () {
          //                   _controller.forward();
          //                 },
          //                 child: Text('Forward'),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // );
        }
        if (state is UsersLoadingError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Text('There aren\'t any more users.',
                  style: Theme.of(context).textTheme.headline5),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'Something went wrong.',
              style: TextStyle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}
