//
//  ExampleCustomButtonViewController.swift
//  CoreFramework
//
//  Created by João Melo on 26/11/25.
//

import UIKit

public class ExampleCustomButtonViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        guard let startImage = UIImage(systemName: "star") else { return }

        let buttonWithIcon = CustomButton(
            title: "Com Ícone",
            icon: startImage,
            iconPosition: .horizontal
        )
        
        let buttonWithoutIcon = CustomButton(title: "Sem ícone, simples")
        
        buttonWithIcon.translatesAutoresizingMaskIntoConstraints = false
        buttonWithoutIcon.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonWithIcon)
        view.addSubview(buttonWithoutIcon)
        
        NSLayoutConstraint.activate([
            buttonWithIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWithIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonWithIcon.heightAnchor.constraint(equalToConstant: 56),
            buttonWithIcon.widthAnchor.constraint(equalToConstant: 300),
            
            buttonWithoutIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonWithoutIcon.topAnchor.constraint(equalTo: buttonWithIcon.bottomAnchor, constant: Metrics.p20),
            buttonWithoutIcon.heightAnchor.constraint(equalToConstant: 56),
            buttonWithoutIcon.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
