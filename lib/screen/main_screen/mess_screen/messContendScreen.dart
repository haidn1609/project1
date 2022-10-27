import 'package:acs_project_example/value/colors.dart';
import 'package:acs_project_example/value/strings.dart';
import 'package:acs_project_example/widget/stateful/itemContentMess.dart';
import 'package:acs_project_example/widget/stateless/gradientWidget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../mock_data.dart';
import '../../../state_manager/providerController.dart';

class MessContendScreen extends StatefulWidget {
  const MessContendScreen({Key? key, required this.mess}) : super(key: key);
  final Map<String, dynamic> mess;

  @override
  State<MessContendScreen> createState() => _MessContendScreenState();
}

class _MessContendScreenState extends State<MessContendScreen> {
  late Map<String, dynamic> mess;
  bool isOnline = true;
  bool emojiShowing = false;
  TextEditingController chatEdit = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    mess = widget.mess;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  Widget emojiPicked() {
    return Offstage(
      offstage: !emojiShowing,
      child: SizedBox(
        height: 300,
        child: EmojiPicker(
          textEditingController: chatEdit,
          config: Config(
              columns: 7,
              emojiSizeMax: 32,
              gridPadding: EdgeInsets.zero,
              initCategory: Category.RECENT,
              bgColor: backgroudWhiteItem,
              indicatorColor: Colors.blue,
              iconColor: dontSelectBtBNB,
              iconColorSelected: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: backgroudWhiteItem,
              enableSkinTones: true,
              showRecentsTab: true,
              recentsLimit: 28,
              replaceEmojiOnLimitExceed: false,
              noRecents: const Text(
                'No Recents',
                style: TextStyle(fontSize: 20, color: Colors.black26),
                textAlign: TextAlign.center,
              ),
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chatEdit.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    Map<String, dynamic> sender = mess["user1"]["name"] == userNow["name"]
        ? mess["user2"]
        : mess["user1"];
    List<Map<String, String>> listContend = mess["mess"];
    return Consumer<ProviderController>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          focusNode.unfocus();
          focusNode.canRequestFocus = false;
          setState(() {
            emojiShowing = false;
          });
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: backgroudWhiteItem,
            leading: InkWell(
              onTap: () {
                value.setDifferenceDay(0);
                Get.back();
              },
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Image.asset("images/icon_back_arrrow.png",
                    width: 25, height: 25),
              ),
            ),
            title: SizedBox(
              width: sizes.width - 50,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(sender["avatar"]),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 60,
                      child: Column(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                sender["name"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  const Text(
                                    "Khách mua",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "• ${isOnline ? isOnlineText : isOfflineText}",
                                      style: TextStyle(
                                        color: isOnline
                                            ? isOnlineColor
                                            : isOfflineColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listContend.length,
                    itemBuilder: (context, index) =>
                        ItemContendMess(contend: listContend[index]),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: GradientWidget(
                        colors: blackGradientColor,
                        child: Image.asset(
                          "images/icon_image.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        color: backgroudWhiteItem,
                        child: Stack(
                          children: [
                            TextField(
                              focusNode: focusNode,
                              controller: chatEdit,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 12, right: 40),
                                hintText: chatHideText,
                                filled: true,
                                fillColor: Colors.white.withOpacity(1),
                                focusColor: Colors.white.withOpacity(1),
                                hoverColor: Colors.white.withOpacity(1),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              showCursor: false,
                            ),
                            Positioned(
                              top: 10,
                              right: 15,
                              child: InkWell(
                                onTap: () {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  setState(() {
                                    emojiShowing = !emojiShowing;
                                  });
                                },
                                child: GradientWidget(
                                  colors: blackGradientColor,
                                  child: Image.asset(
                                    "images/icon_smile_fill.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        chatEdit.clear();
                        focusNode.unfocus();
                        focusNode.canRequestFocus = false;
                        setState(() {
                          emojiShowing = false;
                        });
                      },
                      child: GradientWidget(
                        colors: blackGradientColor,
                        child: Image.asset(
                          "images/icon_send_mess.png",
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              emojiPicked()
            ],
          ),
        ),
      ),
    );
  }
}
