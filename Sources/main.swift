import Kitura
import HeliumLogger
import SwiftProtobuf

// Initialize HeliumLogger
HeliumLogger.use()

// Create a new router
let router = Router()

// Load data from CSV files
let accountList = DataLoadHelper.loadAccountList()
let accountDictionary = DataLoadHelper.mapAccounts(accountList: accountList)

// Handle HTTP GET requests to /
router.get("/accountList") {
    request, response, next in
    
    guard let acceptType = request.headers["Accept"] else {
        let accountListJSON = try accountList.jsonUTF8Data()
        response.headers.append("Content-Type", value: "application/json")
        response.send(data: accountListJSON)
        next()
        return
    }
    
    switch acceptType {
    case "application/json":
        let accountListJSON = try accountList.jsonUTF8Data()
        response.headers.append("Content-Type", value: acceptType)
        response.send(data: accountListJSON)
    case "application/octet-stream", "application/x-protobuf", "application/x-google-protobuf":
        let data = try accountList.serializedData()
        response.headers.append("Content-Type", value: acceptType)
        response.send(data: data)
    default:
        let accountListJSON = try accountList.jsonUTF8Data()
        response.headers.append("Content-Type", value: acceptType)
        response.send(data: accountListJSON)
    }
    
    next()
}

router.get("/account/:accountId") {
    request, response, next in
    
    guard let accountId = UInt64(request.parameters["accountId"]!) else {
        response.send("{\"error\" : \"Invalid id provided.\"}");
        next()
        return
    }
    
    guard let account = accountDictionary[accountId] else {
        response.send("{\"error\" : \"Invalid id provided.\"}");
        next()
        return
    }
    
    guard let acceptType = request.headers["Accept"] else {
        let accountJSON = try account.jsonUTF8Data()
        response.send(data: accountJSON)
        next()
        return
    }
    
    switch acceptType {
    case "application/json":
        let accountJSON = try account.jsonUTF8Data()
        response.send(data: accountJSON)
    case "application/octet-stream", "application/x-protobuf", "application/x-google-protobuf":
        let data = try account.serializedData()
        response.send(data: data)
    default:
        let accountJSON = try account.jsonUTF8Data()
        response.send(data: accountJSON)
    }
    
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
