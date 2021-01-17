//
//  ViewController.swift
//  geekbrainspart2
//
//  Created by Андрей Ситников on 13.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelLogin: UILabel?
    
    @IBOutlet weak var labelPassword: UILabel?
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    @IBOutlet weak var loginInput: UITextField?
    
    @IBOutlet weak var passwodrInput: UITextField?
    
    @IBAction func singInButton(_ sender: Any) {
        let login = loginInput?.text!
        
        let password = passwodrInput?.text!
        
        if login == "admin" && password == "admin" {
            print("Добро пожаловать!")
        } else {
            print("Логин или пароль не верный!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGestus = UITapGestureRecognizer(target: self, action: #selector(hideKeyboar))
        
        scrollView?.addGestureRecognizer(hideKeyboardGestus)
    }
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification : Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        scrollView?.contentInset.bottom += keyboardFrame.height
    }
    
    @objc private func keyboardWillHide(notification : Notification) {
        scrollView?.contentInset = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboar() {
        self.scrollView?.endEditing(true)
    }
    
}

