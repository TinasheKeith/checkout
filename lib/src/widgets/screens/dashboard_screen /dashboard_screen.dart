import 'package:checkout/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const name = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
        ),
      ),
      body: const DashboardEmptyStateWidget(),
    );
  }
}

class DashboardEmptyStateWidget extends StatefulWidget {
  const DashboardEmptyStateWidget({super.key});

  @override
  State<DashboardEmptyStateWidget> createState() =>
      _DashboardEmptyStateWidgetState();
}

class _DashboardEmptyStateWidgetState extends State<DashboardEmptyStateWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _animationController.animateTo(
      0.6,
      duration: const Duration(milliseconds: 1700),
      curve: Curves.decelerate,
    );

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: Lottie.asset(
              Assets.cardLight,
              controller: _animationController,
              repeat: true,
              reverse: true,
              options: LottieOptions(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Your recently validated cards will appear here',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    color: Colors.grey.withOpacity(0.4),
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
