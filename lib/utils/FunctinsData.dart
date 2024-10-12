// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:infixedu/screens/AboutScreen.dart';
import 'package:infixedu/screens/Home.dart';
import 'package:infixedu/screens/SettingsScreen.dart';
import 'package:infixedu/screens/admin/AdminAttendanceScreen.dart';
import 'package:infixedu/screens/admin/dormitoryAndRoom/AdminAddDormitory.dart';
import 'package:infixedu/screens/admin/dormitoryAndRoom/AdminAddRoom.dart';
import 'package:infixedu/screens/admin/dormitoryAndRoom/AdminDormitoryScreen.dart';
import 'package:infixedu/screens/admin/leave/AdminLeaveHomeScreen.dart';
import 'package:infixedu/screens/admin/library/AddLibraryBook.dart';
import 'package:infixedu/screens/admin/library/AdminAddMember.dart';
import 'package:infixedu/screens/admin/library/AdminLibraryScreen.dart';
import 'package:infixedu/screens/admin/notice/StaffNoticeScreen.dart';
import 'package:infixedu/screens/admin/staff/AdminStaffList.dart';
import 'package:infixedu/screens/admin/transport/AddRouteScreen.dart';
import 'package:infixedu/screens/admin/transport/AdminAddVehicle.dart';
import 'package:infixedu/screens/admin/transport/AdminTransportScreen.dart';
import 'package:infixedu/screens/admin/transport/AssignVehicle.dart';
import 'package:infixedu/screens/fees/fees_admin/AddFeeType.dart';
import 'package:infixedu/screens/fees/fees_admin/AdminFeeList.dart';
import 'package:infixedu/screens/fees/fees_admin/AdminFeesHome.dart';
import 'package:infixedu/screens/fees/fees_admin/fees_admin_new/bank_payment.dart';
import 'package:infixedu/screens/fees/fees_admin/fees_admin_new/fee_group.dart';
import 'package:infixedu/screens/fees/fees_admin/fees_admin_new/fee_invoice.dart';
import 'package:infixedu/screens/fees/fees_admin/fees_admin_new/fee_type.dart';
import 'package:infixedu/screens/fees/fees_admin/reports/fees_balance_report.dart';
import 'package:infixedu/screens/fees/fees_admin/reports/fees_dues_report.dart';
import 'package:infixedu/screens/fees/fees_admin/reports/fees_fine_report.dart';
import 'package:infixedu/screens/fees/fees_admin/reports/fees_payment_report.dart';
import 'package:infixedu/screens/fees/fees_admin/reports/fees_waiver_report.dart';
import 'package:infixedu/screens/fees/fees_admin/reports/report_main.dart';
import 'package:infixedu/screens/lessonPlan/student/views/StudentLessonsView.dart';
import 'package:infixedu/screens/main/DashboardScreen.dart';
import 'package:infixedu/screens/parent/ChildListScreen.dart';
import 'package:infixedu/screens/student/Dormitory.dart';
import 'package:infixedu/screens/student/Profile.dart';
import 'package:infixedu/screens/student/Routine.dart';
import 'package:infixedu/screens/student/StudentAttendance.dart';
import 'package:infixedu/screens/student/StudentTeacher.dart';
import 'package:infixedu/screens/student/SubjectScreen.dart';
import 'package:infixedu/screens/student/TimeLineScreen.dart';
import 'package:infixedu/screens/student/TransportScreen.dart';
import 'package:infixedu/screens/student/attendance/StudentAttenHome.dart';
import 'package:infixedu/screens/student/attendance/StudentSubjectListScreen.dart';
import 'package:infixedu/screens/student/examination/ClassExamResult.dart';
import 'package:infixedu/screens/student/examination/ExaminationScreen.dart';
import 'package:infixedu/screens/student/examination/ScheduleScreen.dart';
import 'package:infixedu/screens/student/homework/StudentHomework.dart';
import 'package:infixedu/screens/student/leave/LeaveListStudent.dart';
import 'package:infixedu/screens/student/leave/LeaveStudentApply.dart';
import 'package:infixedu/screens/student/leave/LeaveStudentHome.dart';
import 'package:infixedu/screens/student/library/BookIssuedScreen.dart';
import 'package:infixedu/screens/student/library/BookListScreen.dart';
import 'package:infixedu/screens/student/library/LibraryScreen.dart';
import 'package:infixedu/screens/student/notice/NoticeScreen.dart';
import 'package:infixedu/screens/student/onlineExam/ActiveOnlineExamScreen.dart';
import 'package:infixedu/screens/student/onlineExam/OnlineExamResultScreen.dart';
import 'package:infixedu/screens/student/onlineExam/OnlineExamScreen.dart';
import 'package:infixedu/screens/student/onlineExam/module/view/ActiveOnlineExamsModule.dart';
import 'package:infixedu/screens/student/onlineExam/module/view/OnlineExamResultsModule.dart';
import 'package:infixedu/screens/student/studyMaterials/StudyMaterialScreen.dart';
import 'package:infixedu/screens/student/studyMaterials/StydyMaterialMain.dart';
import 'package:infixedu/screens/teacher/ClassAttendanceHome.dart';
import 'package:infixedu/screens/teacher/ClassSubjectAttendanceHome.dart';
import 'package:infixedu/screens/teacher/TeacherMyAttendance.dart';
import 'package:infixedu/screens/teacher/academic/AcademicsScreen.dart';
import 'package:infixedu/screens/teacher/academic/MySubjectScreen.dart';
import 'package:infixedu/screens/teacher/academic/SearchClassRoutine.dart';
import 'package:infixedu/screens/teacher/academic/TeacherRoutineScreen.dart';
import 'package:infixedu/screens/teacher/attendance/AttendanceScreen.dart';
import 'package:infixedu/screens/teacher/content/AddContentScreen.dart';
import 'package:infixedu/screens/teacher/content/ContentListScreen.dart';
import 'package:infixedu/screens/teacher/content/ContentScreen.dart';
import 'package:infixedu/screens/teacher/homework/AddHomeworkScreen.dart';
import 'package:infixedu/screens/teacher/homework/HomeworkScreen.dart';
import 'package:infixedu/screens/teacher/homework/TeacherHomeworkListScreen.dart';
import 'package:infixedu/screens/teacher/leave/ApplyLeaveScreen.dart';
import 'package:infixedu/screens/teacher/leave/LeaveScreen.dart';
import 'package:infixedu/screens/teacher/students/StudentSearch.dart';
import 'package:infixedu/screens/wallet/student/views/StudentWalletTransactions.dart';
import 'package:infixedu/utils/model/SystemSettings.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../screens/teacher/students/SubjectStudentSearch.dart';
import '../screens/virtual_class/virtual_class_main.dart';

