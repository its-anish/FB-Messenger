//
//  ContactListVC.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 26/06/2021.
//

import UIKit

class ContactListVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    private var contactListVM: ContactListVM!
    private var tableviewDataSource : ContactListTableViewDataSource<UserTVC, User>!
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.tableFooterView = UIView()
        tableview.separatorStyle = .none
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to load more")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableview.addSubview(refreshControl)
        callViewModel()
    }
    
    @objc func refresh() {
        contactListVM.getNext()
    }
    
    func callViewModel() {
        contactListVM = ContactListVM()
        contactListVM.bindContactListVMtoContactListVC = {
            
            self.updateDataSource()
        }
    }
    
    func updateDataSource()  {
        tableviewDataSource = ContactListTableViewDataSource(cellIdentifier: "UserTVC", items: contactListVM.users, configureCell: { (cell, user) in
            cell.labelUserName.text = "\(user.firstName) \(user.lastName)"
            cell.imageviewUser.load(url: URL(string: user.avatar)!)
        })
        
        DispatchQueue.main.async {
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
            self.tableview.dataSource = self.tableviewDataSource
            self.tableview.reloadData()
        }
    }

}

extension ContactListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}

class UserTVC: UITableViewCell {
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelLastMsg: UILabel!
    @IBOutlet weak var imageviewUser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageviewUser.layer.cornerRadius = imageviewUser.frame.height * 0.5
    }
    
    override func prepareForReuse() {
        imageviewUser.image = nil
    }
}
