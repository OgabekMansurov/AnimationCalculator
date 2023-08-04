//
//  SavingController.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//

import UIKit

class SavingController: UIViewController {

    
    let switchOnandof = UISwitch()
    let label = UILabel()
    
    private let dismissBtn: UIButton = {
        let btn = UIButton(type: .system)
        
        btn.setImage(UIImage(named: "dismiss"), for: .normal)
        return btn
    }()
    
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
        CGSize(width: view.frame.width, height: view.frame.width * 4)
    }
    
    var savings: Savings = Savings(principalAmount: 0.0, interest: 0.0, payment: 0.0, compoundsPerYear: 12, paymentsPerYear: 12, futureValue: 0.0, totalNumberOfPayments: Int(0.0))
    
    
    private let principalAmount = CustomTextField(fieldType: .PrincipalAmount, backgroundColor: UIColor(hexString: "0000FF"))
    private let interestRate = CustomTextField(fieldType: .interestRate, backgroundColor: UIColor(hexString: "0000FF"))
    private let deposit = CustomTextField(fieldType: .deposit, backgroundColor: UIColor(hexString: "0000FF"))
    private let NoOfCompound = CustomTextField(fieldType: .NoOfCompound, backgroundColor: UIColor(hexString: "0000FF"))
    private let NoOfDeposits = CustomTextField(fieldType: .NoOfDeposits, backgroundColor: UIColor(hexString: "0000FF"))
    private let futureValue = CustomTextField(fieldType: .futureValue, backgroundColor: UIColor(hexString: "0000FF"))
    private let totalNoDeposit = CustomTextField(fieldType: .totalNoDeposit, backgroundColor: UIColor(hexString: "0000FF"))
    
    
    private let calculateButton = CustomButton(title: "Calculate", fontSize: .calculate)
    private let clearButton = CustomButton(title: "Clear",hasBackground: false, fontSize: .clear)
    
    private let depositmadeat: UILabel =  {
        let label = UILabel()
        label.text = "Deposits made at the:"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let principalAmountText: UILabel =  {
        let label = UILabel()
        label.text = "Principal Amount"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let interestRateText: UILabel =  {
        let label = UILabel()
        label.text = "Interest Rate"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let depositText: UILabel =  {
        let label = UILabel()
        label.text = "Deposit"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let NoOfCompoundText: UILabel =  {
        let label = UILabel()
        label.text = "No Of Compound Per Year (12/year)"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let NoOfDepositsText: UILabel =  {
        let label = UILabel()
        label.text = "No Of Deposits Per Year (12/year)"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let futureValueText: UILabel =  {
        let label = UILabel()
        label.text = "FutureValue"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let totalNoDepositText: UILabel =  {
        let label = UILabel()
        label.text = "Total No of Deposit"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hexString: "#0000FF")

        self.calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        self.clearButton.addTarget(self, action: #selector(clearB), for: .touchUpInside)
        
        
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .right
        
        
        
        self.setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    private func setupUI() {
        view.backgroundColor = .white
        
        switchOnandof.setOn(false, animated: true)
        switchOnandof.addTarget(self, action: #selector(updateSwitch), for:.valueChanged)
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(principalAmount)
        self.contentView.addSubview(interestRate)
        self.contentView.addSubview(deposit)
        self.contentView.addSubview(NoOfCompound)
        self.contentView.addSubview(NoOfDeposits)
        self.contentView.addSubview(futureValue)
        self.contentView.addSubview(totalNoDeposit)
        
        contentView.addSubview(dismissBtn)
        dismissBtn.translatesAutoresizingMaskIntoConstraints = false

        principalAmount.translatesAutoresizingMaskIntoConstraints = false
        interestRate.translatesAutoresizingMaskIntoConstraints = false
        deposit.translatesAutoresizingMaskIntoConstraints = false
        NoOfCompound.translatesAutoresizingMaskIntoConstraints = false
        NoOfDeposits.translatesAutoresizingMaskIntoConstraints = false
        futureValue.translatesAutoresizingMaskIntoConstraints = false
        totalNoDeposit.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(principalAmountText)
        self.contentView.addSubview(interestRateText)
        self.contentView.addSubview(depositText)
        self.contentView.addSubview(NoOfCompoundText)
        self.contentView.addSubview(NoOfDepositsText)
        self.contentView.addSubview(futureValueText)
        self.contentView.addSubview(totalNoDepositText)
        self.contentView.addSubview(depositmadeat)
        self.contentView.addSubview(switchOnandof)
        self.contentView.addSubview(label)
        self.contentView.addSubview(calculateButton)
        self.contentView.addSubview(clearButton)

        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        principalAmountText.translatesAutoresizingMaskIntoConstraints = false
        interestRateText.translatesAutoresizingMaskIntoConstraints = false
        depositText.translatesAutoresizingMaskIntoConstraints = false
        NoOfCompoundText.translatesAutoresizingMaskIntoConstraints = false
        NoOfDepositsText.translatesAutoresizingMaskIntoConstraints = false
        futureValueText.translatesAutoresizingMaskIntoConstraints = false
        totalNoDepositText.translatesAutoresizingMaskIntoConstraints = false
        depositmadeat.translatesAutoresizingMaskIntoConstraints = false
        switchOnandof.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            
            self.principalAmountText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            self.principalAmountText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.principalAmountText.heightAnchor.constraint(equalToConstant: 55),
            self.principalAmountText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.principalAmount.topAnchor.constraint(equalTo: principalAmountText.bottomAnchor, constant: 6),
            self.principalAmount.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.principalAmount.heightAnchor.constraint(equalToConstant: 55),
            self.principalAmount.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.interestRateText.topAnchor.constraint(equalTo: principalAmount.bottomAnchor, constant: 8),
            self.interestRateText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.interestRateText.heightAnchor.constraint(equalToConstant: 55),
            self.interestRateText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.interestRate.topAnchor.constraint(equalTo: interestRateText.bottomAnchor, constant: 6),
            self.interestRate.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.interestRate.heightAnchor.constraint(equalToConstant: 55),
            self.interestRate.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.depositText.topAnchor.constraint(equalTo: interestRate.bottomAnchor, constant: 8),
            self.depositText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.depositText.heightAnchor.constraint(equalToConstant: 55),
            self.depositText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.deposit.topAnchor.constraint(equalTo: depositText.bottomAnchor, constant: 6),
            self.deposit.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.deposit.heightAnchor.constraint(equalToConstant: 55),
            self.deposit.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.NoOfCompoundText.topAnchor.constraint(equalTo: deposit.bottomAnchor, constant: 8),
            self.NoOfCompoundText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.NoOfCompoundText.heightAnchor.constraint(equalToConstant: 55),
            self.NoOfCompoundText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.NoOfCompound.topAnchor.constraint(equalTo: NoOfCompoundText.bottomAnchor, constant: 6),
            self.NoOfCompound.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.NoOfCompound.heightAnchor.constraint(equalToConstant: 55),
            self.NoOfCompound.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.NoOfDepositsText.topAnchor.constraint(equalTo: NoOfCompound.bottomAnchor, constant: 8),
            self.NoOfDepositsText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.NoOfDepositsText.heightAnchor.constraint(equalToConstant: 55),
            self.NoOfDepositsText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.NoOfDeposits.topAnchor.constraint(equalTo: NoOfDepositsText.bottomAnchor, constant: 6),
            self.NoOfDeposits.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.NoOfDeposits.heightAnchor.constraint(equalToConstant: 55),
            self.NoOfDeposits.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.futureValueText.topAnchor.constraint(equalTo: NoOfDeposits.bottomAnchor, constant: 8),
            self.futureValueText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.futureValueText.heightAnchor.constraint(equalToConstant: 55),
            self.futureValueText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.futureValue.topAnchor.constraint(equalTo: futureValueText.bottomAnchor, constant: 6),
            self.futureValue.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.futureValue.heightAnchor.constraint(equalToConstant: 55),
            self.futureValue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.totalNoDepositText.topAnchor.constraint(equalTo: futureValue.bottomAnchor, constant: 8),
            self.totalNoDepositText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.totalNoDepositText.heightAnchor.constraint(equalToConstant: 55),
            self.totalNoDepositText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.totalNoDeposit.topAnchor.constraint(equalTo: totalNoDepositText.bottomAnchor, constant: 6),
            self.totalNoDeposit.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.totalNoDeposit.heightAnchor.constraint(equalToConstant: 55),
            self.totalNoDeposit.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.depositmadeat.topAnchor.constraint(equalTo: totalNoDeposit.bottomAnchor, constant: 8),
            self.depositmadeat.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            self.depositmadeat.heightAnchor.constraint(equalToConstant: 55),
            self.depositmadeat.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            switchOnandof.topAnchor.constraint(equalTo: totalNoDeposit.bottomAnchor, constant: 18),
            switchOnandof.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            
            label.topAnchor.constraint(equalTo: totalNoDeposit.bottomAnchor, constant: 18),
            label.rightAnchor.constraint(equalTo: switchOnandof.leftAnchor, constant: -15),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 100),
            
            self.calculateButton.topAnchor.constraint(equalTo: depositmadeat.bottomAnchor, constant: 32),
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
        
        NoOfCompound.text = "12"
        NoOfDeposits.text = "12"
        

        
//        let deposit = "futureValue"
        if(label.text) == "End" {
            
            if principalAmount.checkIfEmpty() == true && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == false {
                
                savings.interest = Double(interestRate.text!)!
                savings.futureValue = Double(futureValue.text!)!
                savings.payment = Double(deposit.text!)!
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                
                principalAmount.text = String(savings.calculateEndPrincipalAmount())
                
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == true && totalNoDeposit.checkIfEmpty() == false {
                
                savings.interest = Double(interestRate.text!)!
                savings.futureValue = Double(futureValue.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                
                deposit.text = String(savings.calculateEndPayment())
                
            
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == true && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == false {
                
                savings.interest = Double(interestRate.text!)!
                savings.payment = Double(deposit.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                
                futureValue.text = String(savings.calculateEndFutureValue())
                
            
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == true {
                
                savings.interest = Double(interestRate.text!)!
                savings.payment = Double(deposit.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.futureValue = Double(futureValue.text!)!
                
                totalNoDeposit.text = String(savings.calculateEndNumberOfPayments())
                
            
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == true && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == false {
                
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                savings.payment = Double(deposit.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.futureValue = Double(futureValue.text!)!
                
                interestRate.text = String(savings.calculateInterest())
                
            
            } else {
                showAlert(title: "Error", msg: "Invalid Operation")
                
            }
            
        } else {
            
            if principalAmount.checkIfEmpty() == true && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == false {
                
                savings.interest = Double(interestRate.text!)!
                savings.futureValue = Double(futureValue.text!)!
                savings.payment = Double(deposit.text!)!
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                
                principalAmount.text = String(savings.calculateBeginningPrincipalAmount())
                
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == true && totalNoDeposit.checkIfEmpty() == false {
                
                savings.interest = Double(interestRate.text!)!
                savings.futureValue = Double(futureValue.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                
                deposit.text = String(savings.calculateBeginningPayment())
                
                
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == true && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == false {
                
                savings.interest = Double(interestRate.text!)!
                savings.payment = Double(deposit.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                
                futureValue.text = String(savings.calculateBeginningFutureValue())
                
                
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == false && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == true {
                
                savings.interest = Double(interestRate.text!)!
                savings.payment = Double(deposit.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.futureValue = Double(futureValue.text!)!
                
                totalNoDeposit.text = String(savings.calculateBeginningNumberOfPayments())
                
                
            } else if principalAmount.checkIfEmpty() == false && interestRate.checkIfEmpty() == true && futureValue.checkIfEmpty() == false && deposit.checkIfEmpty() == false && totalNoDeposit.checkIfEmpty() == false {
                
                savings.totalNumberOfPayments = Int(Double(totalNoDeposit.text!)!)
                savings.payment = Double(deposit.text!)!
                savings.principalAmount = Double(principalAmount.text!)!
                savings.futureValue = Double(futureValue.text!)!
                
                interestRate.text = String(savings.calculateInterest())
                
                
            } else {
                showAlert(title: "Error", msg: "Invalid Operation")
                
            }
        }
        
    }
    @objc private func clearB() {
        
        showAlert(title: "Clear", msg: "Numbers in all rows deleted")
        
        principalAmount.text = ""
        interestRate.text = ""
        deposit.text = ""
        NoOfCompound.text = "12"
        NoOfDeposits.text = "12"
        futureValue.text = ""
        totalNoDeposit.text = ""
        
        
       
    }
    @objc func updateSwitch () {
        label.text = switchOnandof .isOn ? "End" : "Beginning"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .right
    }
    
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
