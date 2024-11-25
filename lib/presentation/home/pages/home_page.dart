import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone_flutter/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify_clone_flutter/core/config/assets/app_images.dart';
import 'package:spotify_clone_flutter/core/config/assets/app_vestors.dart';
import 'package:spotify_clone_flutter/core/config/theme/app_colors.dart';
import 'package:spotify_clone_flutter/presentation/home/widget/news_song.dart';
import 'package:spotify_clone_flutter/presentation/home/widget/play_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabBar(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                  children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                  child:  NewsSongs(),
                ),
                Container(),
                Container(),
                Container(),
              ]),
            ),
            const SizedBox(height: 10,),
            const PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(AppImages.homeCard)),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Image.asset(AppImages.homeTop),
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
        controller: _tabController,
        // isScrollable: true,
        dividerHeight: 0,
        labelColor: context.isDarkMode ? Colors.white: Colors.black,
        indicatorColor: AppColors.primary,
        labelPadding: const EdgeInsets.symmetric(horizontal: 14),
        indicatorSize: TabBarIndicatorSize.tab,
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 16),
        tabs: const [ 
      Text('News',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
      Text('Videos',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
      Text('Artists',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
      Text('Podcast',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
    ]);
  }
}
