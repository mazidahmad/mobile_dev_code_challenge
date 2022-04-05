import 'package:cindchat/domain/entities/contact.dart';
import 'package:cindchat/presentation/pages/chat/cubit/chat_cubit.dart';
import 'package:cindchat/presentation/pages/cubit/sync/sync_cubit.dart';
import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:cindchat/presentation/themes/app_text.dart';
import 'package:cindchat/presentation/widget/bubble/bubble_chat.dart';
import 'package:cindchat/presentation/widget/bubble/bubble_content_contact.dart';
import 'package:cindchat/presentation/widget/bubble/bubble_content_document.dart';
import 'package:cindchat/presentation/widget/bubble/bubble_content_image.dart';
import 'package:cindchat/presentation/widget/bubble/bubble_content_message.dart';
import 'package:cindchat/presentation/widget/text_field/app_text_field.dart';
import 'package:cindchat/shared/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late SyncCubit _syncCubit;
  late ChatCubit _chatCubit;

  String _me = "A";
  String _other = "B";
  List<String> _groupedImage = [];
  List<Contact> _groupedContact = [];

  @override
  void initState() {
    super.initState();
    _syncCubit = BlocProvider.of<SyncCubit>(context);
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    _syncCubit.syncDummyData();
  }

  @override
  Widget build(BuildContext context) {
    final _bottom = MediaQuery.of(context).viewInsets.bottom;
    var _currentGroupTitle = "";
    String? _currentAttachment;
    String _currentChatUser = "";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://instagram.fcgk37-2.fna.fbcdn.net/v/t51.2885-19/223952483_1783053615214044_8492110840236642579_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcgk37-2.fna.fbcdn.net&_nc_cat=100&_nc_ohc=2_JAAsaAYBsAX9-KZy4&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT_P9GRtPYFttUhgmhyaFhyEvFazeR_3duZEuFYK93zLog&oe=6251DF6D&_nc_sid=7bff83",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Mazid Ahmad",
                style: AppText.heading5,
              ),
              Text(
                "Flutter Developer",
                style: AppText.footnote,
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: Text(
                "Setting",
                style: AppText.subheading,
              ))
            ];
          })
        ],
        title: Row(
          children: [
            const SizedBox(
              width: 30,
              height: 30,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.opticalexpress.co.uk/media/1064/man-with-glasses-smiling-looking-into-distance.jpg",
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "John Doe",
              style: AppText.heading5,
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: BlocConsumer<SyncCubit, SyncState>(
        listener: (context, state) {
          if (state is SyncDone) {
            _chatCubit.fetchAllChatHistory();
          }
        },
        builder: (context, state) {
          if (state is SyncLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SyncDone) {
            return BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ChatLoaded) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: _bottom),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            reverse: true,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.chats.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, idx) {
                                      var _isGroup = true;
                                      var _isGroupedContent = true;
                                      List<String> _imageGrouped = [];
                                      List<Contact> _contactGrouped = [];
                                      var _groupTitle = Formatter.toShortDate(
                                          state.chats[idx].timestamp!);
                                      if (_currentGroupTitle != _groupTitle) {
                                        _currentGroupTitle = _groupTitle;
                                        _isGroup = false;
                                      }

                                      if (_currentChatUser !=
                                          state.chats[idx].from) {
                                        _currentChatUser =
                                            state.chats[idx].from!;
                                      }

                                      if (_currentAttachment !=
                                          state.chats[idx].attachment) {
                                        _currentAttachment =
                                            state.chats[idx].attachment;

                                        _groupedImage.clear();
                                        _groupedContact.clear();
                                      }

                                      if (idx + 1 < state.chats.length &&
                                          _currentAttachment ==
                                              state.chats[idx + 1].attachment &&
                                          _currentChatUser ==
                                              state.chats[idx + 1].from) {
                                        switch (state.chats[idx].attachment) {
                                          case "image":
                                            (state.chats[idx].body != null)
                                                ? _groupedImage
                                                    .add(state.chats[idx].body)
                                                : _groupedImage.add("");

                                            break;
                                          case "contact":
                                            (state.chats[idx].body != null)
                                                ? _groupedContact
                                                    .add(state.chats[idx].body)
                                                : _groupedContact.add(Contact(
                                                    name: "No Name",
                                                    image: "-",
                                                    phoneNumber: "-"));

                                            break;
                                          default:
                                            break;
                                        }
                                      } else {
                                        switch (state.chats[idx].attachment) {
                                          case "image":
                                            (state.chats[idx].body != null)
                                                ? _groupedImage
                                                    .add(state.chats[idx].body)
                                                : _groupedImage.add("");
                                            for (var element in _groupedImage) {
                                              _imageGrouped.add(element);
                                            }
                                            break;
                                          case "contact":
                                            (state.chats[idx].body != null)
                                                ? _groupedContact
                                                    .add(state.chats[idx].body)
                                                : _groupedContact.add(Contact(
                                                    name: "-",
                                                    image: "-",
                                                    phoneNumber: "-"));
                                            for (var element
                                                in _groupedContact) {
                                              _contactGrouped.add(element);
                                            }
                                            break;
                                          default:
                                            break;
                                        }
                                        _groupedImage.clear();
                                        _groupedContact.clear();
                                        _isGroupedContent = false;
                                      }

                                      return Column(
                                        children: [
                                          if (!_isGroup)
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  const Expanded(
                                                      child: Divider()),
                                                  Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      _currentGroupTitle,
                                                      style: AppText.footnote,
                                                    ),
                                                  ),
                                                  const Expanded(
                                                      child: Divider()),
                                                ],
                                              ),
                                            ),
                                          if (!_isGroupedContent)
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (state.chats[idx].from ==
                                                    _other)
                                                  const CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                      "https://www.opticalexpress.co.uk/media/1064/man-with-glasses-smiling-looking-into-distance.jpg",
                                                    ),
                                                  ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: state
                                                                .chats[idx]
                                                                .from ==
                                                            _me
                                                        ? CrossAxisAlignment.end
                                                        : CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (state.chats[idx]
                                                              .attachment ==
                                                          null)
                                                        BubbleChat(
                                                          content:
                                                              BubbleContentMessage(
                                                            message: state
                                                                .chats[idx]
                                                                .body!,
                                                          ),
                                                          timeStamp: state
                                                              .chats[idx]
                                                              .timestamp!,
                                                          isSender: state
                                                                  .chats[idx]
                                                                  .from ==
                                                              _me,
                                                        ),
                                                      if (!_isGroupedContent &&
                                                          state.chats[idx]
                                                                  .attachment ==
                                                              "image" &&
                                                          _imageGrouped
                                                              .isNotEmpty)
                                                        BubbleChat(
                                                            isSender: state
                                                                    .chats[idx]
                                                                    .from ==
                                                                _me,
                                                            content:
                                                                BubbleContentImage(
                                                              imagePaths:
                                                                  _imageGrouped,
                                                            ),
                                                            timeStamp: state
                                                                .chats[idx]
                                                                .timestamp!),
                                                      if (!_isGroupedContent &&
                                                          state.chats[idx]
                                                                  .attachment ==
                                                              "contact" &&
                                                          _contactGrouped
                                                              .isNotEmpty)
                                                        BubbleChat(
                                                            isSender: state
                                                                    .chats[idx]
                                                                    .from ==
                                                                _me,
                                                            content:
                                                                BubbleContentContact(
                                                                    contacts:
                                                                        _contactGrouped),
                                                            timeStamp: state
                                                                .chats[idx]
                                                                .timestamp!),
                                                      if (state.chats[idx]
                                                              .attachment ==
                                                          "document")
                                                        BubbleChat(
                                                            isSender: state
                                                                    .chats[idx]
                                                                    .from ==
                                                                _me,
                                                            content:
                                                                BubbleContentDocument(
                                                              documentName: state
                                                                      .chats[
                                                                          idx]
                                                                      .body ??
                                                                  "No name document",
                                                            ),
                                                            timeStamp: state
                                                                .chats[idx]
                                                                .timestamp!)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                        ],
                                      );
                                    })),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: appColor.backgroundMenu,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          height: 80,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.attach_file_sharp,
                                  color: appColor.onBackground,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: AppTextField(
                                  hint: "Enter your message here",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://instagram.fcgk37-2.fna.fbcdn.net/v/t51.2885-19/223952483_1783053615214044_8492110840236642579_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcgk37-2.fna.fbcdn.net&_nc_cat=100&_nc_ohc=2_JAAsaAYBsAX9-KZy4&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT_P9GRtPYFttUhgmhyaFhyEvFazeR_3duZEuFYK93zLog&oe=6251DF6D&_nc_sid=7bff83",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                return Container();
              },
            );
          }
          return Container();
        },
      )),
    );
  }
}
