//
//  ViewController.swift
//  CoreFrameworkExample
//
//  Created by João Melo on 07/06/25.
//

import UIKit
import CoreFramework

class MenuViewController: UIViewController {
    private let contentView: MenuView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupActions() {
        contentView.didTapOnboarding = { [weak self] in
            self?.showOnboarding()
        }
    }
    
    private func showOnboarding() {
        let onboardingView = OnboardingView()
        let steps = [
            (UIImage(named: "Image1"), "Bem vindo ao onboarding do reminder"),
            (UIImage(named: "Image2"), "Para cadastrar seus remédios, é super simples"),
            (UIImage(named: "Image3"), "Selecione o horário da primeira dose, e as subsequentes"),
            (UIImage(named: "Image4"), "Iremos te lembrar de tomar no horário correto."),
        ]
        
        onboardingView.presentOnboarding(on: contentView, with: steps)
    }
}

#if DEBUG
import SwiftUI

struct MyReceiptsViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            MenuViewController()
        }
        .ignoresSafeArea()
    }
}
#endif

