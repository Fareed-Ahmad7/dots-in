import 'package:dotsin_assignment/utils/colors.dart';
import 'package:dotsin_assignment/widgets/activity_chart_card.dart';
import 'package:dotsin_assignment/widgets/health_overview.dart';
import 'package:dotsin_assignment/widgets/home_header.dart';
import 'package:dotsin_assignment/widgets/hyperprolactinemia_section.dart';
import 'package:dotsin_assignment/widgets/immune_recommendation_card.dart';
import 'package:dotsin_assignment/widgets/immune_strength_section.dart';
import 'package:dotsin_assignment/widgets/mode_switcher.dart';
import 'package:dotsin_assignment/widgets/neurotransmitter_switcher.dart';
// import 'package:dotsin_assignment/widgets/organ_metrics_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhenotypeScreen extends StatefulWidget {
  const PhenotypeScreen({super.key});

  @override
  State<PhenotypeScreen> createState() => _PhenotypeScreenState();
}

class _PhenotypeScreenState extends State<PhenotypeScreen> {
  String selectedOrgan = 'Heart';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF020702),
              Color(0xFF061205),
              Color(0xFF010301),
              Color(0xFF000000),
            ],
            stops: [0.0, 0.22, 0.55, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Header(
                      selectedOrgan: selectedOrgan,
                      onOrganSelected: (organ) {
                        setState(() {
                          selectedOrgan = organ;
                        });
                      },
                    ),
                    const SizedBox(height: 18),
                    const ModeSwitcher(),
                    const SizedBox(height: 24),
                    const HealthOverview(),
                    const SizedBox(height: 18),
                    const NeurotransmitterSwitcher(),
                    const SizedBox(height: 20),
                    const ActivityChartCard(),
                    const SizedBox(height: 14),
                    const HyperprolactinemiaSection(),
                    const SizedBox(height: 14),
                    const ImmuneStrengthSection(),
                    const SizedBox(height: 20),
                    const ImmuneRecommendationCard(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
