//
//  ChatsTableViewCell.swift
//  WA8_27
//
//  Created by Vidhi Thacker on 11/14/24.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.font = UIFont.boldSystemFont(ofSize: 14)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.font = UIFont.boldSystemFont(ofSize: 14)
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhone)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
          // Wrapper View constraints
          wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
          wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
          wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
          wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

          // Name Label constraints
          labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 12),
          labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
          labelName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
          
          // Email Label constraints
          labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
          labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
          labelEmail.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
          
          // Phone Label constraints
          labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
          labelPhone.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
          labelPhone.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
          labelPhone.bottomAnchor.constraint(lessThanOrEqualTo: wrapperCellView.bottomAnchor, constant: -12)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
