import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:butterfly_app/theme/colors.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas = [
      // json으로 받아오는 부분
      {
        "image": "assets/images/1.png",
        "store": "샐리샐러드앤",
        "name": "샐리 샐러드 정식 도시락세트 A",
        "price": "10000",
        "likes": "2",
      },
      {
        "image": "assets/images/2.png",
        "store": "피플",
        "name": "생크림 와플",
        "price": "2500",
        "likes": "0",
      },
      {
        "image": "assets/images/3.png",
        "store": "삐삐네반찬",
        "name": "꼬마김밥",
        "price": "1300",
        "likes": "2",
      },
      {
        "image": "assets/images/ara-4.jpg",
        "store": "애플",
        "name": "iPad Pro",
        "price": "700000",
        "likes": "0",
      },
    ];
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  AppBar _appbarWidget() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_ios, size: 30)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on_outlined, size: 30)),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "강원특별자치도 원주시 흥업면",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                "전체",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(width: 30),
              Text(
                "음식",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(width: 30),
              Text(
                "생활용품",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext _context, int index) {
          String imagePath = datas[index]["image"] ?? 'assets/images/ara-9.png';
          String storePath = datas[index]["store"] ?? 'store';
          String namePath = datas[index]["name"] ?? 'name';
          String pricePath = datas[index]["price"] ?? '2000';

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    imagePath,
                    width: 120,
                    height: 120,
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storePath,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 13),
                          ),
                          Text(
                            namePath,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pricePath,
                            style: TextStyle(fontSize: 13),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.logocolor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Text(
                                    "공동구매",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(
            height: 1,
            color: AppColors.linecolor,
          );
        },
        itemCount: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
