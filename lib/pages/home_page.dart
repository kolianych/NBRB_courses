import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbrb_curs/blocs/current_courses_bloc/current_courses_bloc.dart';
import 'package:nbrb_curs/blocs/localizatio_bloc/localizatio_cubit.dart';
import 'package:nbrb_curs/config/constants.dart';
import 'package:nbrb_curs/config/router_config.dart';
import 'package:nbrb_curs/controller/search_controller.dart';
import 'package:nbrb_curs/generated/l10n.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/models/current_courses.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  List<CurrentCourses> valuta = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    final currentLocale = localizationBloc.state.languageCode == 'en';
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).nbrnExchangeRates),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              localizationBloc.switchLocale((currentLocale) ? 'ru' : 'en');
              controller.clear();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(allPadingHomePage),
          child: BlocListener<LocalizationBloc, Locale>(
            listener: (context, locale) {
              BlocProvider.of<CurrentCoursesBloc>(context)
                  .add(LoadCurrentCourses());
            },
            child: Center(
              child: BlocBuilder<CurrentCoursesBloc, CurrentCoursesBlocState>(
                builder: (context, state) {
                  return (state is CurrentCoursesBlocLoaded)
                      ? Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                routerConfig.go('/converter');
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          S.of(context).goToCurrencyConverter)),
                                  const Icon(Icons
                                      .keyboard_double_arrow_right_outlined)
                                ],
                              ),
                            ),
                            Text(
                              S.of(context).statetimestart.replaceAll(
                                  '{state.timeStart}', state.timeStart),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: S.of(context).search,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (value) =>
                                  MySearchController(context: context)
                                      .onChange(value),
                              onTapOutside: (event) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                            ),
                            listCardCourse(
                              state.data,
                              currentLocale,
                            )
                          ],
                        )
                      : const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.clear();
          BlocProvider.of<CurrentCoursesBloc>(context)
              .add(LoadCurrentCourses());
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

Widget listCardCourse(List<CurrentCourses> state, currentLocale) {
  return Expanded(
    child: ListView.builder(
      itemCount: state.length,
      itemBuilder: (context, index) {
        String? name =
            (currentLocale) ? state[index].Cur_Name_Eng : state[index].Cur_Name;
        String? quotName = (currentLocale)
            ? state[index].Cur_QuotName_Eng
            : state[index].Cur_QuotName;
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Text(
                  state[index].Cur_Abbreviation.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      S.of(context).curofficialrate(
                          state[index].Cur_OfficialRate.toString()),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  quotName!,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
