//
//  ClubTimeButton.swift
//  dementia-hackathon
//
//  Created by Dmitry Leyko on 08/02/2020.
//  Copyright © 2020 Konrad Chlupka. All rights reserved.
//

import SwiftUI

struct ClubTimeButton: View {
    var time: String
    var body: some View {
        Button(action: {}) {
            Text(time).bold().font(.system(size: 20))

                .padding(.all, 5.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(15)
        }
    }
}

struct ClubTimeButton_Previews: PreviewProvider {
    static var previews: some View {
        ClubTimeButton(time: clubData[0].times[0])
    }
}
