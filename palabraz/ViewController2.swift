//
//  ViewController2.swift
//  palabraz
//
//  Created by Dharwin Aaron Perez Rodriguez on 12/8/14.
//  Copyright (c) 2014 Dharwin Aaron Perez Rodriguez. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var res1: UIButton!
    @IBOutlet weak var res2: UIButton!
    @IBOutlet weak var Nintento: UIButton!
    
    var respuesta : String = ""
    var contador : Int = 0
    
    internal struct Palabras{
        static let palabra = [
            "Valora_le",
            "_aliente",
            "_ariable",
            "_anidad",
            "_ándalo",
            "_erde",
            "Vál_ula",
            "_alón",
            "_olso",
            "Ár_ol",
            "_ufanda",
            "_eneficiencia",
            "_rindar"
        ]
        
        static let respuestas = [
            "B",
            "V",
            "V",
            "V",
            "V",
            "V",
            "v",
            "B",
            "B",
            "B",
            "B",
            "B",
            "B",
        ]
        
    }
    
    internal func palabra(){
        let randomIndex = Int(arc4random_uniform(UInt32(Palabras.palabra.count)))
        
        self.messageLabel.text=Palabras.palabra[randomIndex]
        
        self.respuesta = Palabras.respuestas[randomIndex]
        
    }
    
    internal func resButton(){
        
        var mala: String = ""
        let decideR = Int(arc4random_uniform(1))
        
        if (self.respuesta == "B"){
            mala = "V"
        }
        else{
            mala = "B"
        }
        
        
        if (decideR == 0){
        
            res1.setTitle(self.respuesta, forState: UIControlState.Normal)
            
            res2.setTitle(mala, forState: UIControlState.Normal)
        }
        else{
            res1.setTitle(mala, forState: UIControlState.Normal)
            
            res2.setTitle(self.respuesta, forState: UIControlState.Normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        palabra()
        resButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1(sender: AnyObject) {
        
        if ( self.respuesta == self.res1.titleLabel?.text ){
            
            self.contador += 1

            palabra()
            resButton()
            
        }
        else{
            self.messageLabel.text = "Obtuviste "+String(self.contador) + " aciertos"
            self.res1.hidden = true
            self.res2.hidden = true
            self.Nintento.hidden = false
        }
        
    }

    @IBAction func button2(sender: AnyObject) {
        
        if ( self.respuesta == self.res2.titleLabel?.text ){
            self.contador += 1
            palabra()
            resButton()
        }
        else{
            self.messageLabel.text = "Obtuviste "+String(self.contador) + " aciertos"
            self.res1.hidden = true
            self.res2.hidden = true
            self.Nintento.hidden = false
        }
        
    }
    
    @IBAction func button3(sender: AnyObject) {
        self.contador = 0
        self.res1.hidden = false
        self.res2.hidden = false
        self.Nintento.hidden = true
        palabra()
        resButton()
        
    }
}
