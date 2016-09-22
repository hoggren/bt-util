import Foundation

func printHelp() {
    print("Usage\n" +
            "    bt-util [OPTIONS]\n\n" +
            "Options\n" +
            "    status        Bluetooth status, i.e. on or off.\n" +
            "    start         Start bluetooth.\n" +
            "    stop          Stop bluetooth.\n" +
            "    stop-for [N]  Stop for N seconds, then start again.\n" +
            "    list          List paired devices.\n" +
            "    version       Version and author information.\n" +
            "    help          Prints help information.\n"
    )
    exit(0)
}

let appName    = "bt-util"
let appVersion = "0.0.1"
let appAuthor  = "Patrik Hoggren <patrik@hwkdev.se>"
let appGithub  = "https://github.com/phoggren/bt-util"

var arguments = CommandLine.arguments
// var arguments = ["/test/dev/me", "help"] // for developing

if arguments.count == 1 {
    printHelp()
}

arguments.removeFirst()

var arg = arguments.removeFirst()

switch arg {
    case "status", "--status", "-s":
        let prefs = IOBluetoothPreferences()
        print(String(format: "Status: %@", prefs.poweredOn ? "On" : "Off"))
    
    case "start", "--start":
        let prefs = IOBluetoothPreferences()
        prefs._setPowered(on: true)
    
    case "stop", "--stop":
        let prefs = IOBluetoothPreferences()
        prefs._setPowered(on: false)
    
    case "stop-for", "--stop-for":
        guard (arguments.count > 0) else {
            printHelp()
            break
        }
        
        arg = arguments.removeFirst()
        
        if let secs = UInt32(arg) {
            let prefs = IOBluetoothPreferences()
            prefs._setPowered(on: false)
            
            sleep(secs)
            prefs._setPowered(on: true)
        }
    
    case "list", "--list":
        if let pairedDevices = IOBluetoothDevice.pairedDevices() as? [IOBluetoothDevice] {
            for device in pairedDevices {
                print(String(format:"%@ - %@ %@", device.name, device.addressString, device.isConnected() ? "(Connected)" : ""))
            }
        }
    
    case "version", "--version":
        print(String(format: "%@ %@ by %@\n%@", appName, appVersion, appAuthor, appGithub))
    
    case "help", "--help":
        printHelp()
    
    default:
        printHelp()
}
