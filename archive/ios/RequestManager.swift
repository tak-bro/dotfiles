//
//  RequestManager.swift
//  unexpected-guide
//
//  Created by 진형탁 on 2017. 2. 15..
//  Copyright © 2017년 fail-nicely. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import Toast_Swift

class RequestManager {
    var stateResults = [State]()
    var courseResults = [CourseList]()
    var courseDetail: Course?
    
    var pageNumber = 1
    var pageString: String {
        if pageNumber == 1 {
            return "?page=1"
        } else {
            return "?page=\(pageNumber)"
        }
    }
    
    func getStates() {
        let url: String = Config.apiServerURL + Config.statesURL + pageString
        print("get States ", url)
        Alamofire.request(url)
                 .validate()
                 .responseArray { (response: DataResponse<[State]>) in
                    switch response.result {
                    case .success:
                        let stateArray = response.result.value
                        if let stateArray = stateArray {
                            self.stateResults += stateArray
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stateUpdated"), object: nil)
                        }
                    case .failure(let error):
                        self.view.makeToast(error, duration: 1.0, position: .center)
                    }
        } // end request of Alamofire
    }
    
    func getCourseList(stateId: Int) {
        let url: String = Config.apiServerURL + Config.statesURL + "/\(stateId)/courses" + pageString
        print("get courses ", url)
        Alamofire.request(url)
                .validate()
                .responseArray { (response: DataResponse<[CourseList]>) in
                    switch response.result {
                    case .success:
                        let courseArray = response.result.value
                        if let courseArray = courseArray {
                            self.courseResults += courseArray
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "courseListUpdated"), object: nil)
                        }   
                    case .failure(let error):
                        self.view.makeToast(error, duration: 1.0, position: .center)
                    }
        } // end request of Alamofire
    }
    
    func getSelectedCourseData(courseId: Int) {
        let url: String = Config.apiServerURL + Config.courseURL + "/\(courseId)"
        print("get selectecd course ", url)
        Alamofire.request(url).
                .validate()
                .responseString { response in
                    switch response.result {
                    case .success:
                        if let json = response.result.value {
                            let detail = Course(JSONString: json)
                            self.courseDetail = detail
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "courseDetailUpdated"), object: nil)
                        }
                      case .failure(let error):
                        self.view.makeToast(error, duration: 1.0, position: .center)
                    }
       } // end request of Alamofire
    }
}