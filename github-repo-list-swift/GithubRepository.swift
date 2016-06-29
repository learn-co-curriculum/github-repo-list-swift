//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository: NSObject {
    var fullName:String
    var htmlURL:NSURL
    var repositoryID:String
    
    init(dictionary: NSDictionary) {
        if let name = dictionary["full_name"] as? String {
            fullName = name
        }
        else {fullName = ""}
        
        if let valueAsString = dictionary["html_url"] as? String, valueAsURL = NSURL(string: valueAsString) {
            htmlURL = valueAsURL
        }
        else {htmlURL = NSURL()}
        if let repoID = dictionary["id"]?.stringValue {
            repositoryID = repoID
        }
        else {repositoryID = ""}
    }
    
}
