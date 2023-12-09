//
//  CatViewModel.swift
//  Cats
//
//  Created by Muktar Hussein on 01/11/2023.
//

import Foundation
import Combine

class CatViewModel: ObservableObject {
    @Published var cats: [CatModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getCats()
    }
    
    func getCats() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { return }
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTaskPublisher(for: url) // -> runs on the background task by default
            .receive(on: DispatchQueue.main)
            .tryMap (downloadData)
            .decode(type: [CatModel].self, decoder: decoder)
            .sink { (completion) in
                print("Completion: \(completion)")
            } receiveValue: {[weak self] returnedData in
                self?.cats = returnedData
            }
            .store(in: &cancellables)

    }
    
    func downloadData(output: URLSession.DataTaskPublisher.Output) throws -> Data {
       guard let response = output.response as? HTTPURLResponse,
             response.statusCode >= 200 && response.statusCode < 300 else {
           throw URLError(.badServerResponse)
       }
        return output.data
    }
}
