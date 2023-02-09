import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

class PricingTablePage extends StatefulWidget {
  const PricingTablePage({super.key});

  @override
  State<PricingTablePage> createState() => _PricingTablePageState();
}

class _PricingTablePageState extends State<PricingTablePage> {
  bool monthly = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray200,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'The Right Plan for your business',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'We have several plans to showcase your Business. Get everything you need',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bill Monthly',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Switch(
                    value: !monthly,
                    onChanged: (value) {
                      setState(() {
                        monthly = !monthly;
                      });
                    },
                  ),
                  Text(
                    'Bill Anually',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              LayoutBuilder(builder: (context, c) {
                final width = c.maxWidth;
                final itemWidth = (width - 28 * 3) /
                    ((ResponsiveWrapper.of(context).isMobile ||
                            ResponsiveWrapper.of(context).isPhone)
                        ? 1
                        : ResponsiveWrapper.of(context).isTablet
                            ? 2
                            : ResponsiveWrapper.of(context).isDesktop
                                ? 3.3
                                : 1);

                return Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runSpacing: 16,
                  children: [
                    ProductItem(
                      name: 'Basic',
                      highlighted: false,
                      price: 20,
                      width: itemWidth,
                    ),
                    ProductItem(
                      name: 'Pro',
                      highlighted: true,
                      price: 100,
                      width: itemWidth,
                    ),
                    ProductItem(
                      name: 'Enterprise',
                      highlighted: false,
                      price: 200,
                      width: itemWidth,
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.name,
      required this.highlighted,
      required this.price,
      required this.width});
  final String name;
  final bool highlighted;
  final int price;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: highlighted ? TColor.indigo700 : Colors.white,
      ),
      width: width,
      // height: 440,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TText(
            name,
            props: highlighted
                ? 'text-2xl text-white font-semibold mb-8'
                : 'text-2xl text-indigo-700 font-semibold mb-8',
          ),
          const SizedBox(
            height: 32,
          ),
          _FeatureItem(
            '24/7 access',
            props: highlighted ? 'text-white text-base font-normal' : null,
          ),
          _FeatureItem(
            'Order labs + Results',
            props: highlighted ? 'text-white text-base font-normal' : null,
          ),
          _FeatureItem(
            'Radiology tests + Results',
            props: highlighted ? 'text-white text-base font-normal' : null,
          ),
          _FeatureItem(
            'Partnership + Discounts',
            props: highlighted ? 'text-white text-base font-normal' : null,
          ),
          _FeatureItem(
            'Direct doctor phone number',
            props: highlighted ? 'text-white text-base font-normal' : null,
          ),
          _FeatureItem(
            'Specialists appoinments',
            props: highlighted ? 'text-white text-base font-normal' : null,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              TText(
                "\$ ",
                props:
                    'text-base ${highlighted ? 'text-white' : 'text-indigo-700'} relative pl-3 font-light text-lg',
              ),
              TText(
                "${price} ",
                props:
                    '${highlighted ? 'text-white' : 'text-indigo-700'} relative pl-3 text-2xl font-semibold',
              ),
              TText(
                "/month",
                props:
                    'text-base ${highlighted ? 'text-white' : 'text-indigo-700'} relative pl-3 font-light text-lg',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      highlighted ? Colors.white : Colors.grey[200])),
              onPressed: () {},
              child: const Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TText(
                    'Choose',
                    props: 'text-indigo-700 px-8 py-3 text-base font-semibold',
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem(
    this.title, {
    super.key,
    this.props,
  });
  final String title;
  final String? props;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/image/checkMarkWhite.png',
            color: Colors.grey,
          ),
          const SizedBox(
            width: 16,
          ),
          TText(
            title,
            props:
                props ?? 'text-gray-800 dark:text-white text-base font-normal',
          ),
        ],
      ),
    );
  }
}
