import 'package:crit/features/booking_flow/presentation/room_selection/widgets/room_card_widget.dart';
import 'package:crit/features/booking_flow/presentation/widgets/reuseable_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/hotel_rooms/remote/room_bloc.dart';

class RoomSelectionScreen extends StatelessWidget {
  const RoomSelectionScreen({super.key, required this.hotelName});
  final String hotelName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: ReuseableAppBarWidget(
            appTitle: hotelName,
          )),
      body: BlocBuilder<RemoteRoomBloc, RemoteRoomsState>(
          builder: (context, state) {
        if (state is RemoteRoomsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteRoomsDone) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(246, 246, 249, 1),
            child: ListView.builder(
                itemCount: state.rooms!.length,
                itemBuilder: ((context, index) {
                  return RoomCardWidget(index: index, state: state);
                })),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
