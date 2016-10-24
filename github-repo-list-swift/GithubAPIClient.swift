//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String:Any]]) -> ()) {
        
        let urlString = "\(Secrets.githubAPIURL)/repositories?client_id=\(Secrets.githubClientID)&client_secret=\(Secrets.githubClientSecret)"
        
        let url = URL(string: urlString)
        
        let session = URLSession.shared
        
        guard let potentialURL = url else {assertionFailure("Invalid URL"); return}
        
        let task = session.dataTask(with: potentialURL, completionHandler: { (data, response, error) in
            
            guard let data = data else { assertionFailure("Unable to get data \(error?.localizedDescription)"); return }
            
            if let responseArray = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:AnyObject]] {
                
                if let responseArray = responseArray {
                    
//                    print(responseArray)
                    
                    completion(responseArray)
                }
            }
        })
        
        task.resume()
    }
        
    }
    


