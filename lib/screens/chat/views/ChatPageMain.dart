import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infixedu/config/app_config.dart';
import 'package:infixedu/screens/chat/controller/chat_controller.dart';
import 'package:infixedu/screens/chat/views/BlockedUserPage.dart';
import 'package:infixedu/screens/chat/views/Single/ChatOpenPage.dart';
import 'package:infixedu/screens/chat/views/ChatPeopleSearchPage.dart';
import 'package:infixedu/screens/chat/views/Group/CreateGroupPage.dart';
import 'package:infixedu/screens/chat/views/Group/GroupChatOpenPage.dart';
import 'package:infixedu/screens/chat/models/ChatActiveStatus.dart';
import 'package:infixedu/screens/chat/models/ChatGroup.dart';
import 'package:infixedu/screens/chat/models/ChatUser.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

EdgeInsetsGeometry customPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 10);

class ChatPageMain extends StatefulWidget {
  const ChatPageMain({Key key}) : super(key: key);

  @override
  _ChatPageMainState createState() => _ChatPageMainState();
}

class _ChatPageMainState extends State<ChatPageMain>
    with SingleTickerProviderStateMixin {
  final ChatController _chatController = Get.put(ChatController());
  TabController tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Chats'),
    const Tab(text: 'Groups'),
  ];

  getStatusColor(ChatStatus chatStatus) {
    if (chatStatus.status == 0) {
      return Colors.grey;
    } else if (chatStatus.status == 1) {
      return Colors.green;
    } else if (chatStatus.status == 2) {
      return Colors.amber;
    } else if (chatStatus.status == 3) {
      return Colors.red;
    }
  }

  @override
  void initState() {
    tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: SizedBox(
          height: 100.h,
          child: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 20.h),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppConfig.appToolbarBackground),
                  fit: BoxFit.fill,
                ),
                color: Colors.deepPurple,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 70.h,
                      width: 70.w,
                      child: IconButton(
                          tooltip: 'Back',
                          icon: Icon(
                            Icons.arrow_back,
                            size: ScreenUtil().setSp(20),
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text(
                        "Chat",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            .copyWith(fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Obx(() {
                    if (_chatController.selectedStatus.value.title == null) {
                      return const CupertinoActivityIndicator();
                    } else {
                      return DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Get.theme.primaryColor,
                            ),
                            child: DropdownButton(
                              elevation: 0,
                              isExpanded: false,
                              isDense: true,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.white),
                              iconSize: 20,
                              underline: const SizedBox(),
                              items: _chatController.chatActiveList.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          color: getStatusColor(item),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        item.title,
                                        style: Get.textTheme.titleMedium.copyWith(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (ChatStatus value) async {
                                _chatController.selectedStatus.value = value;

                                await _chatController
                                    .changeActiveStatus(value.status)
                                    .then((status) async {
                                  if (status) {
                                    await _chatController.getUserStatus();
                                  }
                                });
                              },
                              value: _chatController.selectedStatus.value,
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                  const SizedBox(width: 15),
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 1) {
                        Get.to(() => const BlockedUsersPage());
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text("Blocked Users"),
                        value: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
      ),
      body: StreamBuilder<Object>(
        stream: Stream.periodic(
            const Duration(seconds: 5), (_) => _chatController.getAllChats()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  tabs: myTabs,
                  labelColor: Get.theme.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  controller: tabController,
                  indicator: Get.theme.tabBarTheme.indicator,
                  automaticIndicatorColorAdjustment: true,
                  isScrollable: false,
                  labelStyle: Get.textTheme.titleMedium.copyWith(fontSize: 12),
                  unselectedLabelStyle:
                      Get.textTheme.titleMedium.copyWith(fontSize: 12),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: const [
                      ChatListPage(),
                      GroupListPage(),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Column(
              children: [
                TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  tabs: myTabs,
                  labelColor: Get.theme.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  controller: tabController,
                  indicator: Get.theme.tabBarTheme.indicator,
                  automaticIndicatorColorAdjustment: true,
                  isScrollable: false,
                  labelStyle: Get.textTheme.titleMedium.copyWith(fontSize: 12),
                  unselectedLabelStyle:
                      Get.textTheme.titleMedium.copyWith(fontSize: 12),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ChatShimmerList(),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ChatShimmerList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final ChatController _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(() {
              if (_chatController.chatModel.value.users == null) {
                return const ChatShimmerList();
              } else {
                if (_chatController.chatModel.value.users.isEmpty) {
                  return Center(
                    child: Text(
                      "No users found",
                      style: Get.textTheme.titleMedium,
                    ),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: _chatController.chatModel.value.users.length,
                    itemBuilder: (context, index) {
                      ChatUser chatUser =
                          _chatController.chatModel.value.users[index];
                      return ListTile(
                        onTap: () {
                          Get.to(() => ChatOpenPage(
                              avatarUrl: chatUser.avatarUrl,
                              userId: chatUser.id,
                              onlineStatus: chatUser.activeStatus.toString().toInt(),
                              chatTitle:
                                  chatUser.fullName ?? chatUser.email ?? ""));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: chatUser.avatarUrl == "" ||
                                  chatUser.avatarUrl == null
                              ? CachedNetworkImage(
                                  imageUrl:
                                      "${AppConfig.domainName}/public/uploads/staff/demo/staff.jpg",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      '${AppConfig.domainName}/${chatUser.avatarUrl}',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${AppConfig.domainName}/public/uploads/staff/demo/staff.jpg"),
                                        fit: BoxFit.contain,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${AppConfig.domainName}/public/uploads/staff/demo/staff.jpg"),
                                        fit: BoxFit.contain,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              chatUser.fullName ?? chatUser.email ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: Get.textTheme.titleMedium,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: ChatUser()
                                    .getOnlineColor(chatUser.activeStatus),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        subtitle: Text(
                          chatUser.lastMessage != null
                              ? "${chatUser.lastMessage?.characters?.take(20)} ..."
                              : "",
                          style: Get.textTheme.titleSmall,
                        ),
                      );
                    },
                  );
                }
              }
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.primaryColor,
        tooltip: "Search for users",
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(() => const ChatPeopleSearchPage());
        },
      ),
    );
  }
}

class GroupListPage extends StatefulWidget {
  const GroupListPage({Key key}) : super(key: key);

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  final ChatController _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: customPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Groups",
                  style: Get.textTheme.titleMedium,
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          Obx(() {
            if (_chatController.chatModel.value.groups == null) {
              return const ChatShimmerList();
            } else {
              return Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: customPadding,
                  itemCount: _chatController.chatModel.value.groups.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, groupIndex) {
                    ChatGroup chatGroup =
                        _chatController.chatModel.value.groups[groupIndex];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Get.to(() => GroupChatOpenPage(
                            photoUrl: chatGroup.photoUrl,
                            groupId: chatGroup.id,
                            chatGroup: chatGroup,
                            chatTitle: chatGroup.name));
                      },
                      leading: CachedNetworkImage(
                        imageUrl:
                            "${AppConfig.domainName}/${chatGroup.photoUrl}",
                        imageBuilder: (context, imageProvider) => Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: const Icon(
                            Icons.people,
                          ),
                        ),
                        errorWidget: (context, url, error) => SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: const Icon(
                            Icons.people,
                          ),
                        ),
                      ),
                      title: Text(
                        chatGroup.name,
                        style: Get.textTheme.titleMedium,
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
      floatingActionButton: Obx(() {
        if (_chatController.isLoading.value) {
          return Container();
        } else {
          return _chatController
                      .chatSettings.value.permissionSettings.chatCanMakeGroup ==
                  "yes"
              ? FloatingActionButton(
                  backgroundColor: Get.theme.primaryColor,
                  tooltip: "Create Group",
                  onPressed: () {
                    Get.to(() => CreateGroupPage(
                          chatUsers: _chatController.chatModel.value.users,
                        ));
                  },
                  child: Icon(
                    Icons.add,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                )
              : Container();
        }
      }),
    );
  }
}

class ChatShimmerList extends StatelessWidget {
  const ChatShimmerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(child: CircularProgressIndicator());
    return ListView.builder(
      itemCount: 6,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Shimmer.fromColors(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
          ),
          title: Shimmer.fromColors(
            child: Container(
              height: 15,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
          ),
          subtitle: Shimmer.fromColors(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
          ),
        );
      },
    );
  }
}
