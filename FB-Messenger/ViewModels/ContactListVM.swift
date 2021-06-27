//
//  ContactListVM.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 26/06/2021.
//

import Foundation

class ContactListVM {
    private var apiService: APIService!
    private var page: Int = 1
    
    private(set) var users: [User]! {
        didSet {
            self.bindContactListVMtoContactListVC()
        }
    }
    
    init() {
        apiService = APIService()
        users = []
        fetchUsers()
    }
    
    private func fetchUsers() {
        apiService.getUser(page: page) { (users) in
            self.users = users.sorted{
                $0.id > $1.id
            } + self.users
        }
    }
    
    func getNext() {
        page+=1
        fetchUsers()
    }
    
    var bindContactListVMtoContactListVC: (()->()) = {}
}
