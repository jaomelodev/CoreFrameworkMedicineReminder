//
//  ToggleCheckboxUIView.swift
//  CoreFramework
//
//  Created by João Melo on 25/11/25.
//
import UIKit

public class ToggleCheckbox: UIButton {
    private var isChecked: Bool = false
    private let checkedImage = UIImage(named: "checkedCheckbox")
    private let uncheckedImage = UIImage(named: "uncheckedCheckbox")
    
    public init() {
        super.init(frame: .zero)
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func toggle() {
        self.isChecked.toggle()

        setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }
    
    public func getIsCheckedState() -> Bool {
        return isChecked
    }
}
