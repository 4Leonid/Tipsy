//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Леонид Турко on 26.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class ResultViewController: UIViewController {
  //  MARK: -  UI Elements
  private lazy var recalculateButton: UIButton = {
    let element = UIButton(type: .system)
    element.backgroundColor = #colorLiteral(red: 0.0004900721833, green: 0.6912010908, blue: 0.4188455343, alpha: 1)
    element.titleLabel?.tintColor = .white
    element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
    element.setTitle("Recalculate", for: .normal)
    return element
  }()
  
  private lazy var longLabel: UILabel = {
    let element = UILabel()
    element.font = UIFont.boldSystemFont(ofSize: 25)
    element.textColor = #colorLiteral(red: 0.5843137255, green: 0.6039215686, blue: 0.6, alpha: 1)
    element.textAlignment = .center
    element.text = "Split between 2 people, with 10% tip."
    element.numberOfLines = 0
    return element
  }()
  
  private lazy var numberLabel: UILabel = {
    let element = UILabel()
    element.font = UIFont.boldSystemFont(ofSize: 45)
    element.textColor = #colorLiteral(red: 0.0004900721833, green: 0.6912010908, blue: 0.4188455343, alpha: 1)
    element.textAlignment = .center
    element.text = "56.32"
    return element
  }()
  
  private lazy var totalLabel: UILabel = {
    let element = UILabel()
    element.text = "Total per person"
    element.textColor = #colorLiteral(red: 0.5843137255, green: 0.6039215686, blue: 0.6, alpha: 1)
    element.font = UIFont.systemFont(ofSize: 30)
    element.textAlignment = .center
    return element
  }()
  
  private lazy var colorView: UIView = {
    let element = UIView()
    element.backgroundColor = #colorLiteral(red: 0.7614529729, green: 0.879748404, blue: 0.8305820823, alpha: 1)
    return element
  }()
  
  //  MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstraints()
  }
}

//  MARK: -  Private Methods
extension ResultViewController {
  private func setViews() {
    view.addSubview(colorView)
    view.addSubview(longLabel)
    view.addSubview(recalculateButton)
    colorView.addSubview(totalLabel)
    colorView.addSubview(numberLabel)
  }
  
  private func setConstraints() {
    recalculateButton.snp.makeConstraints { make in
      make.bottom.equalTo(view.safeAreaLayoutGuide)
      make.width.greaterThanOrEqualTo(200)
      make.height.equalTo(54)
      make.centerX.equalTo(view.snp.centerX)
    }
    
    longLabel.snp.makeConstraints { make in
      make.top.equalTo(colorView.snp.bottom).inset(5)
      make.leading.trailing.equalToSuperview().inset(50)
      make.height.equalTo(117)
    }
    
    numberLabel.snp.makeConstraints { make in
      make.top.equalTo(totalLabel.snp.bottom)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(100)
    }
    
    totalLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(36)
    }
    
    colorView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
      make.height.equalTo(300)
    }
  }
}

//  MARK: - Show Canvas
struct SecondViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = ResultViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return ResultViewController()
  }
  
  func updateUIViewController(_ uiViewController: ResultViewController, context: Context) {}
}

struct SecondViewController_Previews: PreviewProvider {
  static var previews: some View {
    SecondViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
