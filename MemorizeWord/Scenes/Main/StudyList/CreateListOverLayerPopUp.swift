//
//  CreateListOverLayerPopUp.swift
//  MemorizeWord
//
//  Created by talha.sahin on 22.11.2023.
//

import UIKit

class CreateListOverLayerPopUp: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var txtListName: UITextField!
    @IBOutlet weak var emptyTextFieldWarning: UILabel!
    
    var studyListDelegate: StudyListViewModelDelegate!
    @IBOutlet weak var contentViewCenterConstraint: NSLayoutConstraint!
    
    init() {
        super.init(nibName: "CreateListOverLayerPopUp", bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
        backView.addGestureRecognizer(tap)
        registerForKeyboardNotifications()
    }
    
    private func configView() {
        view.backgroundColor = .clear
        backView.backgroundColor = .black.withAlphaComponent(0.6)
        backView.alpha = 0
        contentView.alpha = 0
        contentView.layer.cornerRadius = 10
    }
        
    func appear(sender: UIViewController) {
        sender.present(self, animated: false) {
            self.show()
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if let text = txtListName.text, !text.isEmpty {
            studyListDelegate.addNewList(model: StudyListModel(title: text, terms: "0 Term", learned: "0 Learned", notLearned: "0 Not Learned")) {
                hide()
            }
            return
        }
        emptyTextFieldWarning.isHidden = false
    }
    

    @IBAction func textFieldChanged(_ sender: Any) {
        emptyTextFieldWarning.isHidden = true
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        hide()
    }
    
    @objc func tapScreen() {
        hide()
    }
    
    private func show() {
        UIView.animate(withDuration: 1, delay: 0.1) {
            self.backView.alpha = 1
            self.contentView.alpha = 1
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
            self.backView.alpha = 0
            self.contentView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }
}

extension CreateListOverLayerPopUp {
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(_:)),name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func setKeyboardConstraint(willShown: Bool, value: Double) {
        contentViewCenterConstraint.constant = willShown ? -100 : 0
    }
    @objc func keyboardWillShown(_ notificiation: NSNotification) {
        
        if let userInfo = notificiation.userInfo, let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            setKeyboardConstraint(willShown: true, value: keyboardRectangle.maxX - contentView.frame.maxY)
            UIView.animate(withDuration: 1.0) {
                    self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        //setKeyboardConstraint(willShown: false)
    }
}
