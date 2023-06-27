//
//  APIListViewModel.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 15/06/23.
//

import Foundation
import Combine


class APIListViewModel: ObservableObject {
    @Published var apiList: [APIModel] = []
   // let combineService = CombineNetworkService()
    private var networkRequestCancellable: AnyCancellable? = nil
    // Prints
        
    init() {
        //make api call here
        let combineService = CombineNetworkService()
        networkRequestCancellable = combineService.getAPiCall()
            .receive(on: DispatchQueue.main)
            .sink { status in
                print(status)
            } receiveValue: { [weak self] apiItems in
                self?.apiList = apiItems
                print(apiItems.count)
            }
    }
    
    func fetchApi(completion: @escaping ((Bool) -> Void)) {
        let service = NetworkService()
        service.getRequestApi(urlStr: "https://api.publicapis.org/entries") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.apiList = response.entries
                    completion(true)
                case .failure(let err):
                    completion(false)
                    print(err)
                }
            }
        }
    }
    
    func fetchApi_Combine() {
        
    }
}
