//
//  GLink.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 7/11/21.
//

import SwiftUI

public struct GLink: View {
    public var labelText: String
    public var activeColor: Color? = nil
    public var inactiveColor: Color? = nil
    public var action: (() -> ())
    
    @GestureState private var isPress = false
    
    public var body: some View {
        Text(labelText)
            .bold()
            .font(.system(size: 14))
            .textCase(.uppercase)
            .foregroundColor(isPress ? activeColor ?? Color("noFocus") : inactiveColor ?? Color("noFocus") )
            .gesture(
                LongPressGesture(minimumDuration: 0.05)
                    .updating($isPress, body: { value, state, transition in
                        state = value
                    })
                    .onEnded({ _ in
                        action()
                    })
            )
    }
}
