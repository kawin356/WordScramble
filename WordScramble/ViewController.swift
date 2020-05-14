//
//  ViewController.swift
//  WordScramble
//
//  Created by Kittikawin Sontinarakul on 7/5/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var useWords = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkWorm"]
        }
        
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement()
        useWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = useWords[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useWords.count
    }
    


}

