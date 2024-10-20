import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone_flutter/core/config/constant/app_url.dart';
import 'package:spotify_clone_flutter/domain/entities/songs/songs.dart';
import 'package:spotify_clone_flutter/presentation/home/bloc/news_song_cubit.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../song_player/pages/song_player.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongCubit, NewsSongState>(
            builder: (context, state) {
          if (state is NewsSongLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          if (state is NewsSongLoaded) {
            return _songs(state.songs);
          }
          if (state is NewsSongsLoadFailure) {
            return Center(child: Text(state.message));  
          }
          return const Center(child: Text("No state matched"));
        }),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context)
                    => SongPlayerPage(
                      songEntity: songs[index],
                    )
                )
            );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${AppUrls.fireStorage}${songs[index].artists} - ${songs[index].title}.jpg?${AppUrls.mediaAlt}'
                            )
                        )
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.isDarkMode ?  AppColors.darkGreyColor : const Color(0xffE6E6E6)
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  songs[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                ) ,
                const SizedBox(height: 5,),
                Text(
                  songs[index].artists,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
