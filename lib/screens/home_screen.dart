import 'package:flexify/flexify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_exam_project/screens/const.dart';
import 'package:last_exam_project/screens/models/future_model.dart';
import 'package:weather/weather.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final future = ref.watch(apiprovider.future);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Text(data.list[index].rain.the3H.toString())
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('no data'),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
