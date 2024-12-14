//
//  ShowViewController.swift
//  App3
//
//  Created by Srinivasa Sameer Addepalli on 9/23/24.
//

import UIKit

class ShowViewController: UIViewController {

    var messageFromFirstScreen: String? = "No Message received!"
    var delegate: ViewController!
    let moods: [String] = ["Happy", "Meh", "Sad"]
    
    var selectedMood = "Happy"
    
    var labelMessage: UILabel!
    var labelMoodInstructions: UILabel!
    var moodPicker: UIPickerView!
    var buttonSendMood: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
        setupLabelMessage()
        setupLabelMoodInstructions()
        setupMoodPicker()
        setupButtonSendMood()
        
        initConstraints()
        
        buttonSendMood.addTarget(self, action: #selector(onButtonSendMoodClicked), for: .touchUpInside)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupLabelMessage() {
        labelMessage = UILabel()
        labelMessage.textColor = .systemBlue
        labelMessage.text = messageFromFirstScreen
        labelMessage.font = .systemFont(ofSize: .init(30))
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelMessage)
    }
    
    func setupLabelMoodInstructions() {
        labelMoodInstructions = UILabel()
        labelMoodInstructions.text = "How are you feeling today?"
        labelMoodInstructions.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelMoodInstructions)
    }
    
    func setupMoodPicker() {
        moodPicker = UIPickerView()
        moodPicker.isUserInteractionEnabled = true
        moodPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moodPicker)
        
        moodPicker.delegate = self
        moodPicker.dataSource = self
    }
    
    func setupButtonSendMood() {
        buttonSendMood = UIButton(type: .system)
        buttonSendMood.setTitle("Send Mood back!", for: .normal)
        buttonSendMood.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSendMood)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelMessage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelMessage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            labelMoodInstructions.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelMoodInstructions.topAnchor.constraint(equalTo: labelMessage.bottomAnchor, constant: 16),
            
            moodPicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            moodPicker.topAnchor.constraint(equalTo: labelMoodInstructions.bottomAnchor, constant: 16),
            
            buttonSendMood.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonSendMood.topAnchor.constraint(equalTo: moodPicker.bottomAnchor, constant: 16)
        ])
    }
    
    @objc func onButtonSendMoodClicked(){
        delegate.delegateButtonSendMood(mood: selectedMood)
        navigationController?.popViewController(animated: true)
    }

}

extension ShowViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedMood = moods[row]
        return moods[row]
    }
}
