//
//  HomeViewController.swift
//  MinCostCalc
//
//  Created by Divya Tatavarthi on 2/22/17.
//  Copyright © 2017 Aparna Revu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var resultLabel:UILabel?
    @IBOutlet weak var titleLabel:UILabel?
    @IBOutlet weak var segmentControl:UISegmentedControl?
    //Initial cost array
    var cost:[[Int]] = [[3,6,5,8,3],[4,1,9,4,7],[1,8,3,1,2],[2,2,9,3,8],[8,7,9,2,6],[6,4,5,6,4]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl?.selectedSegmentIndex = 0
        getLowCost(self.segmentControl!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ACTION METHODS
    //Action method to identify the low cost vlaue
    @IBAction func getLowCost(_ sender: UISegmentedControl) {

        if(self.segmentControl?.selectedSegmentIndex == 0){
            cost = [[3,6,5,8,3],[4,1,9,4,7],[1,8,3,1,2],[2,2,9,3,8],[8,7,9,2,6],[6,4,5,6,4]]
        }else if(segmentControl?.selectedSegmentIndex == 1){
             cost = [[3,6,5,8,3],[4,1,9,4,7],[1,8,3,1,2],[2,2,9,3,1],[8,7,9,2,2],[6,4,5,6,3]]
        }else{
            cost = [[19,21,20],[10,23,12],[19,20,20],[10,19,11],[19,12,10]]
        }
        print("Answer: ", minCost(arrayList: cost, m: (cost.count) - 1, n: (cost[0].count) - 1));

        updateLabelWithData()
        self.resultLabel?.text = "Low Cost:" + String(minCost(arrayList: cost, m: (cost.count) - 1, n: (cost[0].count) - 1))
    }
    
    // MARK: UTILITY METHODS
    //To check the minimum value
    func checkMin(x:Int, y:Int, z:Int) -> Int {
        if (x < y){
            return (x < z) ? x : z
        }else {
            return (y < z) ? y : z
        }
    }
    
    //To updating the Question Label
    func updateLabelWithData()  {

        var matrixStr = ""
        for  (_,element) in cost.enumerated() {
            matrixStr = "\(matrixStr)\n\(element)"
        }
        self.titleLabel?.text = matrixStr
    }
    
    //To find the Minimum Cost value
    func minCost(arrayList:[[Int]] , m:Int , n:Int) -> Int {
        
        //Check - If there is no data or negitive value
        if (n < 0 || m < 0){
            return Int(INT_MAX);
        }
        else if (m == 0 && n == 0) //Check- If 1 Row and 1 Column value
        {
            return arrayList[m][n]
        }
        else {
            
            //Adding the corresponding row and column to the minimum value
            let x = minCost(arrayList: arrayList, m: m-1, n: n-1)
            let y = minCost(arrayList: arrayList, m: m-1, n: n)
            let z = minCost(arrayList: arrayList, m: m, n: n-1)

            let minVal =  checkMin( x: x,
                                    y: y,
                                    z: z);

            let finalVal = arrayList[m][n] + minVal

            return finalVal
        }
    }
    

}
