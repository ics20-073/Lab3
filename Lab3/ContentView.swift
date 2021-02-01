//
//  ContentView.swift
//  Lab3
//
//  Created by ICS 224 on 2021-02-01.
//

import SwiftUI
//Toggleview class, press to enable button press
struct ToggleView: View {
    var pushEnabled: Binding<Bool>
    var body: some View {
        Toggle("ToggleSwitch", isOn: pushEnabled).labelsHidden()
    }
}
//Button class, press to increase text field by one. Will only
struct ButtonView: View {
    var pushCount: Binding<Int>
    var pushEnabled: Bool
    var body: some View {
        Button(action: {
            self.pushCount.wrappedValue &+= 1
            if(self.pushCount.wrappedValue < 0)
            {
                self.pushCount.wrappedValue = 0
            }
            UIApplication.shared.windows.forEach {                 $0.endEditing(true)
            }
        }) {
            Text("Push")
        }
        .disabled(!pushEnabled)
    }
}
//TextField Class, type in here using the app keyboard.
//The input will ignore 0's before value, and letters and will give back a
// number value in the text
struct TextFieldView: View {
    var offset: Binding<String>
    var pushCount: Binding<Int>
    var body: some View {
        TextField("Number of Pushes",text:Binding(
            get: {
                self.offset.wrappedValue
            },
            set: {
                newValue,_ in
                self.offset.wrappedValue=""
                self.pushCount.wrappedValue = Int(newValue) ?? 0
                print(self.pushCount.wrappedValue)
                self.offset.wrappedValue = String(self.pushCount.wrappedValue)
                    
                
            }
        ))
        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
}

//The text class will display the number value converted in the text field
struct TextView: View {
    var pushCount: Int
    var body: some View {
        Text(String(pushCount))
            .padding(-2.0)
    }
}
//All of the prior classes are passed through Content view class.
// With Hstack, the app will have different settings with both an Iphone
// as well as an Ipad Screen Size
struct ContentView: View {
    @State var pushCount: Int = 0
    @State var pushEnabled: Bool = false
    @State var offset: String = ""
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        VStack() {
            if sizeClass == .regular {
                Spacer()
                ToggleView(pushEnabled: $pushEnabled)
                Spacer()
                ButtonView(pushCount: $pushCount, pushEnabled: pushEnabled)
                Spacer()
                TextFieldView(offset: $offset, pushCount: $pushCount)
                Spacer()
                TextView(pushCount: pushCount)
                Spacer()
            }
            else {
                HStack() {
                    ToggleView(pushEnabled: $pushEnabled)
                    ButtonView(pushCount: $pushCount, pushEnabled: pushEnabled)
                }
                TextFieldView(offset: $offset, pushCount: $pushCount)
                TextView(pushCount: pushCount)
            }
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
