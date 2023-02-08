import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
              Wrap(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
