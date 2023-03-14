import 'package:empiregarage_mobile/helper/notification_helper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../common/colors.dart';

class NotificationPage extends StatefulWidget {
  final int userId;
  const NotificationPage({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    // _getNoti();
    countNotification();
    super.initState();
    // sendNotification("Hello from flutter 33333", "Send notification success 1");
    // listenForNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.searchBarColor,
                width: 1.0,
              ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.blackTextColor,
                )),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: AppColors.searchBarColor,
                  width: 1.0,
                ),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: AppColors.blackTextColor,
                  )),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Thông báo',
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            )),
      ),
      body: StreamBuilder(
          stream: FirebaseDatabase.instance
              .ref()
              .child('users/${widget.userId}/notifications')
              .onValue,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            List<Notification> notifications = [];
            DataSnapshot data = snapshot.data!.snapshot;
            if (data.value != null) {
              Map<dynamic, dynamic> values =
                  data.value as Map<dynamic, dynamic>;
              values.forEach((key, value) {
                notifications.add(Notification.fromMap(key, value));
              });
              notifications.sort((a, b) => b.time.compareTo(a.time));
            }
            // Display the notification in a widget
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                var message = notifications[index].message;
                var time = notifications[index].time;
                var title = notifications[index].title;
                var isRead = notifications[index].isRead;
                var key = notifications[index].key;
                return InkWell(
                  onTap: () {
                    readNotification(key);
                  },
                  child: NotificationChip(
                    title: title,
                    message: message,
                    time: time,
                    isRead: isRead,
                  ),
                );
              },
            );
          }),
    );
  }
}

class NotificationChip extends StatefulWidget {
  final String title;
  final String message;
  final String time;
  final String isRead;
  const NotificationChip({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
  });

  @override
  State<NotificationChip> createState() => _NotificationChipState();
}

class _NotificationChipState extends State<NotificationChip> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: widget.isRead == "false"
              ? AppColors.blue100
              : AppColors.white100),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.searchBarColor,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check_circle,
                  color: AppColors.greenTextColor,
                )),
          ),
          title: Text(
            widget.title,
            style: const TextStyle(
                fontFamily: 'SFProDisplay',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(widget.message,
                    style: const TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 10),
                Text(
                    widget.time
                        .toString()
                        .substring(0, 16)
                        .replaceAll("T", ", "),
                    style: const TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Notification {
  final String title;
  final String message;
  final String time;
  final String isRead;
  final String key;

  Notification({
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.key,
  });

  factory Notification.fromMap(String key, Map<dynamic, dynamic> map) {
    return Notification(
        key: key,
        title: map['title'] ?? '',
        message: map['message'] ?? '',
        time: map['time'] ?? '',
        isRead: map['isRead'] ?? '');
  }
}
