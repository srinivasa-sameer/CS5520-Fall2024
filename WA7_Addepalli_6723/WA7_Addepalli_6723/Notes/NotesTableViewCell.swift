//
//  NotesTableViewCell.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var noteContent: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupWrapperCellView()
        setupNoteContent()
        initConstraints()
    }

    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }

    func setupNoteContent() {
        noteContent = UILabel()
        noteContent.font = UIFont.boldSystemFont(ofSize: 16)
        noteContent.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(noteContent)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(
                equalTo: self.topAnchor, constant: 6),
            wrapperCellView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor, constant: -6),

            noteContent.topAnchor.constraint(
                equalTo: wrapperCellView.topAnchor, constant: 8),
            noteContent.leadingAnchor.constraint(
                equalTo: wrapperCellView.leadingAnchor, constant: 10),
            noteContent.heightAnchor.constraint(equalToConstant: 20),
            noteContent.widthAnchor.constraint(
                equalTo: wrapperCellView.widthAnchor),

            wrapperCellView.heightAnchor.constraint(equalToConstant: 36),

        ])

    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
