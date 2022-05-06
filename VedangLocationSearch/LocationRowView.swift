//
//  LocationCell.swift
//  UberSwiftUI
//
//  Created by Stephen Dowless on 12/4/21.
//

import SwiftUI
import MapKit

struct LocationRowView: View {
    let result: MKLocalSearchCompletion
    @Binding var mode: LocationSearchState
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .tint(.white)
                .foregroundColor(Color.blue)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(result.title)
                    .font(.body)
                
                Text(result.subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(Color(.gray))
            }
//            .padding(.leading, 4)
            .padding(.vertical, 8)
            
            Spacer()
            
            Button {
                print("DEBUG: Change state here..")
                mode = .directions
            } label: {
                Text("Get Directions")
                    .padding(4)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 32)
            }

        }
        .padding(.leading)
    }
}
