//
//  main.swift
//  bt-util
//
//  Created by Ghost on 2016-09-21.
//  Copyright © 2016 Hwkdev. All rights reserved.
//

import Foundation

func printHelp() {
    exit(0)
}

let appName    = "bt-util"
let appVersion = "0.0.1"
let appAuthor  = "Patrik Hoggren <patrik@hwkdev.se>"
let appGithub  = "https://github.com/phoggren/bt-util"

//var arguments = CommandLine.arguments
var arguments = ["/usur/sjsjs/ssjsj", "list"] // for developing


if arguments.count == 1 {
    printHelp()
}

arguments.removeFirst()

var arg = arguments.removeFirst()

switch arg {
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
    
    case "list", "--list", "-l":
        if let pairedDevices = IOBluetoothDevice.pairedDevices() as? [IOBluetoothDevice] {
            for device in pairedDevices {
                print(String(format:"%@ - %@ %@", device.name, device.addressString, device.isConnected() ? "(Connected)" : ""))
            }
        }
    
    case "status", "--status", "-s":
        let prefs = IOBluetoothPreferences()
        print(String(format: "Status: %@", prefs.poweredOn ? "On" : "Off"))
    
    case "version", "--version", "-v":
        print(String(format: "%@ %@ by %@\n%@", appName, appVersion, appAuthor, appGithub))
    
    case "help", "--help", "-h":
        printHelp()
    
    default:
        printHelp()
}
