//
//  TransactionListViewModel.swift
//  Tracker_SwiftUI_LBTA
//
//  Created by Maxim Hranchenko on 19.10.2022.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private var subscriber = Set<AnyCancellable>()
    
    func getTransaction() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    print("Finished")
                    return
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] transactions in
                self?.transactions = transactions
            }
            .store(in: &subscriber)
    }
}
