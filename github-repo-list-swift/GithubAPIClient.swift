//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
        
        class func getRepositories(with completion: ([NSDictionary])-> Void){
            
            let urlString = "\(Secrets.githubAPIURL)/repositories?client_id=\(Secrets.githubClientID)client_secret=\(Secrets.githubClientSecret)"
            
            let url = URL(string: urlString)
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: url!) { (data, response, error) in
                
                do{
                    
                    let results = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    
                    print(results)
                    
                }catch{
                    print(error)
                }
            }
            
            task.resume()
        }
    }
    


