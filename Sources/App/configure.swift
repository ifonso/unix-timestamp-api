import Vapor

public func configure(_ app: Application) async throws {
    let corsConfiguration = CORSMiddleware.Configuration(
        allowedOrigin: .all,
        allowedMethods: [.POST, .GET],
        allowedHeaders: ["Accept",
                         "Content-Type",
                         "Origin"]
    )
    // CORS config
    app.middleware.use(CORSMiddleware(configuration: corsConfiguration))
    // config port
    app.http.server.configuration.port = 9001
    // register routes
    try routes(app)
}
