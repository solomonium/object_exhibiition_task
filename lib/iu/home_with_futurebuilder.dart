import 'package:exhibition_task/export.dart';
import 'package:exhibition_task/model/exhibit_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future exhibitData;

  @override
  void initState() {
    exhibitData = initializeExhibition();
    super.initState();
  }

  Future initializeExhibition() async {
    return context.read<ExhibitionModel>().getExhibitList();
  }

  TextEditingController searchController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ExhibitionModel>(builder: (context, model, _) {
        void searchName(String? query) {
          List<Exhibit> suggestions = [];
          if (query!.isEmpty) {
            suggestions = model.exhibit!;
            return;
          } else {
            suggestions = model.exhibit!
                .where((user) =>
                    user.title.toLowerCase().contains(query.toLowerCase()))
                .toList();
          }
          setState(() {
            model.exhibit = suggestions;
          });
        }

        return Scaffold(
          key: scaffoldKey,
          // backgroundColor: Colors.lightBlue.withOpacity(0.9),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: ListView(
              children: <Widget>[
                15.vSpace,
                HeaderOne(
                  text: 'Exhibition List',
                  textAlign: TextAlign.center,
                  size: 24,
                ),
                CustomTextField(
                    textInputType: TextInputType.text,
                    textController: searchController,
                    autoFocus: false,
                    isPassword: false,
                    hintText: 'Search by title',
                    height: 52,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    onChanged: searchName,
                    textInputAction: TextInputAction.done),
                20.vSpace,
                SingleChildScrollView(
                  child: SizedBox(
                    height: context.heightPx * 0.75,
                    child: FutureBuilder(
                        future: exhibitData,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HeaderTwo(
                                          text: snapshot.data[index].title),
                                      Container(
                                        height: context.heightPx * 0.15,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.06),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: ListView.builder(
                                                    physics:
                                                        const AlwaysScrollableScrollPhysics(
                                                            parent:
                                                                BouncingScrollPhysics()),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemCount: snapshot
                                                        .data[index]
                                                        .images
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      print(
                                                        snapshot.data[index]
                                                            .images.length,
                                                      );

                                                      /// To render images with jpg extensions
                                                      var name = snapshot
                                                          .data[index]
                                                          .images
                                                          .last
                                                          .split('.jpg');
                                                      {
                                                        return Row(
                                                          children: [
                                                            Container(
                                                                height: context
                                                                        .heightPx *
                                                                    0.13,
                                                                width:
                                                                    //  100,
                                                                    context.widthPx *
                                                                        0.25,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .red
                                                                        .withOpacity(
                                                                            0.6),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Image
                                                                    .network(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .images[index],
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )),
                                                            10.hSpace
                                                          ],
                                                        );
                                                      }
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      10.vSpace
                                    ],
                                  );
                                });
                          } else if (snapshot.hasData) {
                            return Center(
                              child:
                                  NormalText(text: snapshot.error.toString()),
                            );
                          }
                          return const SizedBox();
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
