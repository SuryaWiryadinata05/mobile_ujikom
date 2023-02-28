import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import '../../../data/entertaimnet_response.dart';
import '../../../data/headline_response.dart';
import '../../../data/manga_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/technology_response.dart';
import '../../home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    final ScrollController scrollController = ScrollController();
    final auth = GetStorage();
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await auth.erase();
              Get.offAll(() => const HomeView());
            },
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.logout_rounded),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Hallo!",
                    textAlign: TextAlign.end,
                  ),
                  subtitle: Text(
                    auth.read('full_name').toString(),
                    textAlign: TextAlign.end,
                  ),
                  trailing: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 50.0,
                    height: 50.0,
                    child: Lottie.network(
                      'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(text: "Headline"),
                      Tab(text: "Teknologi"),
                      Tab(text: "Olahraga"),
                      Tab(text: "Hiburan"),
                      Tab(
                        text: "Profile",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              headline(controller, scrollController),
              beritaTeknologi(controller, scrollController),
              beritaOlahraga(controller, scrollController),
              beritaHiburan(controller, scrollController),
              profile(context, controller, scrollController),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<SportsResponse> beritaOlahraga(
      DashboardController controller, ScrollController scrollController) {
    return FutureBuilder<SportsResponse>(
      future: controller.getSports(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.network(
              'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
              repeat: true,
              width: MediaQuery.of(context).size.width / 1,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: Text("Tidak ada data"));
        }
        return ListView.builder(
          itemCount: snapshot.data!.data!.length,
          controller: scrollController,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
                bottom: 5,
              ),
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      snapshot.data!.data![index].urlToImage.toString(),
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.data![index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Author : ${snapshot.data!.data![index].author}'),
                            Text('Sumber :${snapshot.data!.data![index].name}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  FutureBuilder<TechnologyResponse> beritaTeknologi(
      DashboardController controller, ScrollController scrollController) {
    return FutureBuilder<TechnologyResponse>(
      future: controller.getTechnology(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.network(
              'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
              repeat: true,
              width: MediaQuery.of(context).size.width / 1,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: Text("Tidak ada data"));
        }
        return ListView.builder(
          itemCount: snapshot.data!.data!.length,
          controller: scrollController,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
                bottom: 5,
              ),
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      snapshot.data!.data![index].urlToImage.toString(),
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.data![index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Author : ${snapshot.data!.data![index].author}'),
                            Text('Sumber :${snapshot.data!.data![index].name}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  FutureBuilder<EntertaimentResponse> beritaHiburan(
      DashboardController controller, ScrollController scrollController) {
    return FutureBuilder<EntertaimentResponse>(
      future: controller.getEntertaiment(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.network(
              'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
              repeat: true,
              width: MediaQuery.of(context).size.width / 1,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: Text("Tidak ada data"));
        }
        return ListView.builder(
          itemCount: snapshot.data!.data!.length,
          controller: scrollController,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
                bottom: 5,
              ),
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      snapshot.data!.data![index].urlToImage.toString(),
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.data![index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Author : ${snapshot.data!.data![index].author}'),
                            Text('Sumber :${snapshot.data!.data![index].name}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  FutureBuilder<HeadlineResponse> headline(
      DashboardController controller, ScrollController scrollController) {
    return FutureBuilder<HeadlineResponse>(
      future: controller.getHeadline(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.network(
              'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
              repeat: true,
              width: MediaQuery.of(context).size.width / 1,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: Text("Tidak ada data"));
        }
        return ListView.builder(
          itemCount: snapshot.data!.data!.length,
          controller: scrollController,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
                bottom: 5,
              ),
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      snapshot.data!.data![index].urlToImage.toString(),
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.data![index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Author : ${snapshot.data!.data![index].author}'),
                            Text('Sumber :${snapshot.data!.data![index].name}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // FutureBuilder<MangaResponse> manga(
  //     DashboardController controller, ScrollController scrollController) {
  //   return FutureBuilder<MangaResponse>(
  //     future: controller.getManga(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: Lottie.network(
  //             'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
  //             repeat: true,
  //             width: MediaQuery.of(context).size.width / 1,
  //           ),
  //         );
  //       }
  //       if (!snapshot.hasData) {
  //         return const Center(child: Text("Tidak ada data"));
  //       }
  //       print(snapshot.data!.data!);
  //       return ListView.builder(
  //         itemCount: snapshot.data!.data!.length,
  //         controller: scrollController,
  //         shrinkWrap: true,
  //         itemBuilder: (context, index) {
  //           return Container(
  //             padding: const EdgeInsets.only(
  //               top: 5,
  //               left: 8,
  //               right: 8,
  //               bottom: 5,
  //             ),
  //             height: 110,
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(8.0),
  //                   child: Image.network(
  //                     snapshot.data!.data![index].image.toString(),
  //                     height: 130,
  //                     width: 130,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         snapshot.data!.data![index].desc.toString(),
  //                         overflow: TextOverflow.ellipsis,
  //                         maxLines: 2,
  //                       ),
  //                       const SizedBox(
  //                         height: 2,
  //                       ),
  //                       Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                               'Author : ${snapshot.data!.data![index].title}'),
  //                           Text(
  //                               'Sumber :${snapshot.data!.data![index].endpoint}'),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Widget profile(BuildContext context, DashboardController controller,
      ScrollController scrollController) {
    double width = MediaQuery.of(context).size.height;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: Lottie.asset('assets/lotties/male-avatar.json'),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.add_home)),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.add_home)),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.add_home)),
                )
              ],
            )),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(25),
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(115, 136, 134, 134),
                        offset: Offset(6.1, 7.1),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              child: Text(
                "Aku Adalah Anak Pa Jamet Suka Keluar Sambil Mumet, Karena Aku sukannya Style jamet Aku Adalah Anak Pa Jamet Suka Keluar Sambil Mumet, Karena Aku sukannya Style jamet Aku Adalah Anak Pa Jamet Suka Keluar Sambil Mumet, Karena Aku sukannya Style jamet",
                maxLines: 20,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
