//
//  ChatMessageCell.swift
//  WA8_27
//
//  Created by Vidhi Thacker on 11/14/24.
//
import UIKit

class ChatMessageCell: UITableViewCell {
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let timeStampLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeStampLabel)
        contentView.addSubview(messageLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Name Label
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Timestamp Label
            timeStampLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            timeStampLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeStampLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Message Label
            messageLabel.topAnchor.constraint(equalTo: timeStampLabel.bottomAnchor, constant: 5),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    func configure(withMessage message: Message, isCurrentUser: Bool) {
        nameLabel.text = message.senderName
        timeStampLabel.text = formatDate(date: message.timestamp)
        messageLabel.text = message.text

        let alignment: NSTextAlignment = isCurrentUser ? .right : .left
        nameLabel.textAlignment = alignment
        timeStampLabel.textAlignment = alignment
        messageLabel.textAlignment = alignment

        messageLabel.textColor = isCurrentUser ? .blue : .darkGray
    }

    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
