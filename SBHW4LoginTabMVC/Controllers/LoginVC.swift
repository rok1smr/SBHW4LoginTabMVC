//
//  LoginVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 30.10.2021.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//  функция очистки полей ввода
    func clearTextFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
//  функция позволяющая скрывать клавиатуру тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
//  функция которая возвращает нам нужного юзера исходя из логина и пароля которые мы берем из текст филдов
    func submit() {
        UserStore.shared.login(with: loginTextField.text!, password: passwordTextField.text!)
    }
    
//  функция которая выполняется при нажатии кнопки логин
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        submit()
    }
    
//  функция для работы анвинд сигвея
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
//  метод препер фор сигвей в который заложена логика проверки на пустые поля и очистки полей ввода если поля были не пустыми, а так же проверяется зарегистрирован ли такой юзер вообще
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let checkLogin = loginTextField.text, !checkLogin.isEmpty else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            return
        }
        guard let checkPassword = passwordTextField.text, !checkPassword.isEmpty else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            return
        }
        guard let registeredUser = UserStore.shared.currentUser else {
            showAlert(title: "User not registered", message: "Please contact support")
            return
        }
        
        guard segue.destination is HomeVC else {
            clearTextFields()
            return
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
