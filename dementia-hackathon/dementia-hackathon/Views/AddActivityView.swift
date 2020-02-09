//
//  AddActivityView.swift
//  dementia-hackathon
//
//  Created by Dmitry Leyko on 09/02/2020.
//  Copyright © 2020 Konrad Chlupka. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Name: ")
                Text("John")
                .padding(3)
                //.frame()
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
