 //
 //  ContentView.swift
 //  WeSplit
 //
 //  Created by Jadiê on 05/09/21.
 //
 
 import SwiftUI
 
 struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerson = grandTotal / peopleCount
        
        return amountPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Amount", text: $checkAmount).keyboardType(.numberPad)
                
                Section(header: Text("Number of people")){
                    TextField("Number", text: $numberOfPeople).keyboardType(.phonePad)
                }
//                Picker("Number of people", selection: $numberOfPeople) {
//                    ForEach(2 ..< 100) {
//                        Text("\($0) people")
//                    }
//                }
                
                Section(header:Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count ) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total amount")) {
                    Text( "$ \(totalAmount)" )
                }
                Section(header:Text("Amount per person")) {
                    Text("$ \(totalPerPerson)")
                    
                }

            }
            .navigationBarTitle(Text("WeSplit"))
        }
    }
 }
 
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
