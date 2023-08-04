//
//  ViewController.swift
//  AnimationCal
//
//  Created by Ogabek Mansurov on 6/17/23.
//

import UIKit

class HomeController: UIViewController, UIViewControllerTransitioningDelegate  {
    @IBOutlet weak var mortageButton: UIButton!
    
    @IBOutlet weak var loansButton: UIButton!
    
    @IBOutlet weak var savingButton: UIButton!
    
    @IBOutlet weak var compoundSavingButton: UIButton!
    
    private let imgView: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "backgroundLight")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    var imgFalse: Bool = false

    private let motageView = CustumView(hasbackgroundColor: .white, borderColor: UIColor(hexString: "#00ff00"), borderWidth: 1.5)
    private let loansView = CustumView(hasbackgroundColor: .white, borderColor: UIColor(hexString: "#D2691E"), borderWidth: 1.5)
    private let savingView = CustumView(hasbackgroundColor: .white, borderColor: UIColor(hexString: "#0000FF"), borderWidth: 1.5)
    private let compoundSavingView = CustumView(hasbackgroundColor: .white, borderColor: UIColor(hexString: "#FF0000"), borderWidth: 1.5)

    var transition:Transitions = .none
    enum Transitions{
        case mortage
        case loans
        case saving
        case compoundSaving
        case none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Mode", style: .done, target: self, action: #selector(rightButtunDid))
        setupUI()
    }
   
    
    private func setupUI() {
        
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(motageView)
        view.addSubview(mortageButton)
        mortageButton.translatesAutoresizingMaskIntoConstraints =  false
        mortageButton.layer.cornerRadius = (view.frame.size.width/2.3 - 20)/2
        mortageButton.tintColor = .white
        mortageButton.setTitle("Mortage", for: .normal)
        mortageButton.backgroundColor = UIColor(hexString: "#32cd32")
        motageView.layer.cornerRadius = view.frame.size.width/4.6
        motageView.layer.masksToBounds = true
        mortageButton.layer.masksToBounds = true
        motageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(loansView)
        view.addSubview(loansButton)
        loansButton.translatesAutoresizingMaskIntoConstraints =  false
        loansButton.layer.cornerRadius = (view.frame.size.width/2.3 - 20)/2
        loansButton.tintColor = .white
        loansButton.backgroundColor = UIColor(hexString: "#D2691E")
        loansButton.setTitle("Loans", for: .normal)
        loansView.layer.cornerRadius = view.frame.size.width/4.6
        loansView.layer.masksToBounds = true
        loansButton.layer.masksToBounds = true
        loansView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(savingView)
        view.addSubview(savingButton)
        savingButton.translatesAutoresizingMaskIntoConstraints =  false
        savingButton.layer.cornerRadius = (view.frame.size.width/2.3 - 20)/2
        savingButton.tintColor = .white
        savingButton.setTitle("Saving", for: .normal)
        savingButton.backgroundColor = UIColor(hexString: "#0000FF")
        savingView.layer.cornerRadius = view.frame.size.width/4.6
        savingView.layer.masksToBounds = true
        savingButton.layer.masksToBounds = true
        savingView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(compoundSavingView)
        view.addSubview(compoundSavingButton)
        compoundSavingButton.translatesAutoresizingMaskIntoConstraints =  false
        compoundSavingButton.layer.cornerRadius = (view.frame.size.width/2.3 - 20)/2
        compoundSavingButton.tintColor = .white
        compoundSavingButton.setTitle("Compoun\nSaving", for: .normal)
        compoundSavingButton.titleLabel?.numberOfLines = 2
        compoundSavingButton.titleLabel?.textAlignment = .center
        compoundSavingButton.backgroundColor = UIColor(hexString: "#FF0000")
        compoundSavingView.layer.cornerRadius = view.frame.size.width/4.6
        compoundSavingView.layer.masksToBounds = true
        compoundSavingButton.layer.masksToBounds = true
        compoundSavingView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        NSLayoutConstraint.activate([
        
            imgView.topAnchor.constraint(equalTo: view.topAnchor),
            imgView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imgView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imgView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            motageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            motageView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            motageView.heightAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            motageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            
            mortageButton.topAnchor.constraint(equalTo: motageView.safeAreaLayoutGuide.topAnchor, constant: 10),
            mortageButton.leftAnchor.constraint(equalTo: motageView.safeAreaLayoutGuide.leftAnchor, constant: 10),
            mortageButton.rightAnchor.constraint(equalTo: motageView.safeAreaLayoutGuide.rightAnchor, constant: -10),
            mortageButton.bottomAnchor.constraint(equalTo: motageView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            loansView.topAnchor.constraint(equalTo: motageView.bottomAnchor, constant: -15),
            loansView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            loansView.heightAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            loansView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            
            loansButton.topAnchor.constraint(equalTo: loansView.safeAreaLayoutGuide.topAnchor, constant: 10),
            loansButton.leftAnchor.constraint(equalTo: loansView.safeAreaLayoutGuide.leftAnchor, constant: 10),
            loansButton.rightAnchor.constraint(equalTo: loansView.safeAreaLayoutGuide.rightAnchor, constant: -10),
            loansButton.bottomAnchor.constraint(equalTo: loansView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            savingView.topAnchor.constraint(equalTo: loansView.bottomAnchor, constant: -15),
            savingView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            savingView.heightAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            savingView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            
            savingButton.topAnchor.constraint(equalTo: savingView.safeAreaLayoutGuide.topAnchor, constant: 10),
            savingButton.leftAnchor.constraint(equalTo: savingView.safeAreaLayoutGuide.leftAnchor, constant: 10),
            savingButton.rightAnchor.constraint(equalTo: savingView.safeAreaLayoutGuide.rightAnchor, constant: -10),
            savingButton.bottomAnchor.constraint(equalTo: savingView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            
            compoundSavingView.topAnchor.constraint(equalTo: savingView.bottomAnchor, constant: -15),
            compoundSavingView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            compoundSavingView.heightAnchor.constraint(equalToConstant: view.frame.size.width/2.3),
            compoundSavingView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            
            compoundSavingButton.topAnchor.constraint(equalTo: compoundSavingView.safeAreaLayoutGuide.topAnchor, constant: 10),
            compoundSavingButton.leftAnchor.constraint(equalTo: compoundSavingView.safeAreaLayoutGuide.leftAnchor, constant: 10),
            compoundSavingButton.rightAnchor.constraint(equalTo: compoundSavingView.safeAreaLayoutGuide.rightAnchor, constant: -10),
            compoundSavingButton.bottomAnchor.constraint(equalTo: compoundSavingView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
        ])
    }
    
    @objc func rightButtunDid() {
        print("rightButtunDid")
        if imgFalse == false {
            imgView.image = UIImage(named: "backgroundDark")
            imgFalse = true
            motageView.backgroundColor = .clear
            loansView.backgroundColor = .clear
            savingView.backgroundColor = .clear
            compoundSavingView.backgroundColor = .clear
        }else{
            imgView.image = UIImage(named: "backgroundLight")
            imgFalse = false
            motageView.backgroundColor = .white
            loansView.backgroundColor = .white
            savingView.backgroundColor = .white
            compoundSavingView.backgroundColor = .white
        }
    }
    
    @IBAction func buttonDidPres(_ sender: Any) {
        self.performSegue(withIdentifier: "MortagePresent", sender: nil)
        self.performSegue(withIdentifier: "LoansPresent", sender: nil)
        self.performSegue(withIdentifier: "compoundSaving", sender: nil)
        self.performSegue(withIdentifier: "SavingPresitation", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        viewController.transitioningDelegate = self
        if viewController is MortageController {
            transition = .mortage
        } else if viewController is LoansController {
            transition = .loans
        } else if viewController is SavingController {
            transition = .saving
        } else if viewController is CompoundSavingController {
            transition = .compoundSaving
        } else {
            transition = .none
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors =
        [UIColor(hexString: "#32cd32"), UIColor(hexString: "#D2691E"),UIColor(hexString: "#0000FF"), UIColor(hexString: "#FF0000")]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        view.layer.addSublayer(gradientLayer)
            
        
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let button:UIButton
        switch transition {
        case .mortage:
            button = mortageButton
        case .loans:
            button = loansButton
        case .saving:
            button = savingButton
        case .compoundSaving:
            button = compoundSavingButton
        case .none:
            return nil
        }

        return CircleTransitionAnimator(presentationStartButton: button, isPresenting: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
            UIView.animate(withDuration: 1.5) {
               
                self.mortageButton.frame.size.width += self.view.frame.size.width
                self.motageView.frame.size.width -= self.view.frame.size.width
                
                self.loansButton.frame.size.width -= self.view.frame.size.width
                self.loansView.frame.size.width += self.view.frame.size.width
                
                self.compoundSavingButton.frame.size.width += self.view.frame.size.width
                self.compoundSavingView.frame.size.width += self.view.frame.size.width
                
                self.savingButton.frame.size.width -= self.view.frame.size.width
                self.savingView.frame.size.width -= self.view.frame.size.width

                
            
            }
            
            UIView.transition(with: self.mortageButton, duration: 2.5, options: [.repeat, .curveEaseOut]) {
                
            } completion: { (_) in
               
            }
        }

    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let button:UIButton
        switch transition {
        case .mortage:
            button = mortageButton
        case .loans:
            button = loansButton
        case .saving:
            button = savingButton
        case .compoundSaving:
            button = compoundSavingButton
        case .none:
            return nil
        }
        return CircleTransitionAnimator(presentationStartButton: button, isPresenting: false)
    }
    
}

