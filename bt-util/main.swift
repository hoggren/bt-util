//
//  main.swift
//  bt-util
//
//  Created by Ghost on 2016-09-21.
//  Copyright © 2016 Hwkdev. All rights reserved.
//

import Foundation

//var arguments = CommandLine.arguments

var arguments = ["/usur/sjsjs/ssjsj", "status"]
arguments.removeFirst()

if arguments.count == 1 {
    // no args!
}

var arg = arguments.removeFirst()

switch arg {
    case "status", "--status", "-s":
        let prefs = IOBluetoothPreferences()
        print(String(format: "Status: %@", prefs.poweredOn ? "On" : "Off"))
    
    case "version", "--version", "-v":
    break
    
    case "help", "--help", "-h":
    break
    
    default:
    break
}