class AppFunction {
  static var students = [
    'Homework',
    'Study Materials',
    'Timeline',
    'Attendance',
    'Wallet',
    'Examination',
    'Online Exam',
    'Lesson',
    'Leave',
    'Notice',
    'Subjects',
    'Teacher',
    'Library',
    'Transport',
    'Dormitory',
    'Class',
    'Settings',
  ];
  static var studentIcons = [
    'assets/images/homework.png',
    'assets/images/downloads.png',
    'assets/images/timeline.png',
    'assets/images/attendance.png',
    'assets/images/fees_icon.png',
    'assets/images/examination.png',
    'assets/images/onlineexam.png',
    'assets/images/routine.png',
    'assets/images/leave.png',
    'assets/images/notice.png',
    'assets/images/subjects.png',
    'assets/images/teacher.png',
    'assets/images/library.png',
    'assets/images/transport.png',
    'assets/images/dormitory.png',
    'assets/images/myroutine.png',
    'assets/images/addhw.png',
  ];

  static var teachers = [
    'Students',
    'Academic',
    'Attendance',
    'Leave',
    'Content',
    'Notice',
    'Library',
    'Homework',
    'About',
    'Class',
    'Settings',
  ];

  static var teachersIcons = [
    'assets/images/students.png',
    'assets/images/academics.png',
    'assets/images/attendance.png',
    'assets/images/leave.png',
    'assets/images/contents.png',
    'assets/images/notice.png',
    'assets/images/library.png',
    'assets/images/homework.png',
    'assets/images/about.png',
    'assets/images/myroutine.png',
    'assets/images/addhw.png',
  ];

  static var admins = [
    'Students',
    'Leave',
    'Staff',
    'Dormitory',
    'Attendance',
    'Fees',
    'Content',
    'Notice',
    'Library',
    'Transport',
    'Class',
    'Settings',
  ];
  static var adminIcons = [
    'assets/images/students.png',
    'assets/images/leave.png',
    'assets/images/staff.png',
    'assets/images/dormitory.png',
    'assets/images/attendance.png',
    'assets/images/fees_icon.png',
    'assets/images/contents.png',
    'assets/images/notice.png',
    'assets/images/library.png',
    'assets/images/transport.png',
    'assets/images/myroutine.png',
    'assets/images/addhw.png',
  ];

  static var parent = [
    'Child',
    'About',
    'Settings',
  ];
  static var parentIcons = [
    'assets/images/mychild.png',
    'assets/images/about.png',
    'assets/images/addhw.png',
  ];

  static var parent2 = [
    'Child',
    'About',
    'Settings',
  ];

  static var parentIcons2 = [
    'assets/images/mychild.png',
    'assets/images/about.png',
    'assets/images/addhw.png',
  ];

  static var adminTransport = [
    'Route',
    'Vehicle',
    'Assign Vehicle',
    'Transport',
  ];
  static var adminTransportIcons = [
    'assets/images/transport.png',
    'assets/images/transport.png',
    'assets/images/addhw.png',
    'assets/images/transport.png',
  ];

