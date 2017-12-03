//
//  ConverterClass.swift
//  Conversion Calculator
//
//  Created by Kean M on 12/2/17.
//  Copyright © 2017 Kean M. All rights reserved.
//

import Foundation
class ConverterClass {
    var currentConverter: converter
    
    struct converter {
        var label: String
        var input: String
        var output: String
        var identifier: String
    }
    
    var converters: [converter]
    
    init() {
        converters = [
            converter(label: "fahrenheit to celcius", input: "°F", output: "°C", identifier: "f2c"),
            converter(label: "celcius to fahrenheit", input: "°C", output: "°F", identifier: "c2f"),
            converter(label: "miles to kilometers", input: "mi", output: "km", identifier: "m2k"),
            converter(label: "kilometers to miles", input: "km", output: "km", identifier: "k2m")
        ]
        currentConverter = converters[0]
    }
    
    func changeConverter(title: String) {
        for converter in converters {
            if converter.label == title {
                currentConverter = converter
            }
        }
    }
    
    func converterFunction(input: String, identifier: String) -> String {
        switch identifier {
            case "m2k":
                return m2k(input: input)
            case "k2m":
                return k2m(input: input)
            case "f2c":
                return f2c(input: input)
            case "c2f":
                return c2f(input: input)
            default:
                return "0"
        }
    }
    
    func m2k(input: String) -> String {
        if let number = Double(input) {
            return String(ceil((number * 1.60934) * 100)/100)
        }
        return "0"
    }
    
    func k2m(input: String) -> String {
        if let number = Double(input) {
            return String(ceil((number * 0.621371) * 100)/100)
        }
        return "0"
    }
    
    func f2c(input: String) -> String {
        if let number = Double(input) {
            return String(ceil(((number - 32) * 5 / 9) * 100)/100)
        }
        return "0"
    }
    
    func c2f(input: String) -> String {
        if let number = Double(input) {
            return String(ceil((((number * 9) / 5) + 32) * 100)/100)
        }
        return "0"
    }
}
