import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:infixedu/config/app_config.dart';
import 'package:infixedu/screens/chat/views/FilePreview/ImagePreview.dart';
import 'package:infixedu/screens/chat/views/FilePreview/NetworkVideoPlayer.dart';
import 'package:infixedu/screens/student/studyMaterials/StudyMaterialViewer.dart';
import 'package:infixedu/screens/chat/models/ChatMessage.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class ChatMessageWidget extends StatefulWidget {
  final String name;
  final ChatMessage chatMessage;
  final int id;
  final Function onTapMenu;
  final bool menuVisible;
  final bool showActions;
  final int activeStatus;
  const ChatMessageWidget({Key key, 
    this.name,
    this.chatMessage,
    this.id,
    this.onTapMenu,
    this.menuVisible,
    this.showActions,
    this.activeStatus,
  }) : super(key: key);
  @override
  _ChatMessageWidgetState createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  bool visiblity = false;
  @override
  void initState() {
    visiblity = widget.menuVisible;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Text(
    //     "ID --> ${widget.chatMessage.id} - ${widget.chatMessage.message}");
    if (widget.chatMessage.reply != null) {
      return replyToMessageWidget();
    } else if (widget.chatMessage.forwardFrom != null) {
      return forwardedMessageWidget();
    } else {
      return chatMessageWidget();
    }
  }

  void onTap() {
    // setState(() {
    //   isMenuOpen = !isMenuOpen;
    //   showDate = !showDate;
    // });
    widget.onTapMenu();
  }

  getStatusColor(int chatStatus) {
    if (chatStatus == 0) {
      return Colors.grey;
    } else if (chatStatus == 1) {
      return Colors.green;
    } else if (chatStatus == 2) {
      return Colors.amber;
    } else if (chatStatus == 3) {
      return Colors.red;
    }
  }

  getLeadingIcon(int messageType) {
    if (messageType == 1) {
      //**png jpg jpeg
      return Icons.image;
    } else if (messageType == 2) {
      //**pdf
      return Icons.picture_as_pdf;
    } else if (messageType == 3) {
      //**doc docx
      return Icons.document_scanner;
    } else if (messageType == 4) {
      //**webm
      return Icons.video_call;
    } else if (messageType == 5) {
      //**mp4 3gp mkv
      return Icons.tv;
    } else {
      return Icons.nat;
    }
  }

  showOpenImage(){
    return Dialog(
      child: CachedNetworkImage(
        imageUrl:
        "${AppConfig.domainName}/${widget.chatMessage.fileName}",
        imageBuilder:
            (context, imageProvider) =>
            Container(
              width: context.height * 0.6,
              height: context.height * 0.8,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                ),
              ),
            ),
        placeholder: (context, url) =>
        const CupertinoActivityIndicator(),
        errorWidget: (context, url, error) =>
            Image.network(
              "${AppConfig.domainName}/public/chat/images/bw-spondon-icon.png",
              width: 20.w,
            ),
      ),
    );
  }

  Widget fileWidget(dynamic conversation) {
    if (conversation.messageType == 1) {
      return SizedBox(
        height: 50,
        width: 50,
        child: InkWell(
          onTap: () {
            Get.to(() => ImagePreviewPage(
                  title: conversation.originalFileName,
                  imageUrl: "${AppConfig.domainName}/${conversation.fileName}",
                ));
          },
          child: FancyShimmerImage(
            imageUrl: "${AppConfig.domainName}/${conversation.fileName}",
            boxFit: BoxFit.contain,
            errorWidget: FancyShimmerImage(
              imageUrl:
                  "${AppConfig.domainName}/public/chat/images/bw-spondon-icon.png",
              boxFit: BoxFit.contain,
            ),
          ),
        ),
      );
    } else if (conversation.messageType == 2) {
      return InkWell(
        onTap: () async {
          Get.to(() => DownloadViewer(
                title: "${conversation.originalFileName}",
                filePath: "${AppConfig.domainName}/${conversation.fileName}",
              ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: widget.chatMessage.fromId != widget.id
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Icon(
                getLeadingIcon(conversation.messageType),
                color: Colors.white,
                size: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  "${conversation.originalFileName}",
                  style: Get.textTheme.titleMedium.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (conversation.messageType == 3) {
      return InkWell(
        onTap: () async {
          //** DOC/DOCX FILE */
          final url = "${AppConfig.domainName}/${conversation.fileName}";
          // ignore: deprecated_member_use
          if (await canLaunch(url)) {
            // ignore: deprecated_member_use
            await launch(url);
          } else {
            throw 'Unable to open url : $url';
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                getLeadingIcon(conversation.messageType),
                color: Colors.white,
                size: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  "${conversation.originalFileName}",
                  style: Get.textTheme.titleMedium.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (conversation.messageType == 4 || conversation.messageType == 5) {
      return InkWell(
        onTap: () {
          //** webm */
          //** mp4 3gp mkv */

          Get.to(() => NetworkVideoPlayerView(
              videoUrl: "${AppConfig.domainName}/${conversation.fileName}"));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                getLeadingIcon(conversation.messageType),
                color: Colors.white,
                size: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  "${conversation.originalFileName}",
                  style: Get.textTheme.titleMedium.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget chatMessageWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showActions
            ? widget.chatMessage.fromId == widget.id
                ? InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.more_vert,
                        color: Get.theme.primaryColor,
                        size: 16,
                      ),
                    ),
                  )
                : const SizedBox.shrink()
            : const SizedBox.shrink(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.chatMessage.fromId != widget.id
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text(
                      //   widget.chatMessage.fromUser.firstName,
                      //   textAlign: widget.chatMessage.fromId == widget.id
                      //       ? TextAlign.right
                      //       : TextAlign.left,
                      //   style: Get.textTheme.titleMedium.copyWith(
                      //     color: widget.chatMessage.fromId != widget.id
                      //         ? visiblity
                      //             ? Colors.white
                      //             : Get.theme.primaryColor
                      //         : Colors.grey.shade200,
                      //     fontSize: 10.sp,
                      //   ),
                      // ),
                      // const SizedBox(width: 5),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: getStatusColor(widget.activeStatus),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            widget.chatMessage.fromId != widget.id
                ? const SizedBox(height: 2.5)
                : const SizedBox.shrink(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.chatMessage.fromId != widget.id
                        ? const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )
                        : const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                    color: widget.chatMessage.fromId != widget.id
                        ? const Color(0xff6F7DB7)
                        : const Color(0xff7c31fe),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 0.7,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: widget.chatMessage.fromId != widget.id
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment:
                            widget.chatMessage.fromId != widget.id
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        children: [
                          widget.chatMessage.message != null
                              ? HtmlWidget(
                                widget.chatMessage.message,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              )
                              : widget.chatMessage.fileName != null ? GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (_) => showOpenImage());
                            },
                                child: CachedNetworkImage(
                            imageUrl:
                            "${AppConfig.domainName}/${widget.chatMessage.fileName}",
                            imageBuilder:
                                  (context, imageProvider) =>
                                  Container(
                                    width: 120.w,
                                    height: 250.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fitHeight,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                            placeholder: (context, url) =>
                            const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                                  Image.network(
                                    "${AppConfig.domainName}/public/chat/images/bw-spondon-icon.png",
                                    width: 20.w,
                                  ),
                          ),
                              ) : const SizedBox.shrink(),
                          Directionality(
                            textDirection:
                                widget.chatMessage.fromId != widget.id
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            child: fileWidget(widget.chatMessage),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          timeago.format(widget.chatMessage.createdAt),
                          textAlign: widget.chatMessage.fromId == widget.id
                              ? TextAlign.right
                              : TextAlign.left,
                          style: Get.textTheme.titleMedium.copyWith(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                widget.showActions
                    ? widget.chatMessage.fromId != widget.id
                        ? InkWell(
                            customBorder: const CircleBorder(),
                            onTap: onTap,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                Icons.more_vert,
                                color: Get.theme.primaryColor,
                                size: 16,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget replyToMessageWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showActions
            ? widget.chatMessage.fromId == widget.id
                ? InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.more_vert,
                        color: Get.theme.primaryColor,
                        size: 16,
                      ),
                    ),
                  )
                : const SizedBox.shrink()
            : const SizedBox.shrink(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.chatMessage.fromId != widget.id
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.name,
                        textAlign: widget.chatMessage.fromId == widget.id
                            ? TextAlign.right
                            : TextAlign.left,
                        style: Get.textTheme.titleMedium.copyWith(
                          color: widget.chatMessage.fromId != widget.id
                              ? visiblity
                                  ? Colors.white
                                  : Get.theme.primaryColor
                              : Colors.grey.shade200,
                          fontSize: 10.sp,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: getStatusColor(widget.activeStatus),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            widget.chatMessage.fromId != widget.id
                ? const SizedBox(height: 2.5)
                : const SizedBox.shrink(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: widget.chatMessage.fromId != widget.id
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: widget.chatMessage.fromId != widget.id
                            ? const BorderRadius.only(
                                topRight: Radius.circular(10),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                        color: widget.chatMessage.fromId != widget.id
                            ? const Color(0xffB9C4F3)
                            : const Color(0xffBEACDD),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: Get.width * 0.7,
                      ),
                      width: Get.width * 0.7,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment:
                            widget.chatMessage.fromId != widget.id
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        children: [
                          widget.chatMessage.reply.message != null
                              ? Column(
                                  crossAxisAlignment:
                                      widget.chatMessage.fromId != widget.id
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.end,
                                  children: [
                                    widget.chatMessage.fromId != widget.id
                                        ? Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                Matrix4.rotationY(math.pi),
                                            child: const Icon(
                                              Icons.format_quote,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Icon(
                                            Icons.format_quote,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                    HtmlWidget(
                                      "${widget.chatMessage.reply.message ?? ""}",
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          .copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: widget.chatMessage.fromId != widget.id
                            ? const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )
                            : const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                        color: widget.chatMessage.fromId != widget.id
                            ? const Color(0xff6F7DB7)
                            : const Color(0xff7c31fe),
                      ),
                      width: Get.width * 0.7,
                      constraints: BoxConstraints(
                        maxWidth: Get.width * 0.7,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment:
                            widget.chatMessage.fromId != widget.id
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment:
                                widget.chatMessage.fromId != widget.id
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment:
                                    widget.chatMessage.fromId != widget.id
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                children: [
                                  widget.chatMessage.message != null
                                      ? HtmlWidget(
                                          widget.chatMessage.message,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              .copyWith(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(height: 10),
                                  fileWidget(widget.chatMessage.reply),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  timeago.format(widget.chatMessage.createdAt),
                                  textAlign:
                                      widget.chatMessage.fromId == widget.id
                                          ? TextAlign.right
                                          : TextAlign.left,
                                  style: Get.textTheme.titleMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                widget.showActions
                    ? widget.chatMessage.fromId != widget.id
                        ? InkWell(
                            customBorder: const CircleBorder(),
                            onTap: onTap,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                Icons.more_vert,
                                color: Get.theme.primaryColor,
                                size: 16,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget forwardedMessageWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showActions
            ? widget.chatMessage.fromId == widget.id
                ? InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.more_vert,
                        color: Get.theme.primaryColor,
                        size: 16,
                      ),
                    ),
                  )
                : const SizedBox.shrink()
            : const SizedBox.shrink(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.chatMessage.fromId != widget.id
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.chatMessage.fromUser.fullName ?? widget.chatMessage.fromUser.email ?? "",
                        textAlign: widget.chatMessage.fromId == widget.id
                            ? TextAlign.right
                            : TextAlign.left,
                        style: Get.textTheme.titleMedium.copyWith(
                          color: widget.chatMessage.fromId != widget.id
                              ? visiblity
                                  ? Colors.white
                                  : Get.theme.primaryColor
                              : Colors.grey.shade200,
                          fontSize: 10.sp,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: getStatusColor(widget.activeStatus),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            widget.chatMessage.fromId != widget.id
                ? const SizedBox(height: 2.5)
                : const SizedBox.shrink(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: widget.chatMessage.fromId != widget.id
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: widget.chatMessage.fromId != widget.id
                            ? const BorderRadius.only(
                                topRight: Radius.circular(10),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                        color: widget.chatMessage.fromId != widget.id
                            ? const Color(0xffB9C4F3)
                            : const Color(0xffBEACDD),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: Get.width * 0.7,
                      ),
                      width: Get.width * 0.7,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment:
                            widget.chatMessage.fromId != widget.id
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment:
                                widget.chatMessage.fromId != widget.id
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Forwarded Message",
                                textAlign:
                                    widget.chatMessage.fromId == widget.id
                                        ? TextAlign.right
                                        : TextAlign.left,
                                style: Get.textTheme.titleMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              HtmlWidget(
                                widget.chatMessage.forwardFrom.message ?? "",
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                              ),
                              fileWidget(widget.chatMessage.forwardFrom),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: widget.chatMessage.fromId != widget.id
                            ? const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )
                            : const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                        color: widget.chatMessage.fromId != widget.id
                            ? const Color(0xff6F7DB7)
                            : const Color(0xff7c31fe),
                      ),
                      width: Get.width * 0.7,
                      constraints: BoxConstraints(
                        maxWidth: Get.width * 0.7,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment:
                            widget.chatMessage.fromId != widget.id
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment:
                                widget.chatMessage.fromId != widget.id
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment:
                                    widget.chatMessage.fromId != widget.id
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                children: [
                                  widget.chatMessage.message != null
                                      ? HtmlWidget(
                                          widget.chatMessage.message,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              .copyWith(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(height: 10),
                                  fileWidget(widget.chatMessage),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  timeago.format(widget.chatMessage.createdAt),
                                  textAlign:
                                      widget.chatMessage.fromId == widget.id
                                          ? TextAlign.right
                                          : TextAlign.left,
                                  style: Get.textTheme.titleMedium.copyWith(
                                    color: Colors.white,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                widget.showActions
                    ? widget.chatMessage.fromId != widget.id
                        ? InkWell(
                            customBorder: const CircleBorder(),
                            onTap: onTap,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                Icons.more_vert,
                                color: Get.theme.primaryColor,
                                size: 16,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