  static var adminDormitory = [
    'Add Dormitory',
    'Add Room',
    'Room List',
  ];
  static var adminDormitoryIcons = [
    'assets/images/addhw.png',
    'assets/images/addhw.png',
    'assets/images/dormitory.png',
  ];

  static var librarys = [
    'Book List',
    'Books Issued',
  ];
  static var libraryIcons = [
    'assets/images/library.png',
    'assets/images/library.png',
  ];
  static var examinations = [
    'Schedule',
    'Result',
  ];
  static var examinationIcons = [
    'assets/images/examination.png',
    'assets/images/examination.png',
  ];

  static var onlineExaminations = [
    'Active Exam',
    'Exam Result',
  ];
  static var onlineExaminationIcons = [
    'assets/images/onlineexam.png',
    'assets/images/onlineexam.png',
  ];

  static var homework = [
    'Add HW',
    'HW List',
  ];
  static var homeworkIcons = [
    'assets/images/addhw.png',
    'assets/images/hwlist.png',
  ];

  static var contents = [
    'Add Content',
    'Content List',
  ];
  static var contentsIcons = [
    'assets/images/addhw.png',
    'assets/images/hwlist.png',
  ];

  static var leaves = [
    'Apply Leave',
    'Leave List',
  ];
  static var leavesIcons = [
    'assets/images/hwlist.png',
    'assets/images/addhw.png',
  ];

  static var adminLibrary = [
    'Add Book',
    'Book List',
    'Add Member',
  ];
  static var adminLibraryIcons = [
    'assets/images/addhw.png',
    'assets/images/hwlist.png',
    'assets/images/addhw.png',
  ];

  static var academics = [
    'My Routine',
    'Class Routine',
    'Subjects',
  ];
  static var academicsIcons = [
    'assets/images/myroutine.png',
    'assets/images/classroutine.png',
    'assets/images/subjects.png',
  ];

  static var attendance = [
    'Class Atten',
    'Subject Atten',
    'Search Atten',
    'Search Sub Atten',
  ];
  static var attendanceIcons = [
    'assets/images/classattendance.png',
    'assets/images/classattendance.png',
    'assets/images/searchattendance.png',
    'assets/images/searchattendance.png',
  ];

  static var studentattendance = [
    'Search Atten',
    'Search Sub Atten',
  ];
  static var studentattendanceIcons = [
    'assets/images/searchattendance.png',
    'assets/images/searchattendance.png',
  ];

  static var downloadLists = [
    'Assignment',
    'Syllabus',
    'Other Downloads',
  ];
  static var downloadListIcons = [
    'assets/images/downloads.png',
    'assets/images/downloads.png',
    'assets/images/downloads.png',
  ];

  static var studentLeaves = [
    'Apply Leave',
    'Leave List',
  ];

  static var studentLeavesIcons = [
    'assets/images/hwlist.png',
    'assets/images/addhw.png',
  ];

  static var studentLessonPlan = [
    'Lesson Plan',
    'Overview',
  ];

  static var studentLessonPlanIcons = [
    'assets/images/routine.png',
    'assets/images/routine.png',
  ];

  static var adminFees = [
    'Add Fee',
    'Fee List',
  ];
  static var adminFeeIcons = [
    'assets/images/fees_icon.png',
    'assets/images/addhw.png',
  ];
  static var adminFeesNew = [
    'Fee Group',
    'Fee Type',
    'Fee Invoice',
    'Bank Payment',
    'Reports',
  ];
  static var adminFeeIconsNew = [
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
  ];

  static var adminFeesReport = [
    'Due Report',
    'Fine Report',
    'Payment Report',
    'Balance Report',
    'Waiver Report',
  ];

  static var driver = [
    'Transport',
    'About',
    'Settings',
  ];
  static var driverIcons = [
    'assets/images/transport.png',
    'assets/images/about.png',
    'assets/images/addhw.png',
  ];

  static void getFunctions(BuildContext context, String rule) {
    Route route;

    switch (rule) {
      case '1':
        route = ScaleRoute(page: Home(admins, adminIcons, rule));
        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
        break;
      case '2':
        route = ScaleRoute(page: DashboardScreen(students, studentIcons, rule));
        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
        break;
      case '3':
        route = ScaleRoute(page: Home(parent, parentIcons, rule));
        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
        break;
      case '4':
        route =
            ScaleRoute(page: DashboardScreen(teachers, teachersIcons, rule));
        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
        break;
      case '5':
        route = ScaleRoute(page: Home(admins, adminIcons, rule));
        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
        break;
      case '9':
        route = ScaleRoute(page: Home(driver, driverIcons, rule));
        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
        break;
    }
  }

