//
//  MenuView.swift
//  CoreFramework
//
//  Created by João Melo on 24/11/25.
//
import UIKit
import CoreFramework

class MenuView: UIView {
    var didTapOnboarding: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Example Menu"
        label.font = Typography.heading
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let onboardingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Onboarding", for: .normal)
        button.titleLabel?.font = Typography.label
        button.layer.cornerRadius = Metrics.size28
        button.backgroundColor = Colors.primaryRedBase
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapOnboardingButton), for: .touchUpInside)
        return button
    }()
    
    private let testCheckboxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test checkbox", for: .normal)
        button.titleLabel?.font = Typography.label
        button.layer.cornerRadius = Metrics.size28
        button.backgroundColor = Colors.primaryRedBase
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCheckboxButton), for: .touchUpInside)
        return button
    }()
    
    private let testCustomButtonButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test Custom Button", for: .normal)
        button.titleLabel?.font = Typography.label
        button.layer.cornerRadius = Metrics.size28
        button.backgroundColor = Colors.primaryRedBase
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCustomButtonButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(onboardingButton)
        addSubview(testCheckboxButton)
        addSubview(testCustomButtonButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            onboardingButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            onboardingButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            onboardingButton.heightAnchor.constraint(equalToConstant: Metrics.size56),
            onboardingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.p20),
            onboardingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.p20),
            
            testCheckboxButton.topAnchor.constraint(equalTo: onboardingButton.bottomAnchor, constant: Metrics.p20),
            testCheckboxButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            testCheckboxButton.heightAnchor.constraint(equalToConstant: Metrics.size56),
            testCheckboxButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.p20),
            testCheckboxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.p20),
            
            testCustomButtonButton.topAnchor.constraint(equalTo: testCheckboxButton.bottomAnchor, constant: Metrics.p20),
            testCustomButtonButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            testCustomButtonButton.heightAnchor.constraint(equalToConstant: Metrics.size56),
            testCustomButtonButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.p20),
            testCustomButtonButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.p20),
        ])
    }
    
    @objc private func didTapOnboardingButton() {
        didTapOnboarding?()
    }
    
    @objc private func didTapCheckboxButton() {
        let checkboxViewController = ExampleCheckboxViewController()
        
        if let parentViewController = self.window?.rootViewController {
            parentViewController.present(checkboxViewController, animated: true)
        }
    }
    
    @objc private func didTapCustomButtonButton() {
        let exampleCustomButtonViewController = ExampleCustomButtonViewController()
        
        if let parentViewController = self.window?.rootViewController {
            parentViewController.present(exampleCustomButtonViewController, animated: true)
        }
    }
}

#if DEBUG
import SwiftUI

struct MenuViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            MenuView()
        }
        .ignoresSafeArea()
        .background(.white)
    }
}
#endif
