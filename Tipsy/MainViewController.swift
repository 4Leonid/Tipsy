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
  
  //  MARK: -  StackView
  private lazy var fouthStack: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.distribution = .fillProportionally
    element.alignment = .fill
    return element
  }()
  
  private lazy var thirdStack: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.distribution = .fillProportionally
    element.alignment = .fill
    return element
  }()
  
  private lazy var secondStack: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.spacing = 26
    element.distribution = .fill
    element.alignment = .center
    return element
  }()
  
  private lazy var firstStack: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.spacing = 27
    element.distribution = .fill
    element.alignment = .fill
    return element
  }()
  
  //  MARK: -  UIButtons
  private lazy var calculateButton: UIButton = {
    let element = UIButton(type: .system)
    element.backgroundColor = #colorLiteral(red: 0.0004900721833, green: 0.6912010908, blue: 0.4188455343, alpha: 1)
    element.titleLabel?.tintColor = .white
    element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
    element.setTitle("Calculate", for: .normal)
    return element
  }()
  
  private lazy var zeroButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("0%", for: .normal)
    element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
    element.tintColor = #colorLiteral(red: 0.0004900721833, green: 0.6912010908, blue: 0.4188455343, alpha: 1)
    return element
  }()
  
  private lazy var tenButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("10%", for: .normal)
    element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
    element.tintColor = #colorLiteral(red: 0.0004900721833, green: 0.6912010908, blue: 0.4188455343, alpha: 1)
    return element
  }()
  
  private lazy var twentyButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("20%", for: .normal)
    element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
    element.tintColor = #colorLiteral(red: 0.0004900721833, green: 0.6912010908, blue: 0.4188455343, alpha: 1)
    return element
  }()
  
  //  MARK: -  UILabel
  private lazy var splitNumberLabel: UILabel = {
    let element = UILabel()
    element.text = "2"
    element.textColor = #colorLiteral(red: 0.0004900721833, green: 0.6912010908, blue: 0.4188455343, alpha: 1)
    element.font = UIFont.systemFont(ofSize: 35)
    return element
  }()
  
  private lazy var tipLabel: UILabel = {
    let element = UILabel()
    element.text = "Select tip"
    element.textColor = .lightGray
    element.font = UIFont.systemFont(ofSize: 25)
    return element
  }()
  
  private lazy var splitLabel: UILabel = {
    let element = UILabel()
    element.text = "Choose split"
    element.textColor = .lightGray
    element.font = UIFont.systemFont(ofSize: 25)
    return element
  }()
  
  private lazy var billLabel: UILabel = {
    let element = UILabel()
    element.text = "Enter bill total"
    element.textColor = .lightGray
    element.font = UIFont.systemFont(ofSize: 25)
    return element
  }()
  
  private lazy var stepper: UIStepper = {
    let element = UIStepper()
    
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
    view.addSubview(calculateButton)
    
    mainView.addSubview(secondStack)
    mainView.addSubview(thirdStack)
    mainView.addSubview(fouthStack)
    
    firstStack.addArrangedSubview(billLabel)
    firstStack.addArrangedSubview(moneyTextField)
    
    secondStack.addArrangedSubview(tipLabel)
    secondStack.addArrangedSubview(thirdStack)
    secondStack.addArrangedSubview(splitLabel)
    secondStack.addArrangedSubview(fouthStack)
    
    thirdStack.addArrangedSubview(zeroButton)
    thirdStack.addArrangedSubview(tenButton)
    thirdStack.addArrangedSubview(twentyButton)
    
    fouthStack.addArrangedSubview(splitNumberLabel)
    fouthStack.addArrangedSubview(stepper)
  }
  
  private func setConstraints() {
    calculateButton.snp.makeConstraints { make in
      make.bottom.equalTo(view.safeAreaLayoutGuide)
      make.width.greaterThanOrEqualTo(200)
      make.centerX.equalTo(view.snp.centerX)
      make.height.equalTo(54)
    }
    thirdStack.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
    }
    splitLabel.snp.makeConstraints { make in
      make.leading.height.equalTo(30)
    }
    tipLabel.snp.makeConstraints { make in
      make.leading.height.equalTo(30)
    }
    
    secondStack.snp.makeConstraints { make in
      make.leading.trailing.top.equalToSuperview().inset(20)
    }
    
    moneyTextField.snp.makeConstraints { make in
      make.height.equalTo(48)
      make.leading.trailing.equalToSuperview()
    }
    
    billLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(50)
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
