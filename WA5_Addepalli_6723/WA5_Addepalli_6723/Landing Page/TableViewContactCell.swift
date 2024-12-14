//
//  TableViewContactCell.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class TableViewContactCell: UITableViewCell {
    var wrapperCellView: UIView!
    
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var imageContact: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setupWrapperCellView()
        setupLabels()
        setupImageContact()
        initConstraints()

    }
    
    func setupImageContact(){
        imageContact = UIImageView()
        imageContact.image = UIImage(systemName: "photo")
        imageContact.contentMode = .scaleToFill
        imageContact.clipsToBounds = true
        imageContact.layer.cornerRadius = 10
        imageContact.translatesAutoresizingMaskIntoConstraints = false
        imageContact.tintColor = .black
        wrapperCellView.addSubview(imageContact)
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 10.0
        
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabels() {
        labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = UIFont.boldSystemFont(ofSize: 20) // Adjust the font size as needed
        wrapperCellView.addSubview(labelName)
        
        labelEmail = UILabel()
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
        
        labelPhone = UILabel()
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhone)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 12),
            labelName.leadingAnchor.constraint(equalTo: imageContact.trailingAnchor, constant: 8),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            labelEmail.leadingAnchor.constraint(equalTo: imageContact.trailingAnchor, constant: 8),
            labelEmail.heightAnchor.constraint(equalToConstant: 20),
            labelEmail.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 10),
            labelPhone.leadingAnchor.constraint(equalTo: imageContact.trailingAnchor, constant: 8),
            labelPhone.heightAnchor.constraint(equalToConstant: 20),
            labelPhone.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            imageContact.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageContact.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            imageContact.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            imageContact.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