  static void getDashboardPage(
    BuildContext context,
    String title, {
    var id,
    String image,
    int zoom,
    String token,
  }) {
    switch (title) {
      case 'Profile':
        pushNewScreen(
          context,
          screen: Profile(
            id: id,
            image: image,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: Profile(
        //       id: id,
        //       image: image,
        //     )));
        break;
      case 'Wallet':
        pushNewScreen(
          context,
          screen: const StudentWalletTransactions(),
          withNavBar: false,
        );
        // pushNewScreen(
        //   context,
        //   screen: const StudentWalletTransactions(),
        //   withNavBar: false,
        // );
        break;
      case 'Routine':
        pushNewScreen(
          context,
          screen: Routine(id: id),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: Routine(id: id)));
        break;
      case 'Homework':
        pushNewScreen(
          context,
          screen: StudentHomework(id: id),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: StudentHomework(id: id)));
        break;
      case 'Study Materials':
        pushNewScreen(
          context,
          screen: DownloadsHome(downloadLists, downloadListIcons, id: id),
          withNavBar: false,
        );
        // Navigator.push(
        //   context,
        //   ScaleRoute(
        //     page: DownloadsHome(downloadLists, downloadListIcons, id: id),
        //   ),
        // );
        break;
      case 'Leave':
        pushNewScreen(
          context,
          screen: LeaveStudentHome(studentLeaves, studentLeavesIcons,
              id: id),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: LeaveStudentHome(studentLeaves, studentLeavesIcons,
        //             id: id)));
        break;
      case 'Dormitory':
        pushNewScreen(
          context,
          screen: const DormitoryScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const DormitoryScreen()));
        break;
      case 'Transport':
        pushNewScreen(
          context,
          screen: const TransportScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const TransportScreen()));
        break;
      case 'Subjects':
        pushNewScreen(
          context,
          screen: SubjectScreen(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //   context,
        //   ScaleRoute(
        //     page: SubjectScreen(
        //       id: id,
        //     ),
        //   ),
        // );
        break;
      case 'Teacher':
        pushNewScreen(
          context,
          screen: StudentTeacher(
            id: id,
            token: token,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //   context,
        //   ScaleRoute(
        //     page: StudentTeacher(
        //       id: id,
        //       token: token,
        //     ),
        //   ),
        // );
        break;
      case 'Library':
        pushNewScreen(
          context,
          screen: LibraryHome(
            librarys,
            libraryIcons,
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //   context,
        //   ScaleRoute(
        //     page: LibraryHome(
        //       librarys,
        //       libraryIcons,
        //       id: id,
        //     ),
        //   ),
        // );
        break;
      case 'Notice':
        pushNewScreen(
          context,
          screen: const NoticeScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const NoticeScreen()));
        break;
      case 'Timeline':
        pushNewScreen(
          context,
          screen: TimelineScreen(id: id),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: TimelineScreen(id: id)));
        break;
      case 'Examination':
        pushNewScreen(
          context,
          screen: ExaminationHome(
            examinations,
            examinationIcons,
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //   context,
        //   ScaleRoute(
        //     page: ExaminationHome(
        //       examinations,
        //       examinationIcons,
        //       id: id,
        //     ),
        //   ),
        // );
        break;
      case 'Online Exam':
        pushNewScreen(
          context,
          screen: OnlineExaminationHome(
            onlineExaminations,
            onlineExaminationIcons,
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //   context,
        //   ScaleRoute(
        //     page: OnlineExaminationHome(
        //       onlineExaminations,
        //       onlineExaminationIcons,
        //       id: id,
        //     ),
        //   ),
        // );
        break;
      case 'Attendance':
        pushNewScreen(
          context,
          screen: StudentAttenHome(
            studentattendance,
            studentattendanceIcons,
            id: id,
            token: token,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //   context,
        //   ScaleRoute(
        //     page: StudentAttenHome(
        //       studentattendance,
        //       studentattendanceIcons,
        //       id: id,
        //       token: token,
        //     ),
        //   ),
        // );
        break;
      case 'Settings':
        pushNewScreen(
          context,
          screen: const SettingScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const SettingScreen()));
        break;
      case 'Lesson':
        pushNewScreen(
          context,
          screen: StudentLessonsView(id),
          withNavBar: false,
        );
        break;
      case 'Class':
        pushNewScreen(
          context,
          screen: VirtualClassMain(),
          withNavBar: false,
        );
        break;
    }
  }

  static void getAdminDashboardPage(BuildContext context, String title,
      String uid, SystemSettings systemSettings) {
    switch (title) {
      case 'Students':
        pushNewScreen(
          context,
          screen: StudentSearch(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Fees':
        if (systemSettings.data.feesStatus == 0) {

          pushNewScreen(
            context,
            screen: AdminFeesHome(adminFees, adminFeeIcons),
            withNavBar: false,
          );

          // Navigator.push(context,
          //     ScaleRoute(page: AdminFeesHome(adminFees, adminFeeIcons)));
        } else {
          pushNewScreen(
            context,
            screen: AdminFeesHome(adminFeesNew, adminFeeIconsNew),
            withNavBar: false,
          );
          // Navigator.push(context,
          //     ScaleRoute(page: AdminFeesHome(adminFeesNew, adminFeeIconsNew)));
        }
        break;
      case 'Library':
        pushNewScreen(
          context,
          screen: AdminLibraryHome(adminLibrary, adminLibraryIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminLibraryHome(adminLibrary, adminLibraryIcons)));
        break;
      case 'Attendance':
        pushNewScreen(
          context,
          screen: AdminAttendanceHomeScreen(attendance, attendanceIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminAttendanceHomeScreen(attendance, attendanceIcons)));
        break;
      case 'Transport':
        pushNewScreen(
          context,
          screen: AdminTransportHome(adminTransport, adminTransportIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminTransportHome(adminTransport, adminTransportIcons)));
        break;
      case 'Staff':
        pushNewScreen(
          context,
          screen: const AdminStaffList(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AdminStaffList()));
        break;
      case 'Content':
        pushNewScreen(
          context,
          screen: ContentHomeScreen(contents, contentsIcons),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: ContentHomeScreen(contents, contentsIcons)));
        break;
      case 'Notice':
        pushNewScreen(
          context,
          screen: const StaffNoticeScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const StaffNoticeScreen()));
        break;
      case 'Dormitory':
        pushNewScreen(
          context,
          screen: AdminDormitoryHome(adminDormitory, adminDormitoryIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminDormitoryHome(adminDormitory, adminDormitoryIcons)));
        break;
      case 'Leave':
        pushNewScreen(
          context,
          screen: const LeaveAdminHomeScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const LeaveAdminHomeScreen()));
        break;
      case 'Settings':
        pushNewScreen(
          context,
          screen: const SettingScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const SettingScreen()));
        break;
      case 'Class':
        pushNewScreen(
          context,
          screen: VirtualClassMain(),
          withNavBar: false,
        );
        break;
    }
  }

  static void getSaasAdminDashboardPage(BuildContext context, String title,
      String uid, SystemSettings systemSettings) {
    switch (title) {
      case 'Students':
        pushNewScreen(
          context,
          screen: StudentSearch(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Fees':
        if (systemSettings.data.feesStatus == 0) {
          pushNewScreen(
            context,
            screen: AdminFeesHome(adminFees, adminFeeIcons),
            withNavBar: false,
          );
          // Navigator.push(context,
          //     ScaleRoute(page: AdminFeesHome(adminFees, adminFeeIcons)));
        } else {
          pushNewScreen(
            context,
            screen: AdminFeesHome(adminFeesNew, adminFeeIconsNew),
            withNavBar: false,
          );
          // Navigator.push(context,
          //     ScaleRoute(page: AdminFeesHome(adminFeesNew, adminFeeIconsNew)));
        }
        break;
      case 'Library':
        pushNewScreen(
          context,
          screen: AdminLibraryHome(adminLibrary, adminLibraryIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminLibraryHome(adminLibrary, adminLibraryIcons)));
        break;
      case 'Attendance':
        pushNewScreen(
          context,
          screen: AttendanceHomeScreen(attendance, attendanceIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AttendanceHomeScreen(attendance, attendanceIcons)));
        break;
      case 'Content':
        pushNewScreen(
          context,
          screen: ContentHomeScreen(contents, contentsIcons),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: ContentHomeScreen(contents, contentsIcons)));
        break;
      case 'Transport':
        pushNewScreen(
          context,
          screen: AdminTransportHome(adminTransport, adminTransportIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminTransportHome(adminTransport, adminTransportIcons)));
        break;
      case 'Staff':
        pushNewScreen(
          context,
          screen: const AdminStaffList(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AdminStaffList()));
        break;
      case 'Dormitory':
        pushNewScreen(
          context,
          screen: AdminDormitoryHome(adminDormitory, adminDormitoryIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminDormitoryHome(adminDormitory, adminDormitoryIcons)));
        break;
      case 'Notice':
        pushNewScreen(
          context,
          screen: const StaffNoticeScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const StaffNoticeScreen()));
        break;
      case 'Leave':
        pushNewScreen(
          context,
          screen: const LeaveAdminHomeScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const LeaveAdminHomeScreen()));
        break;
      case 'Settings':
        pushNewScreen(
          context,
          screen: const SettingScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const SettingScreen()));
        break;

      case 'Class':
        pushNewScreen(
          context,
          screen: VirtualClassMain(),
          withNavBar: false,
        );
        break;
    }
  }

  static void getAdminFeePage(BuildContext context, String title) {
    switch (title) {
      case 'Add Fee':
        pushNewScreen(
          context,
          screen: const AddFeeType(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddFeeType()));
        break;
      case 'Fee List':
        pushNewScreen(
          context,
          screen: const AdminFeeListView(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AdminFeeListView()));
        break;
    }
  }

  static void getAdminFeePageNew(BuildContext context, String title) {
    switch (title) {
      case 'Fee Group':
        pushNewScreen(
          context,
          screen: const FeesGroupScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const FeesGroupScreen()));
        break;
      case 'Fee Type':
        pushNewScreen(
          context,
          screen: const FeesTypeScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const FeesTypeScreen()));
        break;
      case 'Fee Invoice':
        pushNewScreen(
          context,
          screen: const FeesInvoiceScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const FeesInvoiceScreen()));
        break;
      case 'Bank Payment':
        pushNewScreen(
          context,
          screen: const FeeBankPaymentSearch(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const FeeBankPaymentSearch()));
        break;
      case 'Reports':
        pushNewScreen(
          context,
          screen: AdminFeesReportMain(adminFeesReport, adminFeeIconsNew),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminFeesReportMain(adminFeesReport, adminFeeIconsNew)));
        break;
    }
  }

  static void getAdminFeesReportPage(BuildContext context, String title) {
    switch (title) {
      case 'Due Report':
        pushNewScreen(
          context,
          screen: const AdminFeesDueReport(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AdminFeesDueReport()));
        break;
      case 'Fine Report':
        pushNewScreen(
          context,
          screen: const AdminFeesFineReport(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AdminFeesFineReport()));
        break;
      case 'Payment Report':
        pushNewScreen(
          context,
          screen: const AdminFeesPaymentReport(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const AdminFeesPaymentReport()));
        break;
      case 'Balance Report':
        pushNewScreen(
          context,
          screen: const AdminFeesBalanceReport(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const AdminFeesBalanceReport()));
        break;
      case 'Waiver Report':
        pushNewScreen(
          context,
          screen: const AdminFeesWaiverReport(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const AdminFeesWaiverReport()));
        break;
    }
  }

  static void getAdminLibraryPage(BuildContext context, String title) {
    switch (title) {
      case 'Add Book':
        pushNewScreen(
          context,
          screen: const AddAdminBook(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddAdminBook()));
        break;
      case 'Add Member':
        pushNewScreen(
          context,
          screen: const AddMember(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddMember()));
        break;
      case 'Book List':
        pushNewScreen(
          context,
          screen: const BookListScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const BookListScreen()));
        break;
    }
  }

  static void getAdminDormitoryPage(BuildContext context, String title) {
    switch (title) {
      case 'Room List':
        pushNewScreen(
          context,
          screen: const DormitoryScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const DormitoryScreen()));
        break;
      case 'Add Room':
        pushNewScreen(
          context,
          screen: const AddRoom(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddRoom()));
        break;
      case 'Add Dormitory':
        pushNewScreen(
          context,
          screen: const AddDormitory(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddDormitory()));
        break;
    }
  }

