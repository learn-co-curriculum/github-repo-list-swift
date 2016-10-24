//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: String
    
    var htmlURL: URL
    
    var repositoryID: String
    
    init(dictionary: [String:Any]) {
        guard let
            name = dictionary["full_name"] as? String,
            let valueAsString = dictionary["html_url"] as? String,
            let valueAsURL = URL(string: valueAsString),
            let repoID = dictionary["id"] as? Int
            else {fatalError("Error creating instance of GithubRepository")}
        
        fullName = name
        htmlURL = valueAsURL
        repositoryID = String(repoID)
    }

}
