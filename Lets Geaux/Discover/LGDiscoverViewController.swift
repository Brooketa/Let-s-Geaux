//
//  ViewController.swift
//  Let's Geaux
//
//  Created by Brooketa on 12.04.2021..
//

import UIKit

class LGDiscoverViewController: UIViewController {

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
        
        //NavigationBar configuration
        navigationItem.largeTitleDisplayMode = .always
        
        let largeTitleAppearance = UINavigationBarAppearance()

        largeTitleAppearance.configureWithOpaqueBackground()
        largeTitleAppearance.backgroundImage = UIImage(named: "background_gradient_image.png")
        largeTitleAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = largeTitleAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = largeTitleAppearance
        
        fetch()
    }
    
    @objc func fetch() {
        LGWebService.fetchNews(completion: { [weak self] news, error in
            if error == nil {
                guard let news = news else { return }
                if self?.tableView.refreshControl?.isRefreshing != nil {
                    UIView.animate(withDuration: 0.3, animations: {
                        self?.tableView.refreshControl?.endRefreshing()
                        self?.tableView.reloadData()
                    })
                }
                self?.news = news
            }
        })
    }
}

extension LGDiscoverViewController: UITableViewDelegate {
    
}

extension LGDiscoverViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        header.backgroundColor = LGAppearanceUtils.lightGrey
        
        let label = UILabel(frame: CGRect(x: 25, y: 0, width: view.frame.size.width - 40, height: 50))
        label.textColor = .black
        label.text = "What's up?"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        let button = UIButton(frame: CGRect(x: view.frame.size.width - 90, y: 17.5, width: 80, height: 15))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitle("All news", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        header.addSubview(label)
        header.addSubview(button)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LGDiscoverTableViewCell.cellIdentifier) as! LGDiscoverTableViewCell
        if news?.count ?? 0 > 0 {
            cell.configure(news: news!, frameWidth: view.frame.size.width)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.frame.size.width * 0.8 * 1.4)
    }
}

