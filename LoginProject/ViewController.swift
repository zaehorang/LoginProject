//
//  ViewController.swift
//  LoginProject
//
//  Created by zaehorang on 2023/08/02.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - 이메일 입력하는 텍스트 뷰
    private lazy var emailTextFieldView: UIView = {  // addSubview를 클로저에 작성하기 위해 lazy 사용
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
            
            view.addSubview(emailTextField)         //add하는 순서도 중요 -> 올리는 순서대로 화면이 구성된다.
            view.addSubview(emailInfoLabel)
            return view
        }()
        
        // "이메일 또는 전화번호" 안내문구
        private let emailInfoLabel: UILabel = {
            let label = UILabel()
            label.text = "이메일주소 또는 전화번호"
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            return label
        }()
        
        // 로그인 - 이메일 입력 필드
        private lazy var emailTextField: UITextField = {
            var tf = UITextField()
            tf.frame.size.height = 48
            tf.backgroundColor = .clear
            tf.textColor = .white
            tf.tintColor = .white
            tf.autocapitalizationType = .none
            tf.autocorrectionType = .no
            tf.spellCheckingType = .no
            tf.keyboardType = .emailAddress
//            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            return tf
        }()
    
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
        private lazy var passwordTextFieldView: UIView = {
            let view = UIView()
            //view.frame.size.height = 48
            view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
            view.addSubview(passwordTextField)
            view.addSubview(passwordInfoLabel)
            view.addSubview(passwordSecureButton)
            return view
        }()
        
        // 패스워드텍스트필드의 안내문구
        private let passwordInfoLabel: UILabel = {
            let label = UILabel()
            label.text = "비밀번호"
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
            return label
        }()
        
        // 로그인 - 비밀번호 입력 필드
        private lazy var passwordTextField: UITextField = {
            let tf = UITextField()
            tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            tf.frame.size.height = 48
            tf.backgroundColor = .clear
            tf.textColor = .white
            tf.tintColor = .white
            tf.autocapitalizationType = .none
            tf.autocorrectionType = .no
            tf.spellCheckingType = .no
            tf.isSecureTextEntry = true
            tf.clearsOnBeginEditing = false
//            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            return tf
        }()
    
    // 패스워드에 "표시"버튼 비밀번호 가리기 기능
    private lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
//        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    // MARK: - 로그인버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
//        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
   
    // MARK: - 이메일텍스트필드, 패스워드, 로그인버튼 스택뷰에 배치
    private lazy var stackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        stView.spacing = 18
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
            }

    func makeUI() {
        
        view.addSubview(stackView)
        view.backgroundColor = UIColor.black
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //오토레이아웃 구성
        NSLayoutConstraint.activate([
            
        emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
        emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
        emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
        
            
        emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
        emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
        emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
        emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
        
        
        passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
        passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
        passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
        
        
        passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
        passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
        passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
        
        
        passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
        passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
        passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
        
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36)])
        
    }

    
}

  
