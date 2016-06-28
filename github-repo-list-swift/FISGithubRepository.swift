//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FISGithubRepository: NSObject {
    var fullName:String
    var htmlURL:NSURL
    var repositoryID:String
    
    init(dictionary: NSDictionary) {
        fullName = dictionary["full_name"] as! String
        htmlURL = NSURL(string: dictionary["html_url"] as! String)!
        repositoryID = (dictionary["id"]?.stringValue)!
    }
    
}
