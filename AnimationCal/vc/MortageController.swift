//
//  MortageController.swift
//  AnimationCal
//
//  Created by Ogabek Mansurov on 6/17/23.
//

import UIKit

class MortageController: UIViewController {

    private let dismissBtn: UIButton = {
        let btn = UIButton(type: .system)
        
        btn.setImage(UIImage(named: "dismiss"), for: .normal)
        return btn
    }()
    
    var mortgage: Mortgage = Mortgage(loanAmount: 0.0, interest: 0.0, payment: 0.0, numberOfYears: 0.0)
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = self.view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 250)
    }
    
    
    private let MortgageValueText: UILabel =  {
        let label = UILabel()
        label.text = "Mortgage Value"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let MonthlyPaymentText: UILabel =  {
        let label = UILabel()
        label.text = "interest Rate"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let interestRateText: UILabel =  {
        let label = UILabel()
        label.text = "Monthly Payment"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let noOfYearsTimeText: UILabel =  {
        let label = UILabel()
        label.text = "No Of Years (Time)"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let MortgageValue = CustomTextField(fieldType: .mortgageValue, backgroundColor: UIColor(hexString: "00ff00"))
    private let interestRate = CustomTextField(fieldType: .interestRate, backgroundColor: UIColor(hexString: "00ff00"))
    private let MonthlyPayment = CustomTextField(fieldType: .MonthlyPayment, backgroundColor: UIColor(hexString: "00ff00"))
    private let noOfYearsTime = CustomTextField(fieldType: .noOfYearsTime, backgroundColor: UIColor(hexString: "00ff00"))
    
    private let calculateButton = CustomButton(title: "Calculate", fontSize: .calculate)
    private let clearButton = CustomButton(title: "Clear",hasBackground: false, fontSize: .clear)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
    
        
        self.loadDefaultsData("MortgageHistory")
        
        self.calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        self.clearButton.addTarget(self, action: #selector(clearB), for: .touchUpInside)
        self.setupUI()
    }
    func populateTextFields() {
        MortgageValue.text =  UserDefaults.standard.string(forKey: "mortgageloanAmountField")
        interestRate.text =  UserDefaults.standard.string(forKey: "mortgageinterestField")
        MonthlyPayment.text =  UserDefaults.standard.string(forKey: "mortgagepaymentField")
        noOfYearsTime.text =  UserDefaults.standard.string(forKey: "mortgagenumberOfYearsField")
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        mortgage.historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
       override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
       
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(MortgageValueText)
        self.contentView.addSubview(MortgageValue)
        self.contentView.addSubview(interestRateText)
        self.contentView.addSubview(interestRate)
        self.contentView.addSubview(MonthlyPaymentText)
        self.contentView.addSubview(MonthlyPayment)
        self.contentView.addSubview(noOfYearsTimeText)
        self.contentView.addSubview(noOfYearsTime)
        self.contentView.addSubview(calculateButton)
        self.contentView.addSubview(clearButton)
        
        contentView.addSubview(dismissBtn)
        dismissBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        MortgageValueText.translatesAutoresizingMaskIntoConstraints = false
        MortgageValue.translatesAutoresizingMaskIntoConstraints = false
        interestRate.translatesAutoresizingMaskIntoConstraints = false
        MonthlyPayment.translatesAutoresizingMaskIntoConstraints = false
        noOfYearsTime.translatesAutoresizingMaskIntoConstraints = false
        interestRateText.translatesAutoresizingMaskIntoConstraints = false
        MonthlyPaymentText.translatesAutoresizingMaskIntoConstraints = false
        noOfYearsTimeText.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            self.scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            self.contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalToConstant: 500),
            
            
            self.MortgageValueText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            self.MortgageValueText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.MortgageValueText.heightAnchor.constraint(equalToConstant: 55),
            self.MortgageValueText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.MortgageValue.topAnchor.constraint(equalTo: MortgageValueText.bottomAnchor, constant: 6),
            self.MortgageValue.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.MortgageValue.heightAnchor.constraint(equalToConstant: 55),
            self.MortgageValue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.interestRateText.topAnchor.constraint(equalTo: MortgageValue.bottomAnchor, constant: 12),
            self.interestRateText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.interestRateText.heightAnchor.constraint(equalToConstant: 55),
            self.interestRateText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.interestRate.topAnchor.constraint(equalTo: interestRateText.bottomAnchor, constant: 6),
            self.interestRate.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.interestRate.heightAnchor.constraint(equalToConstant: 55),
            self.interestRate.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.MonthlyPaymentText.topAnchor.constraint(equalTo: interestRate.bottomAnchor, constant: 12),
            self.MonthlyPaymentText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.MonthlyPaymentText.heightAnchor.constraint(equalToConstant: 55),
            self.MonthlyPaymentText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.MonthlyPayment.topAnchor.constraint(equalTo: MonthlyPaymentText.bottomAnchor, constant: 6),
            self.MonthlyPayment.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.MonthlyPayment.heightAnchor.constraint(equalToConstant: 55),
            self.MonthlyPayment.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.noOfYearsTimeText.topAnchor.constraint(equalTo: MonthlyPayment.bottomAnchor, constant: 12),
            self.noOfYearsTimeText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.noOfYearsTimeText.heightAnchor.constraint(equalToConstant: 55),
            self.noOfYearsTimeText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.noOfYearsTime.topAnchor.constraint(equalTo: noOfYearsTimeText.bottomAnchor, constant: 6),
            self.noOfYearsTime.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.noOfYearsTime.heightAnchor.constraint(equalToConstant: 55),
            self.noOfYearsTime.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.calculateButton.topAnchor.constraint(equalTo: noOfYearsTime.bottomAnchor, constant: 32),
            self.calculateButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.calculateButton.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.width / 2),
            self.calculateButton.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.width / 5),
            
            self.clearButton.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 22),
            self.clearButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.clearButton.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.width / 2),
            self.clearButton.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.width / 5),
            
            
            self.dismissBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            self.dismissBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -6),
            self.dismissBtn.heightAnchor.constraint(equalToConstant: view.frame.size.width/10),
            self.dismissBtn.widthAnchor.constraint(equalToConstant: view.frame.size.width/10),
            ])
        
        dismissBtn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        
        
        
    }
    @objc private func calculate() {
        
        
        if MortgageValue.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && MonthlyPayment.checkIfEmpty() == false && noOfYearsTime.checkIfEmpty() == true{
            
            
            mortgage.loanAmount = Double(MortgageValue.text!)!
            mortgage.interest = Double(interestRate.text!)!
            mortgage.payment = Double(MonthlyPayment.text!)!
            
            noOfYearsTime.text = String(mortgage.calculateNumberOfYears())
            
        } else if MortgageValue.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && noOfYearsTime.checkIfEmpty() == false && MonthlyPayment.checkIfEmpty() == true{
            
            
            mortgage.loanAmount = Double(MortgageValue.text!)!
            mortgage.interest = Double(interestRate.text!)!
            mortgage.numberOfYears = Double(noOfYearsTime.text!)!
            
            MonthlyPayment.text = String(mortgage.calculateMonthlyPayment())
            
        } else if MortgageValue.checkIfEmpty() == true && interestRate.checkIfEmpty() == false && noOfYearsTime.checkIfEmpty() == false && MonthlyPayment.checkIfEmpty() == false{
            
            
            mortgage.numberOfYears = Double(noOfYearsTime.text!)!
            mortgage.interest = Double(interestRate.text!)!
            mortgage.payment = Double(MonthlyPayment.text!)!
            
            MortgageValue.text = String(mortgage.calculateLoanAmount())
            
        } else if MortgageValue.checkIfEmpty() == false && interestRate.checkIfEmpty() == true && noOfYearsTime.checkIfEmpty() == false && MonthlyPayment.checkIfEmpty() == false{
            
            
            mortgage.loanAmount = Double(MortgageValue.text!)!
            mortgage.numberOfYears = Double(noOfYearsTime.text!)!
            mortgage.payment = Double(MonthlyPayment.text!)!
            
            interestRate.text = String(mortgage.calculateAnnualInterestRate())
            
            
        } else {
            showAlert(title: "Error", msg: "Invalid Operation")
        }
        
    }
    
    @objc private func clearB() {
        showAlert(title: "Clear", msg: "Numbers in all rows deleted")
        
        MortgageValue.text = ""
        interestRate.text = ""
        MonthlyPayment.text = ""
        noOfYearsTime.text = ""
    }
    
    
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    


}
