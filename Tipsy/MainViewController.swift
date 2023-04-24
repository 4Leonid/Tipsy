//
//  ViewController.swift
//  Tipsy
//
//  Created by Леонид Турко on 24.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {
  
  private lazy var mainView: UIView = {
    let element = UIView()
    element.backgroundColor = #colorLiteral(red: 0.7691866755, green: 0.8915952444, blue: 0.8383007646, alpha: 1)
    return element
  }()
  
  private lazy var firstStack: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.spacing = 26
    element.distribution = .fill
    return element
  }()
  
  private lazy var billLabel: UILabel = {
    let element = UILabel()
    element.text = "Enter bill total"
    element.textColor = .lightGray
    element.font = UIFont.systemFont(ofSize: 25)
    return element
  }()
  
  private lazy var moneyTextField: UITextField = {
    let element = UITextField()
    element.placeholder = "e.g. 123.56"
    element.font = UIFont.systemFont(ofSize: 40)
    element.textAlignment = .center
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstraints()
  }
}

//  MARK: -  Private Methods
extension MainViewController {
  private func setViews() {
    view.addSubview(mainView)
    view.addSubview(firstStack)
    
    firstStack.addArrangedSubview(billLabel)
    firstStack.addArrangedSubview(moneyTextField)
  }
  
  private func setConstraints() {
    moneyTextField.snp.makeConstraints { make in
      make.height.equalTo(48)
      make.leading.trailing.equalToSuperview()
    }
    
    billLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(50)
      make.height.equalTo(30)
    }
    
    firstStack.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
      make.bottom.equalTo(mainView.snp.top).offset(-40)
    }
    
    mainView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.top.equalTo(firstStack.snp.bottom).inset(40)
    }
  }
}

//  MARK: - Show Canvas
struct ContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = MainViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return MainViewController()
  }
  
  func updateUIViewController(_ uiViewController: MainViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
