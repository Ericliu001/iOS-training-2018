//
//  ViewController.swift
//  ContainerViewControllerExample
//
//  Created by Chris Morris on 6/12/18.
//  Copyright © 2018 Big Nerd Ranch, Inc. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    let firstViewController = FirstViewController()
    let secondViewController = SecondViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(firstViewController)
        firstViewController.view.frame = contentView.bounds
        contentView.addSubview(firstViewController.view)
        firstViewController.didMove(toParentViewController: self)
    }

    @IBAction func valueChanged(_ sender: UISegmentedControl) {

        let viewControllerToAdd: UIViewController
        let viewControllerToRemove: UIViewController

        switch sender.selectedSegmentIndex {
        case 0:
            viewControllerToAdd = firstViewController
            viewControllerToRemove = secondViewController
        case 1:
            viewControllerToAdd = secondViewController
            viewControllerToRemove = firstViewController
        default:
            preconditionFailure()
        }

        viewControllerToRemove.willMove(toParentViewController: nil)
        viewControllerToRemove.view.removeFromSuperview()
        viewControllerToRemove.removeFromParentViewController()

        addChildViewController(viewControllerToAdd)
        viewControllerToAdd.view.frame = contentView.bounds
        contentView.addSubview(viewControllerToAdd.view)
        viewControllerToAdd.didMove(toParentViewController: self)
    }
}

