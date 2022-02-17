//
//  LottieAnimation.swift
//  LottieAnimation
//
//  Created by Patryk Piwowarczyk on 01/09/2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import SwiftUI
import UIKit
struct LottieAnimation: View {
    var body: some View {
       VStack {
            LottieView(filename: "confettiBurst")
                .frame(width: 400, height: 250)
        }
    }
}

struct LottieAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LottieAnimation()
    }
}
