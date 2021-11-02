//
//  LoginVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 30.10.2021.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    //  функция очистки полей ввода
    func clearTextFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Keyboard -
    
    //    functions neede to shift the contents of the screen when keyboard appears
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -50 
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    //    функция для переключения между текст филдами с помощью клавиатуры
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
    
    //    свичт кейс для переключения между текст филдами с помощью клавиатуры
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        default:
            passwordTextField.resignFirstResponder()
            loginButtonPressed()
        }
    }
    
    //  функция позволяющая скрывать клавиатуру тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IBACTIONS -
    
    //  функция которая выполняется при нажатии кнопки логин
    @IBAction func loginButtonPressed() {
        guard loginTextField.text == user.login && passwordTextField.text == user.password else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            return
        }
    }
    
    @IBAction func hintButtonPressed(_ sender: Any) {
        showAlert(title: "You have 2 users, so check them both out!", message: "Neo - 123 \n Smith - 000")
    }
    
    // MARK: - NAVIGATION -
    
    //  функция для работы анвинд сигвея
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        clearTextFields()
    }
    
    
    //  метод препер фор сигвей в который заложена логика проверки на пустые поля и очистки полей ввода если поля были не пустыми, а так же проверяется зарегистрирован ли такой юзер вообще
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let HomeVCont = $0 as? HomeVC {
                HomeVCont.user = user
            } else if let navigationViewController = $0 as? UINavigationController {
                let InfoVCont = navigationViewController.topViewController as! UserVC
                InfoVCont.user = user
            }
        }
    }
}

// алерт контроллер
extension LoginVC {
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

