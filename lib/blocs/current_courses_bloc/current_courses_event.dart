part of 'current_courses_bloc.dart';

abstract class CurrentCoursesBlocEvent {}

class LoadCurrentCourses extends CurrentCoursesBlocEvent {}

class SearchingEvent extends CurrentCoursesBlocEvent {
  final List<CurrentCourses> data;
  SearchingEvent(
    this.data,
  );
}
