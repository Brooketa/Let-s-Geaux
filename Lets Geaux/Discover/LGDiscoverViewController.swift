//
//  ViewController.swift
//  Let's Geaux
//
//  Created by Brooketa on 12.04.2021..
//

import UIKit

class LGDiscoverViewController: LGViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
        
    var news:[LGNews]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table View Configuration
        tableView.register(LGDiscoverTableViewCell.nib(), forCellReuseIdentifier: LGDiscoverTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        tableView.refreshControl?.tintColor = .white
        tableView.refreshControl?.addTarget(self, action: #selector(fetch), for: UIControl.Event.valueChanged)
        
        fetch()
    }
    
    @objc func fetch() {
        LGWebService.fetchNews(completion: { [weak self] news, error in
            let isRefreshing = self?.tableView.refreshControl?.isRefreshing
            if error == nil {
                guard let news = news else { return }
                if isRefreshing != nil {
                    UIView.animate(withDuration: 0.3, animations: {
                        self?.tableView.refreshControl?.endRefreshing()
                        self?.tableView.reloadData()
                    })
                }
                self?.news = news
            } else {
                if isRefreshing != nil {
                    self?.tableView.refreshControl?.endRefreshing()
                }
            }
        })
    }
}

//MARK: UITableViewDataSource

extension LGDiscoverViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = Bundle.main.loadNibNamed(LGDiscoverTableViewSectionHeader.nibName(), owner: self, options: nil)?.first as? LGDiscoverTableViewSectionHeader else { return nil }
        
        header.configure(sectionTitleName: "What's Up?", buttonTitleName: "All news")
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LGDiscoverTableViewCell.cellIdentifier) as! LGDiscoverTableViewCell
        
        if news?.count ?? 0 > 0 {
            cell.configure(news: news!, frameWidth: view.frame.size.width)
            cell.delegate = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.frame.size.width * 0.8 * 1.4)
    }
}

//MARK: LGDiscoverTableViewCellDelegate

extension LGDiscoverViewController: LGDiscoverTableViewCellDelegate {
    func didSelectCell(indexPath: IndexPath) {
        if let newsItem = news?[indexPath.row] {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let newsViewController = storyboard.instantiateViewController(identifier: LGNewsViewController.identifier) as? LGNewsViewController else { return }
            newsViewController.navigationItem.title = "News"
            newsViewController.hidesBottomBarWhenPushed = true
            
            newsViewController.news = newsItem
            self.navigationController?.pushViewController(newsViewController, animated: true)
            
        }
    }
}

