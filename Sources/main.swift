import Kitura
import HeliumLogger
import SwiftProtobuf

// Initialize HeliumLogger
HeliumLogger.use()

// Create a new router
let router = Router()

// Data
var accounts: Array<Account> = [Account]()

func loadDataFromFile() -> Void {
    do {
        let accountRows = try String(contentsOfFile: "/Users/michal/git/protobuf-server/Resources/accounts.csv").components(separatedBy: .newlines)
        for accountRow in accountRows {
            if accountRow == "" {
                continue
            }
            let fields = accountRow.components(separatedBy: ";")
            var account = Account(id: UInt64(fields[0]), name: fields[1], balance: Double(fields[2]), availableFunds: Double(fields[3]), iban: fields[4], currency: fields[5], owner: fields[6], ownerAddress: fields[7], transactions: [])
            print(account)
            account.transactions = []
            accounts.append(account)
        }
    } catch {
        print(error)
    }
}

loadDataFromFile()

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
