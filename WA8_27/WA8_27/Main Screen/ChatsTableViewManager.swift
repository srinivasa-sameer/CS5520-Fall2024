//
//  ChatsTableViewManager.swift
//  WA8_27
//
//  Created by Vidhi Thacker on 11/14/24.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewChatsID, for: indexPath) as! ChatsTableViewCell
        cell.labelName.text = chatsList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedChat = chatsList[indexPath.row]
        let chatViewController = ChatViewController()
        chatViewController.otherUserId = selectedChat.userId
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }
}
