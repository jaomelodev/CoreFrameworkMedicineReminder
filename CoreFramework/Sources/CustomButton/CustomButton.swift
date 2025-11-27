//
//  CustomButton.swift
//  CoreFramework
//
//  Created by João Melo on 26/11/25.
//

import UIKit

protocol CustomButtonDelegate: AnyObject {
    func buttonAction()
}

class CustomButton: UIButton {
    weak var delegate: CustomButtonDelegate?
    private var iconPosition: NSLayoutConstraint.Axis?

    private var customWidth: CGFloat?

    init(title: String, backgroundColor: UIColor = Colors.primaryRedBase) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: nil,
            iconPosition: nil,
            backgroundColor: backgroundColor
        )
    }

    init(
        title: String,
        icon: UIImage,
        iconPosition: NSLayoutConstraint.Axis,
        backgroundColor: UIColor = Colors.primaryRedBase
    ) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: icon,
            iconPosition: iconPosition,
            backgroundColor: backgroundColor
        )
    }

    init(
        title: String,
        width: CGFloat,
        backgroundColor: UIColor = Colors.primaryRedBase
    ) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: nil,
            iconPosition: nil,
            backgroundColor: backgroundColor
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton(
        title: String,
        icon: UIImage?,
        iconPosition: NSLayoutConstraint.Axis?,
        backgroundColor: UIColor
    ) {
        self.isEnabled = true
        self.layer.cornerRadius = Metrics.p28

        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = Colors.gray800
        config.title = title

        if let icon = icon, let iconPosition = iconPosition {
            config.image = icon
            config.imagePadding = 8
            self.tintColor = Colors.gray800
            self.iconPosition = iconPosition
            adjustIconPosition()
        }

        self.configuration = config
        self.titleLabel?.font = Typography.subHeading

        self.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
    }

    @objc
    private func buttonTapped() {
        delegate?.buttonAction()
    }

    private func adjustIconPosition() {
        guard let iconPosition = iconPosition else { return }

        var config = self.configuration ?? .filled()

        switch iconPosition {
        case .horizontal:
            config.imagePlacement = .leading
        case .vertical:
            config.imagePlacement = .top
        @unknown default:
            config.imagePlacement = .leading
        }
        config.imagePadding = 8
        self.configuration = config
    }
}
