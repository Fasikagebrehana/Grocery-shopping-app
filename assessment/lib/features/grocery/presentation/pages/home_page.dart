import 'package:assessment/dependency_injection.dart';
import 'package:assessment/features/grocery/presentation/bloc/bloc/get_all/get_all_bloc.dart';
import 'package:assessment/features/grocery/presentation/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('assets/images/icon.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  'Burger',
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.tune),
                border: InputBorder.none,
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider<GetAllBloc>(
        create: (context) => GetAllBloc(getIt())..add(GetAllGroceriesEvent()),
        child: BlocBuilder<GetAllBloc, GetAllState>(
          builder: (context, state) {
            if (state is GetAllLoading) {
              print('object');
              return const Center(child: CircularProgressIndicator());

            } else if (state is GetAllLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(18.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: state.groceries.length,
                itemBuilder: (context, index) {
                  final grocery = state.groceries[index];
                  return Cards(grocery: grocery);
                },
              );
            } else if (state is GetAllError) {
              print('object');
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No groceries available'));
            }
          },
        ),
      ),
    );
  }
}
