import Kitura
import HeliumLogger
import SwiftProtobuf

// Initialize HeliumLogger
HeliumLogger.use()

// Create a new router
let router = Router()

// Load data from CSV files
var accounts = DataLoadHelper.loadAccounts()

// Handle HTTP GET requests to /
router.get("/accounts") {
    request, response, next in
    response.send("Hello, World!")
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
