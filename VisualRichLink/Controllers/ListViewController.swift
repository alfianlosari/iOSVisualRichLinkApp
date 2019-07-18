//
//  ListViewController.swift
//  VisualRichLink
//
//  Created by Alfian Losari on 17/07/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var pages = PageLink.samplePages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Visual Rich Link URL Presentation"

        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let page = pages[indexPath.row]
        cell.textLabel?.text = page.name
        cell.detailTextLabel?.text = page.website
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LinkViewController(page: pages[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

