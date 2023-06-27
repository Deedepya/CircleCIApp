//
//  CombineNetwrokService.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 15/06/23.
//

import Combine
import Foundation

enum ApiError: Error {
    case apiError(reason: String)
}

struct CombineNetworkService {
    
    func getAPiCall() -> AnyPublisher<[APIModel], Error> {
        
         let url = URL(string: URLs.ApiListUrl)!
    
        return URLSession.shared.dataTaskPublisher(for: url)
                   .tryMap { data, response -> Data in
                       guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                           throw ApiError.apiError(reason: "somethink went wrong")
                       }
                       return data
                   }
                   .decode(type: PublicAPIModel.self, decoder: JSONDecoder())
                   .map {
//                       $0.entries
                       print($0.entries.count)
                       return $0.entries
                   }
                   .eraseToAnyPublisher()
        
                   //.receive(on: RunLoop.main)
    }
    
    func getApiCall_New(completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: URLs.ApiListUrl) else {
            return
        }
        
        //you get URLSession.DataTaskPublisher - so you have a publisher which is ready to publish values. Here in this case it gets values from url and output will be data and error. But this getting data from url is perform on non-main thread. So if you want to update ui, come back to main queue. This function will kickstart only if it is attached to subscriber
        /*
         advantage compared to regular data task
         func (completion: @escaping (data, response, error) {
             let task = urlsession.data { data
             }
                task.resume
         }
         
         here urlsesion calls dataTask on other thread and it starts only if task.resume is called and gives result through closure. But you can access that closure only if you return the dat through soem escaping completion
         
         But for publisherData task you don't need to call dataTaks and you don't need to create any escaping completiong, all that is taken care by publisher. But only conditio here is it must have suhscriber attached to it, then only call kick starts. Because if there is no one to receive the value - then why to publish the value first of all
         steps -- yes publisher publiseh values and sends to subscriber through its pipeline at the end. But as its done on non-maint thread its ur responsibility to get final value in main thread
         -- it is not a rule to receive values on main thread. If you just want to update databse after receiving the value, then you can continue using that non-main thread. But if you want to udpate ui through some state variables, then obviosuly you will update that stateVariable with received value n that state variable will update ui. so u have to update it on main thread
         */
        let urlPublisher = URLSession.shared.dataTaskPublisher(for: url)
        
        /*
         how do you get access to data published by publisher, u must have a subscriber or operator publishers which filters n sends to subscirbers
         */
        //-- when you look at its syntax it contains data and response
        //--Publishers.Map<Self, T>
        /*
         using that two params you can do anything n finally return some generic type, which will be passed down the pipeline
         how do you know its emiting data, response two params
         just type urlPublisher. call ur function n see what its gonna receive
         swift does type inference n returns values as per upstream
         */
        let mappedData = urlPublisher.map { data, urlResponse in
            guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
                return "got error"
            }
            
            return "got proper response"
        }
        
        let subscribingSubscriber = mappedData.sink { mappedApiData in
            print(mappedApiData)
        } receiveValue: { value in
            print(value)
        }

    }
}
