import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/current_courses_servise.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/models/current_courses.dart';

part 'current_courses_event.dart';
part 'current_courses_state.dart';

class CurrentCoursesBloc
    extends Bloc<CurrentCoursesBlocEvent, CurrentCoursesBlocState> {
  CurrentCoursesBloc() : super(CurrentCoursesBlocInitial()) {
    on<LoadCurrentCourses>((event, emit) async {
      final timeStart = DateFormat('dd-MM-yyyy HH:mm').format(
        DateTime.now(),
      );
      final qaPairs = await getAllCurrency();
      emit(
        CurrentCoursesBlocLoaded(data: qaPairs, timeStart: timeStart),
      );
    });

    on<SearchingEvent>(
      (event, emit) {
        emit(CurrentCoursesBlocLoaded(
          data: event.data,
          timeStart: '',
        ));
      },
    );
  }
}
