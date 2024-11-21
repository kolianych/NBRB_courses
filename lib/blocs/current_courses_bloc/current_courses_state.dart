part of 'current_courses_bloc.dart';

class CurrentCoursesBlocState {}

class CurrentCoursesBlocInitial extends CurrentCoursesBlocState {}

class CurrentCoursesBlocLoaded extends CurrentCoursesBlocState {
  final List<CurrentCourses> data;
  final String timeStart;
  CurrentCoursesBlocLoaded({required this.data, required this.timeStart});
}
