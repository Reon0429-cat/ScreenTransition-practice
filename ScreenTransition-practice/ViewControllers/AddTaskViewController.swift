//
//  AddTaskViewController.swift
//  ScreenTransition-practice
//
//  Created by 大西玲音 on 2021/05/13.
//

import UIKit

final class AddTaskViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var jobTextField: UITextField!
    @IBOutlet private weak var backButton: UIButton!
    
    private var onTapEvent: ((User?) -> Void)?
    
    @IBAction private func backButtonDidTapped(_ sender: Any) {
        guard let nameText = nameTextField.text,
              let jobText = jobTextField.text else { return }
        let user = (nameText.isEmpty || jobText.isEmpty) ? nil : User(name: nameText, job: jobText)
        onTapEvent?(user)
        dismiss(animated: true, completion: nil)
    }
    
    static func instantiate(onTapEvent: @escaping (User?) -> Void) -> AddTaskViewController {
        let addTaskVC = UIStoryboard.addTask.instantiateViewController(
            identifier: AddTaskViewController.identifier
        ) as! AddTaskViewController
        addTaskVC.onTapEvent = onTapEvent
        return addTaskVC
    }
    
}

private extension UIStoryboard {
    
    static var addTask: UIStoryboard {
        UIStoryboard(name: "AddTask", bundle: nil)
    }
    
}
