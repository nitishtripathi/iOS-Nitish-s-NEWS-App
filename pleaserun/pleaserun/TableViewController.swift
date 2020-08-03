//
//  TableViewController.swift
//  pleaserun
//
//  Created by Nitish Tripathi on 03/08/20.
//  Copyright © 2020 Nitish Tripathi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var listofNews = [Results](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "NEWS"
            }
        }
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let newreq = newsRequest()
        newreq.getNews{ [weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let newnews):
                self?.listofNews = newnews
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listofNews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let newnewnews = listofNews[indexPath.row]
        
        cell.textLabel?.text = newnewnews.title
        cell.detailTextLabel?.text = newnewnews.byline
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let urlString = listofNews[indexPath.row]
        if let url = URL(string: urlString.shortUrl!)
        {
            UIApplication.shared.openURL(url)
        }
    }
    
}

