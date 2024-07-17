import 'package:cardealership/helpers/my_var.dart';
import 'package:cardealership/views/widgets/my_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

getDrawer() {
  return Drawer(
    width: 250,
    child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(100),
            InkWell(
              onTap: () => Get.offAllNamed(HOME),
              child: const Text("Home"),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            verticalSpace(7),
            const InkWell(
              child: Text("Sale Car"),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            verticalSpace(7),
            const InkWell(
              child: Text("Design Car"),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            verticalSpace(7),
            InkWell(
              onTap: () => Get.offNamed(SPARE_PARTS),
              child: const Text("Spare Parts"),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            verticalSpace(7),
            InkWell(
              onTap: () => Get.offNamed(FAVORITE),
              child: const Text("Favorite"),
            ),
            const SizedBox(
                child: Divider(
              thickness: 1,
            )),
            verticalSpace(7),
            const InkWell(
              child: Text("Chat us"),
            )
          ],
        )),
  );
}
