//
//  ReposTableViewControllerSpec.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Quick
import Nimble
import KIF

class ReposTableViewControllerSpec: QuickSpec {
    
    override func spec() {
        let tester = KIFUITestActor()
        let tableView = tester.waitForViewWithAccessibilityLabel("tableView") as! UITableView
        let indexPath = NSIndexPath(forRow: 1, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        describe("TableView") {
            it("should have 1 section") {
                expect(tableView.numberOfSections).to(equal(1))
            }
            it("should have 100 cells") {
                expect(tableView.numberOfRowsInSection(0)).to(equal(100))
            }
        }
        describe("TableView Cells") {
            it("Should have the correct cells") {
                expect(cell?.textLabel?.text).to(equal("wycats/merb-core"))
            }
            
        }
        
    }

}
