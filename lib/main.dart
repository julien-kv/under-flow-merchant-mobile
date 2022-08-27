import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant_app/app/modules/home/bindings/home_binding.dart';
import 'package:oktoast/oktoast.dart';
import 'package:device_preview/device_preview.dart';

import 'app/modules/widgets/common/initial_layout_widget.dart';
import 'app/common/util/initializer.dart';
import 'app/modules/widgets/common/base_widget.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Initializer.instance.init(() {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitialLayoutWidget(
      builder: (() => GetMaterialApp(
            title: Strings.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            getPages: AppPages.routes,
            locale: DevicePreview.locale(context),
            defaultTransition: Transition.fadeIn,
            initialRoute: Routes.AUTH_PRE_CHECK,
            builder: (context, child) {
              return OKToast(
                child: BaseWidget(
                  child: child!,
                ),
              );
            },
          )),
    );
  }
}
