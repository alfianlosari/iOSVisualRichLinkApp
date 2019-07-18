//
//  ViewController.swift
//  VisualRichLink
//
//  Created by Alfian Losari on 16/07/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit
import LinkPresentation

class LinkViewController: UITableViewController, UIActivityItemSource {
 
    var activityIndicator: UIActivityIndicatorView?
    var segmentedControl: UISegmentedControl?
    var linkType = LinkType.visualRichLink {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let page: PageLink
    
    init(page: PageLink) {
        self.page = page
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var metadata: [LPLinkMetadata] = [] {
        didSet {
            self.segmentedControl?.selectedSegmentIndex = LinkType.visualRichLink.rawValue
            self.linkType = .visualRichLink
        }
    }
    var selectedMetadata: LPLinkMetadata?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        setupSegmentedControl()

        loadMetadata()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(LinkViewTableViewCell.self, forCellReuseIdentifier: "LinkCell")
        tableView.tableFooterView = UIView()
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        linkType = sender.linkType
    }
    
    private func setupActivityIndicator() {
        self.activityIndicator = UIActivityIndicatorView(style: .large)
        self.activityIndicator?.hidesWhenStopped = true
        self.activityIndicator?.stopAnimating()
        self.view.addSubview(self.activityIndicator!)
        self.activityIndicator?.center = self.view.center
    }
    
    private func setupSegmentedControl() {
        let segmentedControl = UISegmentedControl(items: ["Visual Rich Link", "URL"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        navigationItem.titleView = segmentedControl
        self.segmentedControl = segmentedControl
    }
    
    private func loadMetadata() {
        activityIndicator?.startAnimating()
        
        var metadatas = [LPLinkMetadata]()
        let dispatchGroup = DispatchGroup()
        for url in page.urls {
            DispatchQueue.main.async(group: dispatchGroup) {
                dispatchGroup.enter()
                let mdProvider = LPMetadataProvider()
                mdProvider.startFetchingMetadata(for: url) { (metadata, error) in
                    if let metadata = metadata {
                        metadatas.append(metadata)
                    }
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            self?.activityIndicator?.stopAnimating()
            self?.metadata = metadatas
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return page.website
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch linkType {
        case .visualRichLink:
            return metadata.count
        default:
            return page.urls.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch linkType {
        case .visualRichLink:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LinkCell", for: indexPath) as! LinkViewTableViewCell
            cell.configure(metadata[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = page.urls[indexPath.row].absoluteString
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch linkType {
        case .visualRichLink:
            selectedMetadata = self.metadata[indexPath.row]
            let vc = UIActivityViewController(activityItems: [self], applicationActivities: [])
            present(vc, animated: true)
            
            
        default:
            let url = page.urls[indexPath.row]
            let vc = UIActivityViewController(activityItems: [url], applicationActivities: [])
            present(vc, animated: true)
            
            
        }
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        return self.selectedMetadata
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return ""
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return self.selectedMetadata
    }
    

}


fileprivate extension UISegmentedControl {
    
    var linkType: LinkType {
        switch self.selectedSegmentIndex {
        case 0:
            return .visualRichLink
        default:
            return .url
        }
    }
}
