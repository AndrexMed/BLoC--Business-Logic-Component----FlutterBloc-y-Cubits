import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/cubit_counter',
      builder: (context, state) => const CubitCounterScreen()),
  GoRoute(
      path: '/bloc_counter',
      builder: (context, state) => const BlocCounterScreen()),
  GoRoute(
      path: '/register', builder: (context, state) => const RegisterScreen()),
]);
