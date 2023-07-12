import 'package:checkout/asset_paths.dart';
import 'package:checkout/mixins/responsive_helper_mixin.dart';
import 'package:checkout/src/widgets/screens/dashboard_screen/dashboard_screen_view_model.dart';
import 'package:checkout/src/widgets/shared/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const name = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardScreenViewModel(),
      child: Consumer<DashboardScreenViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Dashboard',
              ),
            ),
            body: Column(
              children: [
                if (viewModel.cards.isEmpty)
                  const _DashboardEmptyStateWidget()
                else
                  Expanded(
                    child: _DashboardContentWidget(viewModel: viewModel),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DashboardContentWidget extends StatelessWidget {
  const _DashboardContentWidget({
    required this.viewModel,
  });

  final DashboardScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobileWidget: _MobileDashboardBody(viewModel),
      desktopWidget: _DesktopDashboardBody(viewModel),
    );
  }
}

class _MobileDashboardBody extends StatelessWidget {
  const _MobileDashboardBody(this.viewModel);

  final DashboardScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return _SharedDashboardBody(viewModel: viewModel);
  }
}

class _DesktopDashboardBody extends StatelessWidget with ResponsiveMixin {
  const _DesktopDashboardBody(this.viewModel);

  final DashboardScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenWidth(context) * 0.8,
          child: Center(
            child: _MobileDashboardBody(viewModel),
          ),
        ),
      ],
    );
  }
}

class _SharedDashboardBody extends StatelessWidget {
  const _SharedDashboardBody({required this.viewModel});

  final DashboardScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your recent cards',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ListView.separated(
          itemBuilder: (context, index) {
            final card = viewModel.cards[index];

            return ListTile(
              title: Text(card.cardNumber),
            );
          },
          separatorBuilder: (context, val) {
            return const SizedBox(height: 12);
          },
          itemCount: viewModel.cards.length,
        ),
      ],
    );
  }
}

class _DashboardEmptyStateWidget extends StatefulWidget {
  const _DashboardEmptyStateWidget();

  @override
  State<_DashboardEmptyStateWidget> createState() =>
      _DashboardEmptyStateWidgetState();
}

class _DashboardEmptyStateWidgetState extends State<_DashboardEmptyStateWidget>
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
