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
        VStack(alignment: .leading){
            Text("Add Your Activity:").bold().font(.system(size:34))
            Spacer()
            Spacer()
            HStack{
                Text("Name: ")
                Spacer()
                Text("John")
                    .padding(.horizontal, 3.0)
                    .frame(minWidth: 10)
                    .border(Color.black)
            }
            .padding(.vertical)
            HStack{
                Text("Surname: ")
                Spacer()
                Text("Smith")
                .padding(.horizontal, 3.0)
                .frame(minWidth: 10)
                .border(Color.black)

            }
            .padding(.vertical)
            HStack{
                Text("Email: ")
                Spacer()
                Text("johnsmith@johnsmith.com")
                .padding(.horizontal, 3.0)
                .frame(minWidth: 10)
                .border(Color.black)

            }
            .padding(.vertical)
            HStack{
                Text("Phone: ")
                Spacer()
                Text("07764726377")
                .padding(.horizontal, 3.0)
                .frame(minWidth: 10)
                .border(Color.black)

            }
            .padding(.vertical)
            HStack{
                Text("Activity Name: ")
                Spacer()
                Text("Nordic Walking")
                .padding(.horizontal, 3.0)
                .frame(minWidth: 10)
                .border(Color.black)

            }
            .padding(.vertical)
        }
        .padding()
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
