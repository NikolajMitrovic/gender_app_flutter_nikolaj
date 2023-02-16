import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_app_flutter/bloc/user_bloc.dart';

import '/_all.dart';

class GeneratedList extends StatefulWidget {
  const GeneratedList({super.key});
  @override
  State<GeneratedList> createState() => _GeneratedList();
}

List<String> genderList = <String>[
  'male',
  'female',
];

const List<int> list = <int>[
  10,
  20,
  50,
  100,
];
UserRepository userRepository = UserRepository();

class _GeneratedList extends State<GeneratedList> {
  int dropDownValue = 10;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => userRepository,
      child: BlocProvider(
        create: (context) => UserBloc(userRepository)
          ..add(
            UserLoadEvent(
              quantity: 10,
            ),
          ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(225, 117, 133, 219),
            automaticallyImplyLeading: false,
            title: const Text(
              'BOOKSHOP',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: DropdownButtonExample(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DropdownButtonGender(),
              )
            ],
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.status == UserStateStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: state.user?.length,
                  // prototypeItem: ListTile(
                  //   title: Text(items.first),
                  // ),
                  itemBuilder: (context, index) => userTemplate(state.user?[index] ?? UserModel()));
            },
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  int dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
      return DropdownButton<int>(
        value: userState.quantity,
        icon: const Icon(
          Icons.arrow_downward,
          color: Color.fromARGB(255, 27, 2, 95),
        ),
        elevation: 16,
        style: const TextStyle(
          color: Color.fromARGB(255, 27, 2, 95),
          fontSize: 18,
        ),
        underline: Container(
          height: 2,
          color: const Color.fromARGB(255, 27, 2, 95),
        ),
        onChanged: (int? value) {
          context.read<UserBloc>().add(UserLoadEvent(quantity: value, gender: userState.gender));
        },
        items: list.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      );
    });
  }
}

class DropdownButtonGender extends StatefulWidget {
  const DropdownButtonGender({super.key});

  @override
  State<DropdownButtonGender> createState() => _DropdownButtonGenderState();
}

class _DropdownButtonGenderState extends State<DropdownButtonGender> {
  String dropdownGenderValue = genderList.first;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return DropdownButton<String>(
          value: ((userState.gender?.isEmpty ?? true) ? genderList.first : userState.gender),
          icon: const Icon(
            Icons.arrow_downward,
            color: Color.fromARGB(255, 27, 2, 95),
          ),
          elevation: 16,
          style: const TextStyle(
            color: Color.fromARGB(255, 27, 2, 95),
            fontSize: 18,
          ),
          underline: Container(
            height: 2,
            color: const Color.fromARGB(255, 27, 2, 95),
          ),
          onChanged: (String? value) {
            context.read<UserBloc>().add(UserLoadEvent(quantity: userState.quantity, gender: value));
          },
          items: genderList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        );
      },
    );
  }
}

Widget userTemplate(UserModel model) {
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    color: const Color.fromARGB(255, 214, 214, 214),
    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(model.image ?? ''),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        model.firstName.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        model.lastName.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21.0),
                  child: Text(
                    'Id: ${model.id}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 226,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Uuid: ${model.uuid}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    'Username: ${model.userName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Password: ${model.password}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'E-mail: ${model.email}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'IP: ${model.ip}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Mac Address: ${model.macAddress}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Website: ${model.website}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
