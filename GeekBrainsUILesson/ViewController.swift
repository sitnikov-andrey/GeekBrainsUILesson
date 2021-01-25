//
//  ViewController.swift
//  GeekFirst
//
//  Created by Kovalev Alexander on 11.01.2021.
//

import UIKit

class ViewController: UIViewController {

	/// Свойство, хранящее лэйбл с приветствием
	@IBOutlet var greetingLabel: UILabel?
	
	/// Текстовое поле для ввода пароля
	@IBOutlet var passowrdTextField: UITextField?
	
	/// Сколлвью
	@IBOutlet var scrollView: UIScrollView?
	
	/// Это свойство нужно для того, чтобы понимать отображена ли клавиатура в данный момент или нет, так как нотификации о ее появлении/убирании приходят не совсем корректно (баг системы)
	private var keyboardShown = false
	
	/// Метод жизненного цикла контроллера, вызывается когда вью загрузилась и к ней можно обращаться
	override func viewDidLoad() {
		super.viewDidLoad()
		addTapGestureRecognizer()
	}
	
	@IBAction func loginButtonItemTapped(_ sender: Any) {
		let controller = FriendsViewController(style: .grouped)
		navigationController?.pushViewController(controller, animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		addKeyboardObservers()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		//remove observers
	}
	
	/// Метод жизненного цикла, вызываемый когда контроллер покажется на экране (сразу после окончания анимации перехода)
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		greetingLabel?.text = "Добро пожаловать!"
	}
	
	/// Добавление слушателей на появление/ скрытие клавиатуры. Регистрируем контроллер в качестве обозревателя и передаем какой метод должен быть вызван(селектор) по наступлении события, передаем name в качетсве имени события, хоторое хотим слушать, у нас это появление и скрытие клавиатуры
	private func addKeyboardObservers() {
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow(notification:)),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide(notification:)),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}
	
	/// Добавляем обработку нажатия на экран для скрытия клавиатуры. Данный метод работает только с passowrdTextField, если клавиатура поднята для ввода в него, нужно сделать то же самое и для поля ввода логина
	private func addTapGestureRecognizer() {
		let recognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
		view.addGestureRecognizer(recognizer)
	}
	
	
	@objc private func endEditing() {
		view.endEditing(true)
	}
	
	/// Обрабатываем момент появления клавиатуры, достаем из уведомления данные о том, какой будет финальный размер клавиатуры и добавляем отступы в скроллвью снизу. Перед эти проверяем не поднята ли уже клавиатура, так как этот метод может вызываться дважды (баг)
	@objc private func keyboardWillShow(notification: Notification) {
		guard !keyboardShown else { return }
		guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
			return
		}
		scrollView?.contentInset.bottom += keyboardFrame.height
		keyboardShown = true
	}

	/// Все то же самое, что и с появлением клавиатуры, только отступ уменьшаем
	@objc private func keyboardWillHide(notification: Notification) {
		guard keyboardShown else { return }
		guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect else {
			return
		}
		scrollView?.contentInset.bottom -= keyboardFrame.height
		keyboardShown = false
	}
	
	@IBAction func unwindSegue(segue: UIStoryboardSegue) {
		
	}
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		guard let password = passowrdTextField?.text else {
			showAlert()
			return false
		}
		if password == "admin" {
			return true
		} else {
			showAlert()
			return false
		}
	}
	
	private func showAlert() {
		let alert = UIAlertController(title: "Password", message: "Incorrect password", preferredStyle: .alert)
		let action = UIAlertAction(title: "Close", style: .default) { (_) in
			print("closed")
		}
		alert.addAction(action)
		present(alert, animated: true)
		
	}
}

