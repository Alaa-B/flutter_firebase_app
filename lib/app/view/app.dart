import 'package:authentication_repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App(
      {super.key, required AuthenticationRepository authenicationRepository})
      : _authenicationRepository = authenicationRepository;
  final AuthenticationRepository _authenicationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenicationRepository,
      child: BlocProvider(
        create: (_) =>
            AppBloc(authenticationRepository: _authenicationRepository)
              ..add(const AppUserSubscriptionRequested()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      theme: theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
