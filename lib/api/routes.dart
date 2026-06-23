import 'package:api_server/api/routes/dashboard_route.dart';
import 'package:api_server/api/routes/sign_in_route.dart';
import 'package:api_server/api/routes/sign_up_route.dart';
import 'package:api_server/midlewares/auth_midleware.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Routes {
  Handler handler() {
    Router protectedRouter = Router()
      ..get('/dashboard', DashboardRoute().handler)
      ..get('/profile', DashboardRoute().handler);
    Handler protectedPipeline = Pipeline()
        .addMiddleware(logRequests())
        .addMiddleware(AuthMidleware().jwtAuthMiddleware())
        .addHandler(protectedRouter.call);

    Router publicRouter = Router()
      ..get('/signin', SignInRoute().handler)
      ..post('/signup', SignUpRoute().handler);
    publicRouter.mount('/api', protectedPipeline);

    Handler globalPipeline = Pipeline().addMiddleware(logRequests()).addHandler(publicRouter.call);

    return globalPipeline;
  }
}
