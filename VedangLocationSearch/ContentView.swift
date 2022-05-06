//
//  ContentView.swift
//  VedangLocationSearch
//
//  Created by Stephen Dowless on 5/6/22.
//

import SwiftUI

enum LocationSearchState {
    case empty
    case results
    case directions
    
    var description: String {
        switch self {
        case .empty: return "No Results"
        case .results: return "Results"
        case .directions: return "Get Directions"
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = LocationSearchViewModel()
    @State var mode: LocationSearchState = .empty
    
    var body: some View {
        VStack {
            // location search text field
            TextField("Search for a location..", text: $viewModel.queryFragment)
                .padding()
            
            Text(mode.description)
                .padding()
            
            // location results list
            List {
                ForEach(viewModel.results, id: \.self) { result in
                    LocationRowView(result: result, mode: $mode)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
