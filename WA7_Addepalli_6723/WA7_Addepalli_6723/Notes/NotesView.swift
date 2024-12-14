//
//  NotesView.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import UIKit

class NotesView: UIView {

    var notesTableView: UITableView!
    var addNotesView: UIView!
    var notesInput: UITextField!
    var addButton: UIButton!
    var detailsButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupNotesTableView()

        setupAddNotesView()
        setupNotesInput()
        setupAddButton()

        initConstraints()
    }

    func setupNotesTableView() {
        notesTableView = UITableView()
        notesTableView.register(
            NotesTableViewCell.self, forCellReuseIdentifier: "notes")
        notesTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(notesTableView)
    }

    func setupAddNotesView() {
        addNotesView = UIView()
        addNotesView.backgroundColor = .white
        addNotesView.layer.cornerRadius = 6
        addNotesView.layer.shadowColor = UIColor.lightGray.cgColor
        addNotesView.layer.shadowOffset = .zero
        addNotesView.layer.shadowRadius = 4.0
        addNotesView.layer.shadowOpacity = 0.7
        addNotesView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addNotesView)
    }

    func setupNotesInput() {
        notesInput = UITextField()
        notesInput.placeholder = "Notes"
        notesInput.borderStyle = .roundedRect
        notesInput.translatesAutoresizingMaskIntoConstraints = false
        addNotesView.addSubview(notesInput)
    }

    func setupAddButton() {
        addButton = UIButton(type: .system)
        addButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        addButton.setTitle("Add Note", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addNotesView.addSubview(addButton)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            addNotesView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            addNotesView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            addNotesView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),

            addButton.bottomAnchor.constraint(
                equalTo: addNotesView.bottomAnchor, constant: -8),
            addButton.leadingAnchor.constraint(
                equalTo: self.centerXAnchor, constant: -50),

            notesInput.bottomAnchor.constraint(
                equalTo: addButton.topAnchor, constant: -8),
            notesInput.leadingAnchor.constraint(
                equalTo: addNotesView.leadingAnchor, constant: 15),
            notesInput.trailingAnchor.constraint(
                equalTo: addNotesView.trailingAnchor, constant: -15),

            addNotesView.topAnchor.constraint(
                equalTo: notesInput.topAnchor, constant: -8),

            notesTableView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            notesTableView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            notesTableView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            notesTableView.bottomAnchor.constraint(
                equalTo: addNotesView.topAnchor, constant: -8),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
