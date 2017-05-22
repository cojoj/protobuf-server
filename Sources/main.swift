import Kitura
import HeliumLogger
import SwiftProtobuf

// Initialize HeliumLogger
HeliumLogger.use()

// Create a new router
let router = Router()

//let countries = [
//    Country(id: 1, name: "Poland", cities: [
//        City(id: 1, name: "Warsaw", latitude: 52.2297, longitude: 21.0122, population: 2666278),
//        City(id: 2, name: "Krakow", latitude: 50.0647, longitude: 19.9450, population: 760000),
//        City(id: 3, name: "Poznań", latitude: 52.4064, longitude: 16.9252, population: 550000)
//    ], population: 38567211)
//];

// Handle HTTP GET requests to /
router.get("/country") {
    request, response, next in
    response.send("Hello, World!")
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
