import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class TrendingSidebar extends StatelessWidget {
  const TrendingSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(FlutterI18n.translate(context, "trending_posts.trending_post"), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                TextButton(
                  onPressed: () {},
                  child: Text(FlutterI18n.translate(context, "trending_posts.more"), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
                        title: Text('Junior Garcia', style:TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(FlutterI18n.translate(context, "trending_posts.time")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('Super Trendings', style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(FlutterI18n.translate(context, "trending_posts.trending_people"), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                TextButton(
                  onPressed: () {},
                  child: Text(FlutterI18n.translate(context, "trending_posts.more"), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey.shade300, width: 1.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
                    title: Text('Junior Garcia', style:TextStyle(fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
