import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelLogin: UILabel?
    
    @IBOutlet weak var labelPassword: UILabel?
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    @IBOutlet weak var loginInput: UITextField?
    
    @IBOutlet weak var passwodrInput: UITextField?
    
    @IBAction func singInButton(_ sender: Any) {
 
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        func showAlert()  {
            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
                        alert.addAction(action)
                        present(alert, animated: true)
        }
        
        func checkUserData(_ login : String, _ password : String) -> Bool {
            if login == "admin" && password == "admin" {
                return true
            } else {
                showAlert()
                return false
            }
        }
        
        guard let login = loginInput?.text else {
            showAlert()
            return false
        }
        
        guard let password = passwodrInput?.text else {
            showAlert()
            return false
        }
        
        return checkUserData(login, password)
        
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

