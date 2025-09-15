import 'package:auto_route/auto_route.dart';
import 'package:kes_health/pages/accueil/accueil.dart';
import 'package:kes_health/pages/authentification/authentification.dart';
import 'package:kes_health/pages/authentification/connexion/connexion.dart';
import 'package:kes_health/pages/authentification/inscription/inscription.dart';
import 'package:kes_health/pages/carrousel_slider/carrousel_slider.dart';
import 'package:kes_health/pages/compte/compte.dart';
import 'package:kes_health/pages/messages/messages.dart';
import 'package:kes_health/pages/navigations/navigation.dart';
import 'package:kes_health/pages/rendezvous/rendezvous.dart';
import 'package:kes_health/pages/sante/sante.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: CarrousselRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: CompteRoute.page),
    AutoRoute(page: MessagesRoute.page),
    AutoRoute(page: NavigationRoute.page),
    AutoRoute(page: RendezVousRoute.page),
    AutoRoute(page: SanteRoute.page),
    AutoRoute(page: InscriptionRoute.page),
    AutoRoute(page: ConnexionRoute.page),
  ];
}
