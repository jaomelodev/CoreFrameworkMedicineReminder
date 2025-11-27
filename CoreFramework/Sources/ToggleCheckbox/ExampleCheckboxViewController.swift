//
//  ExampleCheckboxViewController.swift
//  CoreFramework
//
//  Created by João Melo on 25/11/25.
//
import UIKit

public class ExampleCheckboxViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.gray800
        
        let checkbox = ToggleCheckbox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(checkbox)
        
        NSLayoutConstraint.activate([
            checkbox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkbox.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 60),
            checkbox.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
