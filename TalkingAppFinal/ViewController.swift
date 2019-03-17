//
//  ViewController.swift
//  TalkingAppFinal
//
//  Created by 帥氣阿剛 on 2019/3/17.
//  Copyright © 2019 帥氣阿剛. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //    讀取說話內容的元件和讀取slider目前的數值
    @IBOutlet weak var mySpeech: UITextField!
    
    @IBOutlet weak var speechRate: UISlider!
    @IBOutlet weak var speechPitch: UISlider!
    @IBOutlet weak var speechVolume: UISlider!
    
    //    顯示目前的slider數值到哪
    @IBOutlet weak var speechRateValue: UILabel!
    @IBOutlet weak var speechPitchValue: UILabel!
    @IBOutlet weak var speechVolumeValue: UILabel!
    
    //算是多拉了一個元件，其實可以共用MySpeech這個元件就好
    @IBOutlet weak var typingLetters: UITextField!
    //計算字數的lebel
    @IBOutlet weak var countingLetters: UILabel!
    
    //When Editing Changeed do(show how many lesster in textfield)
    @IBAction func ShowHowManyLetters(_ sender: UITextField) {
        countingLetters.text = String(typingLetters.text!.count)
    }
    
    //When Value Changer do(show what's the slider value now)
    @IBAction func ShowSliderValue(_ sender: UISlider) {
        speechRateValue.text = String(format: "%.2f", speechRate.value)
        speechPitchValue.text = String(format: "%.2f", speechPitch.value)
        speechVolumeValue.text = String(format: "%.2f", speechVolume.value)
    }    //將數字強制轉為字串，並且限定最多顯示到小數第二位

    
    @IBAction func TalkingButton(_ sender: UIButton) {
        let speech = AVSpeechUtterance(string: mySpeech.text!)
        //把mySpeech輸入的內容存到speech裡面
        speech.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        //用可讀取中文的方式來讀取speech內容
        speech.rate = speechRate.value
        speech.pitchMultiplier = speechPitch.value
        speech.volume = speechVolume.value
        
        let talk = AVSpeechSynthesizer()
        //讓talk成為一個講話的功能
            talk.speak(speech)
    }
}
