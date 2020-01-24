//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Lester Batres on 1/23/20.
//  Copyright © 2020 lester. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    @State private var length = "0"
    
    let unitsDescription = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    let units = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    
    var sourceLength: Measurement<UnitLength> {
        let length = Double(self.length) ?? 0
        let sourceUnit = units[inputUnit]
        let sourceLenght = Measurement(value: length, unit: sourceUnit)
        
        return sourceLenght
    }
    
    var destinationLength: Measurement<UnitLength> {
        let destinationUnit = units[outputUnit]
        let destinationLength = sourceLength.converted(to: destinationUnit)
        
        return destinationLength
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Source Unit")) {
                    Picker("Source unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.unitsDescription[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.unitsDescription[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Enter lenght")) {
                    TextField("0", text: $length)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Converted length")) {
                    Text("\(destinationLength.description)")
                }
            }
        .navigationBarTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