  static void getAdminTransportPage(BuildContext context, String title) {
    switch (title) {
      case 'Route':
        pushNewScreen(
          context,
          screen: const AddRoute(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddRoute()));
        break;
      case 'Vehicle':
        pushNewScreen(
          context,
          screen: const AddVehicle(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddVehicle()));
        break;
      case 'Assign Vehicle':
        pushNewScreen(
          context,
          screen: const AssignVehicle(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AssignVehicle()));
        break;
      case 'Transport':
        pushNewScreen(
          context,
          screen: const TransportScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const TransportScreen()));
        break;
    }
  }

  static void getTeacherDashboardPage(
      BuildContext context, String title, String uid) {
    switch (title) {
      case 'Students':
        pushNewScreen(
          context,
          screen: StudentSearch(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Academic':
        pushNewScreen(
          context,
          screen: AcademicHomeScreen(academics, academicsIcons),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: AcademicHomeScreen(academics, academicsIcons)));
        break;
      case 'Attendance':
        pushNewScreen(
          context,
          screen: AttendanceHomeScreen(attendance, attendanceIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AttendanceHomeScreen(attendance, attendanceIcons)));
        break;
      case 'Homework':
        pushNewScreen(
          context,
          screen: HomeworkHomeScreen(homework, homeworkIcons),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: HomeworkHomeScreen(homework, homeworkIcons)));
        break;
      case 'Content':
        pushNewScreen(
          context,
          screen: ContentHomeScreen(contents, contentsIcons),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: ContentHomeScreen(contents, contentsIcons)));
        break;
      case 'Leave':
        pushNewScreen(
          context,
          screen: LeaveHomeScreen(leaves, leavesIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: LeaveHomeScreen(leaves, leavesIcons)));
        break;
      case 'Library':
        pushNewScreen(
          context,
          screen: const BookListScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const BookListScreen()));
        break;
      case 'Notice':
        pushNewScreen(
          context,
          screen: const StaffNoticeScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const StaffNoticeScreen()));
        break;
      case 'About':
        pushNewScreen(
          context,
          screen: const AboutScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AboutScreen()));
        break;
      case 'Settings':
        pushNewScreen(
          context,
          screen: const SettingScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const SettingScreen()));
        break;
      case 'Class':
        pushNewScreen(
          context,
          screen: VirtualClassMain(),
          withNavBar: false,
        );
        break;
    }
  }

  static void getParentDashboardPage(
      BuildContext context, String title, String uid) {
    switch (title) {
      case 'Child':
        pushNewScreen(
          context,
          screen: ChildListScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const ChildListScreen()));
        break;
      case 'About':
        pushNewScreen(
          context,
          screen: AboutScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AboutScreen()));
        break;
      case 'Settings':
        pushNewScreen(
          context,
          screen: SettingScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const SettingScreen()));
        break;
      // case 'Zoom':
      //   Navigator.push(
      //       context,
      //       ScaleRoute(
      //           page: VirtualMeetingScreen(
      //             uid: uid,
      //           )));
      //   break;
    }
  }

  static void getAttendanceDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Class Atten':
        pushNewScreen(
          context,
          screen: const StudentAttendanceHome(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const StudentAttendanceHome()));
        break;
      case 'Subject Atten':
        pushNewScreen(
          context,
          screen: const StudentSubjectAttendanceHome(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const StudentSubjectAttendanceHome()));
        break;
      case 'Search Atten':
        pushNewScreen(
          context,
          screen: StudentSearch(
            status: 'attendance',
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: StudentSearch(
        //       status: 'attendance',
        //     )));
        break;
      case 'Search Sub Atten':
        pushNewScreen(
          context,
          screen: SubjectStudentSearch(
            status: 'attendance',
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: SubjectStudentSearch(
        //       status: 'attendance',
        //     )));
        break;
      case 'My Atten':
        pushNewScreen(
          context,
          screen:  const TeacherAttendanceScreen(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const TeacherAttendanceScreen()));
        break;
    }
  }

  static void getAdminAttendanceDashboardPage(
      BuildContext context, String title) {
    switch (title) {
      case 'Class Atten':
        pushNewScreen(
          context,
          screen:  const StudentAttendanceHome(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const StudentAttendanceHome()));
        break;
      case 'Subject Atten':
        pushNewScreen(
          context,
          screen:  const StudentSubjectAttendanceHome(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const StudentSubjectAttendanceHome()));
        break;
      case 'Search Atten':
        pushNewScreen(
          context,
          screen:  StudentSearch(
            status: 'attendance',
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: StudentSearch(
        //       status: 'attendance',
        //     )));
        break;
      case 'Search Sub Atten':
        pushNewScreen(
          context,
          screen:  SubjectStudentSearch(
            status: 'attendance',
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: SubjectStudentSearch(
        //       status: 'attendance',
        //     )));
        break;
    }
  }

  static void getAcademicDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Subjects':
        pushNewScreen(
          context,
          screen:  const MySubjectScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const MySubjectScreen()));
        break;
      case 'Class Routine':
        pushNewScreen(
          context,
          screen:  const SearchRoutineScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const SearchRoutineScreen()));
        break;
      case 'My Routine':
        pushNewScreen(
          context,
          screen:  const TeacherMyRoutineScreen(),
          withNavBar: false,
        );
        // Navigator.push(
        //     context, ScaleRoute(page: const TeacherMyRoutineScreen()));
        break;
    }
  }

  static void getLibraryDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Book List':
        pushNewScreen(
          context,
          screen:  const BookListScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const BookListScreen()));
        break;
      case 'Books Issued':
        pushNewScreen(
          context,
          screen:  BookIssuedScreen(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: BookIssuedScreen(
        //       id: id,
        //     )));
        break;
    }
  }

  static void getHomeworkDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'HW List':
        pushNewScreen(
          context,
          screen:  const TeacherHomework(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const TeacherHomework()));
        break;
      case 'Add HW':
        pushNewScreen(
          context,
          screen:  const AddHomeworkScrren(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddHomeworkScrren()));
        break;
    }
  }

  static void getContentDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Content List':
        pushNewScreen(
          context,
          screen:  const ContentListScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const ContentListScreen()));
        break;
      case 'Add Content':
        pushNewScreen(
          context,
          screen:  const AddContentScreeen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AddContentScreeen()));
        break;
    }
  }

  static void getLeaveDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Leave List':
        pushNewScreen(
          context,
          screen:  LeaveListStudent(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: LeaveListStudent()));
        break;
      case 'Apply Leave':
        pushNewScreen(
          context,
          screen:  const ApplyLeaveScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const ApplyLeaveScreen()));
        break;
    }
  }

  static void getExaminationDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Schedule':
        pushNewScreen(
          context,
          screen:  ScheduleScreen(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: ScheduleScreen(
        //       id: id,
        //     )));
        break;
      case 'Result':
        pushNewScreen(
          context,
          screen:  ClassExamResultScreen(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: ClassExamResultScreen(
        //       id: id,
        //     )));
        break;
    }
  }

  static void getDownloadsDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Assignment':
        pushNewScreen(
          context,
          screen:  StudentStudyMaterialMain(
            id: id,
            type: 'as',
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: StudentStudyMaterialMain(
        //       id: id,
        //       type: 'as',
        //     )));
        break;
      case 'Syllabus':
        pushNewScreen(
          context,
          screen:  StudentStudyMaterialMain(id: id, type: 'sy'),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: StudentStudyMaterialMain(id: id, type: 'sy')));
        break;
      case 'Other Downloads':
        pushNewScreen(
          context,
          screen:  StudentStudyMaterialMain(id: id, type: 'ot'),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: StudentStudyMaterialMain(id: id, type: 'ot')));
        break;
    }
  }

  static void getStudentAttendanceDashboardPage(
      BuildContext context, String title,
      {var id, String image, int zoom, String token}) {
    switch (title) {
      case 'Search Atten':
        pushNewScreen(
          context,
          screen: StudentAttendanceScreen(id: id, token: token),
          withNavBar: false,
        );
        // Navigator.push(context,
        //     ScaleRoute(page: StudentAttendanceScreen(id: id, token: token)));
        break;
      case 'Search Sub Atten':
        pushNewScreen(
          context,
          screen: StudentSubjectListScreen(
            id: id,
            token: token,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: StudentSubjectListScreen(
        //       id: id,
        //       token: token,
        //     )));
        break;
      // Navigator.push(
      //     context,
      //     ScaleRoute(
      //         page: StudentSubjectAttendanceScreen(
      //       id: id,
      //       token: token,
      //     )));
      // break;
    }
  }

  static void getStudentLeaveDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Apply Leave':
        pushNewScreen(
          context,
          screen:  LeaveStudentApply(id),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: LeaveStudentApply(id)));
        break;
      case 'Leave List':
        pushNewScreen(
          context,
          screen:  LeaveListStudent(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: LeaveListStudent(
        //       id: id,
        //     )));
        break;
    }
  }

  static void getOnlineExaminationDashboardPage(
      BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Active Exam':
        pushNewScreen(
          context,
          screen:  ActiveOnlineExamScreen(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: ActiveOnlineExamScreen(
        //       id: id,
        //     )));
        break;
      case 'Exam Result':
        pushNewScreen(
          context,
          screen:  OnlineExamResultScreen(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: OnlineExamResultScreen(
        //       id: id,
        //     )));
        break;
    }
  }

  static void getOnlineExaminationModuleDashboardPage(
      BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Active Exam':
        pushNewScreen(
          context,
          screen:  ActiveOnlineExams(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: ActiveOnlineExams(
        //       id: id,
        //     )));
        break;
      case 'Exam Result':
        pushNewScreen(
          context,
          screen:  OnlineExamResults(
            id: id,
          ),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: OnlineExamResults(
        //       id: id,
        //     )));
        break;
    }
  }

  static void getDriverDashboard(BuildContext context, String title, String uid,
      SystemSettings systemSettings) {
    switch (title) {
      case 'Transport':
        pushNewScreen(
          context,
          screen:  AdminTransportHome(adminTransport, adminTransportIcons),
          withNavBar: false,
        );
        // Navigator.push(
        //     context,
        //     ScaleRoute(
        //         page: AdminTransportHome(adminTransport, adminTransportIcons)));
        break;
      case 'About':
        pushNewScreen(
          context,
          screen:  const AboutScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const AboutScreen()));
        break;
      case 'Settings':
        pushNewScreen(
          context,
          screen:  const SettingScreen(),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: const SettingScreen()));
        break;
    }
  }

  static String getContentType(String ctype) {
    String type = '';
    switch (ctype) {
      case 'as':
        type = 'assignment';
        break;
      case 'st':
        type = 'study material';
        break;
      case 'sy':
        type = 'syllabus';
        break;
      case 'ot':
        type = 'others download';
        break;
    }
    return type;
  }

  static var weeks = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  static void getStudentLessonPlanDashboard(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Lesson Plan':
        pushNewScreen(
          context,
          screen: StudentLessonsView(id),
          withNavBar: false,
        );
        break;
      case 'Overview':
        pushNewScreen(
          context,
          screen: StudentLessonsView(id),
          withNavBar: false,
        );
        // Navigator.push(context, ScaleRoute(page: StudentLessonsView(id)));
        break;
    }
  }

  //formet time
  static String getAmPm(String time) {
    var parts = time.split(":");
    String part1 = parts[0];
    String part2 = parts[1];

    int hr = int.parse(part1);
    int min = int.parse(part2);

    if (hr <= 12) {
      if (hr == 10 || hr == 11 || hr == 12) {
        return "$hr:$min" "am";
      }
      return "0$hr:$min" "am";
    } else {
      hr = hr - 12;
      return "0$hr:$min" "pm";
    }
  }

  static String getExtention(String url) {
    var parts = url.split("/");
    return parts[parts.length - 1];
  }

  //return day of month
  static String getDay(String date) {
    var parts = date.split("-");
    return parts[parts.length - 1];
  }
}
