//
//  ViewController.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 07/06/23.
//

import UIKit
import SwiftUI
//https://api.publicapis.org/entries
//API name, description, and th elink

import Combine

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let reusableCell = "cell"
   // var apiViewModel = APIListViewModel()
    
   // private var networkRequestCancellable: AnyCancellable? = nil
//    var searchText = ""
//    var searchResults: [APIModel] {
//        print("setting search resutls --")
//        if searchText.isEmpty {
//            let list: [String] = [""]
//            return apiViewModel.apiList
//        } else {
//            return apiViewModel.apiList.filter
//            {
//                $0.Description.contains(searchText) || $0.API.contains(searchText)
//            }
//        }
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
       // getPublicApis()
        
//        networkRequestCancellable = combineService.getAPiCall()
//            .sink { status in
//            print(status)
//        } receiveValue: { val in
//            print(val.count)
//        }

    }
    
    func setUI() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "APIListCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
//    func getPublicApis() {
//        apiViewModel.fetchApi { [weak self] resultStatus in
//            if resultStatus {
//                self?.tableView.reloadData()
//            }
//        }
//        apiViewModel.fetchApi_Combine()
//    }
    
    @IBAction func navigateBtnTapped(_ sender: UIButton) {
        //AllUIElementsList
       let swiftUIViewController = UIHostingController(rootView: HomeSwiftUI())
       self.navigationController?.pushViewController(swiftUIViewController, animated: true)
        print(self.navigationController?.viewControllers)
    }

    let combineService = CombineNetworkService()
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell) as! APIListCell
//        cell.desc.text = apiViewModel.apiList[indexPath.row].Description
//        cell.apiName.text = apiViewModel.apiList[indexPath.row].API
//        cell.linkLabel.text = apiViewModel.apiList[indexPath.row].Link
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6//apiViewModel.apiList.count
    }
}

