//
//  ProgressSpinnerViewController.swift
//  App12
//
//  Created by Srinivasa Sameer Addepalli on 11/14/24.
//

import UIKit

class ProgressSpinnerViewController: UIViewController {

    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .red
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()

        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        view.addSubview(activityIndicator)

        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            .isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            .isActive = true

    }

}
