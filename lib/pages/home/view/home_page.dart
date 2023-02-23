import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roxo/pages/home/widgets/item_card.dart';

import '../../../Components/cart_icon.dart';
import '../../../Theme/app_colors.dart';
import '../../../utils/services.dart';
import '../../view_all_categories/view/view_categories.dart';
import '../components/search_box.dart';
import '../components/section_title.dart';
import '../widgets/categories.dart';
import '../widgets/slide_show.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.chanepage,
  }) : super(key: key);
  final ValueChanged<int> chanepage;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = AppServices.getLangBassedOnAppLang();
    List<String> titles = ["Electronics", "Shoses", "Games", "Clothes"];
    List<String> images = [
      "assets/images/exmaples/Electronics.jpg",
      "assets/images/exmaples/sport.jpg",
      "assets/images/exmaples/games.jpg",
      "assets/images/exmaples/clothes.jpg",
    ];
    final List<String> _productsimage = [
      "assets/images/exmaples/iphone.jpg",
      "assets/images/exmaples/macbook.jpg",
      "assets/images/exmaples/note5g.png",
      "assets/images/exmaples/harrypotter.jpg",
      "assets/images/exmaples/fifa.jpg",
      "assets/images/exmaples/dlsrjpg.jpg",
    ];
    final List<Widget> _images = [
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/exmaples/slideshow.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/exmaples/slideshow2.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/exmaples/slideshow2 (2).jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/exmaples/slideshow3.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
    final List<String> _itemnaems = [
      "iphone 13 pro max",
      "Apple macbook pro 13 with Touch Bar Apple",
      "samsung galaxy note 20 ultra 5g",
      "harry potter books",
      "FiFA 21",
      "canon eos 900d dslr",
    ];
    final List<int> _itemrate = [
      60,
      70,
      50,
      90,
      110,
      60,
    ];
    final List<int> _itemsales = [
      560,
      370,
      150,
      390,
      10,
      40,
    ];
    final List<double> _itemprice = [
      560.344,
      370.33,
      1500.3,
      390.300,
      1000.50,
      1400.90,
    ];
    final List<int> _itemsalespercentage = [
      15,
      12,
      8,
      10,
      5,
      7,
    ];
    final List<double> _olditemprice = [
      860.344,
      770.33,
      1900.3,
      890.300,
      1500.50,
      1900.90,
    ];
    final List<String> _comments = [
      "Love this plugin! Does exactly what it is supposed to do and so far without any real issues. (",
      "Now that I can get to rate, I'd give it five.. My co-workers love the  dummy text th",
      "It's just awesome plugin to generate tweets. :)",
    ];
    final List<String> _commentsname = ["Osh", "Bojoer", "Kay Stenschke"];
    final List<int> _commentsrate = [
      3,
      2,
      5,
    ];
    final List<String> _commentsDate = [
      "13.03.2015",
      "19.05.2014",
      "11.05.2013",
    ];
    final List<String> _description = [
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    ];
    final List<String> _categorydescrption = [
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    ];
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //! Title
            SliverAppBar(
              //! remove back arrow from sliverappbar
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/logo/ROXN_Logo_red.png",
                    width: 60.w,
                    height: 40.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CartIcon(
                          onTap: () => widget.chanepage(2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: InkWell(
                            child: SizedBox(
                              width: 30.w,
                              height: 50.h,
                              child: Icon(
                                Icons.person_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            onTap: () => widget.chanepage(3),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              titleSpacing: 10,
              leadingWidth: 200,
            ),
            //! SearchBox
            SliverToBoxAdapter(
              child: SearchBox(
                hintStyle: _textStyle.copyWith(
                  color: AppColors.gray,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            //! Categories Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 15,
                  right: 15,
                  bottom: 5,
                ),
                child: SectionTitle(
                  title: "Categories",
                  sectionTitleStyle: _textStyle.copyWith(
                    color: AppColors.gray,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                  ),
                  viewAlltsyle: _textStyle.copyWith(
                    color: AppColors.gray.withOpacity(0.55),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  //! view All
                  onTap: () => Get.to(
                    ViewAllCategories(
                      images: images,
                      textStyle: _textStyle,
                      titles: titles,
                      itemsales: _itemsales,
                      itemnaems: _itemnaems,
                      productImages: _productsimage,
                      itemrate: _itemrate,
                      itemprice: _itemprice,
                      categorydescrption: _categorydescrption,
                      comments: _comments,
                      commentsdate: _commentsDate,
                      commentsname: _commentsname,
                      commentsrate: _commentsrate,
                      olditemprice: _olditemprice,
                      description: _description,
                      itemssalespercentge: _itemsalespercentage,
                    ),
                  ),
                ),
              ),
            ),
            //! Categories List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 35.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Categories(
                        categoryStyle: _textStyle.copyWith(
                          color: AppColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        title: titles.elementAt(index),
                        image: images.elementAt(index),
                        itemsales: _itemsales,
                        itemprice: _itemprice,
                        comments: _comments,
                        commentsdate: _commentsDate,
                        textsyle: _textStyle,
                        olditemprice: _olditemprice,
                        productImages: _productsimage,
                        itemssalespercentge: _itemsalespercentage,
                        commentsname: _commentsname,
                        itemnaems: _itemnaems,
                        description: _description,
                        itemrate: _itemrate,
                        commentsrate: _commentsrate,
                        categorydescrption: _categorydescrption.elementAt(index),
                      ),
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ),
            //! Slide show
            SliverToBoxAdapter(
              child: ImageSlideshow(
                children: _images,
                autoPlayInterval: 3000,
                isLoop: true,
                initialPage: 0,
                indicatorColor: AppColors.activeDotColor,
              ),
            ),
            //! Best Seller title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 5,
                  top: 5,
                ),
                child: SectionTitle(
                  title: "Best Seller",
                  sectionTitleStyle: _textStyle.copyWith(
                    color: AppColors.gray,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  viewAlltsyle: _textStyle.copyWith(
                    color: AppColors.gray.withOpacity(0.55),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w100,
                  ),
                  onTap: () {},
                ),
              ),
            ),
            //! List best seller
            SliverToBoxAdapter(
              child: SizedBox(
                height: 252.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      textsyle: _textStyle,
                      itemimage: _productsimage.elementAt(index),
                      itemname: _itemnaems.elementAt(index),
                      itemrate: _itemrate.elementAt(index),
                      itemsales: _itemsales.elementAt(index),
                      itemprice: _itemprice.elementAt(index),
                      itemssalespercentge: _itemsalespercentage.elementAt(index),
                      index: index,
                      olditemprice: _olditemprice.elementAt(index),
                      comments: _comments,
                      commentsname: _commentsname,
                      commentsrate: _commentsrate,
                      commentsdate: _commentsDate,
                      description: _description.elementAt(index),
                      heroTage: "bestseller",
                    );
                  },
                  itemCount: _productsimage.length,
                ),
              ),
            ),
            //! Newest Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 15,
                  right: 15,
                  bottom: 5,
                ),
                child: SectionTitle(
                  title: "Newest",
                  sectionTitleStyle: _textStyle.copyWith(
                    color: AppColors.gray,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                  ),
                  viewAlltsyle: _textStyle.copyWith(
                    color: AppColors.gray.withOpacity(0.55),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  onTap: () {},
                ),
              ),
            ),
            //! Newest List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 252.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      textsyle: _textStyle,
                      itemimage: _productsimage.elementAt(index),
                      itemname: _itemnaems.elementAt(index),
                      itemrate: _itemrate.elementAt(index),
                      itemsales: _itemsales.elementAt(index),
                      itemprice: _itemprice.elementAt(index),
                      itemssalespercentge: _itemsalespercentage.elementAt(index),
                      index: index,
                      olditemprice: _olditemprice.elementAt(index),
                      comments: _comments,
                      commentsname: _commentsname,
                      commentsrate: _commentsrate,
                      commentsdate: _commentsDate,
                      description: _description.elementAt(index),
                      heroTage: "Newest",
                    );
                  },
                  itemCount: _productsimage.length,
                ),
              ),
            ),
            //! Recommended Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 15,
                  right: 15,
                  bottom: 5,
                ),
                child: SectionTitle(
                  title: "Recommended",
                  sectionTitleStyle: _textStyle.copyWith(
                    color: AppColors.gray,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                  ),
                  viewAlltsyle: _textStyle.copyWith(
                    color: AppColors.gray.withOpacity(0.55),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  onTap: () {},
                ),
              ),
            ),
            //! Recommended Lsit
            SliverToBoxAdapter(
              child: SizedBox(
                height: 252.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      textsyle: _textStyle,
                      itemimage: _productsimage.elementAt(index),
                      itemname: _itemnaems.elementAt(index),
                      itemrate: _itemrate.elementAt(index),
                      itemsales: _itemsales.elementAt(index),
                      itemprice: _itemprice.elementAt(index),
                      itemssalespercentge: _itemsalespercentage.elementAt(index),
                      index: index,
                      olditemprice: _olditemprice.elementAt(index),
                      comments: _comments,
                      commentsname: _commentsname,
                      commentsrate: _commentsrate,
                      commentsdate: _commentsDate,
                      description: _description.elementAt(index),
                      heroTage: "Recommended",
                    );
                  },
                  itemCount: _productsimage.length,
                ),
              ),
            ),
            //! bottom gap
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
            //! Newest Grid
            // SliverGrid(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     childAspectRatio: 0.8,
            //     mainAxisSpacing: 5,
            //     crossAxisSpacing: 5,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //     (context, int index) {
            //       return ItemCard(
            //         textsyle: _textStyle,
            //         itemimage: _productsimage.elementAt(index),
            //         itemname: _itemnaems.elementAt(index),
            //         itemrate: _itemrate.elementAt(index),
            //         itemsales: _itemsales.elementAt(index),
            //         itemprice: _itemprice.elementAt(index),
            //         itemssalespercentge: _itemsalespercentage.elementAt(index),
            //         index: index,
            //         olditemprice: _olditemprice.elementAt(index),
            //         comments: _comments,
            //         commentsname: _commentsname,
            //         commentsrate: _commentsrate,
            //         commentsdate: _commentsDate,
            //         description: _description.elementAt(index),
            //         heroTage: "Newest",
            //       );
            //     },
            //     childCount: _productsimage.length,
            //   ),
            // ),