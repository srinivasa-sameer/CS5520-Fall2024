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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setupWrapperCellView()
        setupLabels()
        initConstraints()

    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 0.7
        wrapperCellView.layer.cornerRadius = 10
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
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelEmail.heightAnchor.constraint(equalToConstant: 20),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhone.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            labelPhone.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
