import 'package:cindchat/domain/entities/contact.dart';
import 'package:cindchat/presentation/themes/app_assets.dart';
import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:cindchat/presentation/themes/app_text.dart';
import 'package:flutter/material.dart';

class BubbleContentContact extends StatelessWidget {
  const BubbleContentContact({Key? key, required this.contacts})
      : super(key: key);

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: appColor.background.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          (contacts.length == 1)
              ? CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image(
                      image: NetworkImage(
                        contacts[0].image ?? "",
                      ),
                      fit: BoxFit.cover,
                      errorBuilder: (context, exception, _) {
                        return Image(
                          image: AppAsset.noImage,
                        );
                      },
                    ),
                  ),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: List.generate(
                            contacts.length > 2 ? 2 : contacts.length,
                            (index) => Row(
                                  children: [
                                    SizedBox(
                                        width: index == 0 ? 0 : (index * 15)),
                                    CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(45),
                                        child: Image(
                                          image: NetworkImage(
                                            contacts[0].image ?? "",
                                          ),
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, exception, _) {
                                            return Image(
                                              image: AppAsset.noImageContact,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ),
                    if (contacts.length > 2)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: appColor.background.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "${contacts.length - 2}+",
                              style: AppText.footnote.copyWith(fontSize: 9),
                            ))),
                      )
                  ],
                ),
          const SizedBox(
            width: 20,
          ),
          (contacts.length == 1)
              ? Text(
                  contacts[0].name ?? "",
                  style: AppText.heading5,
                )
              : Text(
                  "${contacts.length} Contacts",
                  style: AppText.heading5,
                )
        ],
      ),
    );
  }
}
