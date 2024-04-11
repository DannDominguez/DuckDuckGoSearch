//
//  SearchViewModel.swift
//  DuckDuckGoSearch
//
//  Created by Daniela Ciciliano on 10/04/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    
  //  let apliClient = APIClient()
    
        @Published var searchResults: [Welcome] = []
        @Published var searchTextVM: String = ""
    
        
        private let apiClient = APIClient()
        
        init() {
            // Llamamos a la función de búsqueda al iniciar el ViewModel
        }
        
    func search(query: String) {
            apiClient.getSearchResult(query: query) { result in
                switch result {
                case .success(let welcome):
                    DispatchQueue.main.async {
                        self.searchResults = [welcome]
                    }
                case .failure(let error):
                    print("Error fetching search results: \(error)")
                }
            }
        }
    }

