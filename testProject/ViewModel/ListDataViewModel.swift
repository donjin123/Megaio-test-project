//
//  ListDataViewModel.swift
//  testProject
//
//  Created by Krunal Chaudhari on 08/06/24.
//

import Alamofire
import SwiftUI
import Foundation

class ListDataViewModel: ObservableObject {
    @Published var listData: [ElementData] = []
    @Published var isLoading: Bool = false
    
    private let parameters: [String: Any] = [
        "api_key": "DEMO_KEY",
        "start_date": "2024-01-01",
        "end_date" : "2024-06-01"
    ]
    private let headers: HTTPHeaders = [
        "Authorization": "Bearer xxxxxxxx",
        "Accept": "application/json"
    ]
    
    func getElementsData() {
        isLoading = true
        Alamofire.AF.request(Server().baseUrl, method: .get,
                             parameters: parameters,
                             encoding: URLEncoding.default, headers: headers).responseDecodable(of: [ElementData].self) { response in
            switch response.result {
            case .success(let listData):
                self.isLoading = false
                self.listData = listData
            case .failure(let error):
                self.isLoading = false
                print(error)
            }
        }
    }
}
