import Vapor

func routes(_ app: Application) throws {
    app.post("converter") { request async throws in
        guard let dateRequest = try? request.content.decode(DateRequest.self),
              let date = dateRequest.getDate
        else {
            return responseBuilder(body: ErrorResponse(error: "Formato de data inválido. Use dd/mm/yyyy."),
                                   statusCode: .badRequest)
        }
        
        return responseBuilder(body: DateResponse(unix: String(date.timeIntervalSince1970)),
                               statusCode: .ok)
    }
}

private func responseBuilder<T: Encodable>(body: T, statusCode: HTTPResponseStatus) -> Response {
    let response = Response()
    response.status = statusCode
    response.headers.add(name: "Content-Type", value: "application/json")
    if let data = try? JSONEncoder().encode(body) {
        response.body = Response.Body(data: data)
    }
    return response
}
