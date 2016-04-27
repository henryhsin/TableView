//
//  AnimalTableViewController.swift
//  HelloTableView
//
//  Created by 辛忠翰 on 2016/3/23.
//  Copyright © 2016年 Hsinhan. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {//因為直接用tableViewController，所以直接是UITableViewController的子類別，所以delegate與datasource都已經幫我們連好了，這邊就不用再打了
    let annimalArray:[String] = ["cat", "chicken", "dog", "elephant", "fox", "goat", "kangaroo", "monkey", "mouse", "penguin", "rabbit", "snail"]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return annimalArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        /*cell.textLabel?.text = annimalArray[indexPath.row]
        cell.imageView?.image = UIImage(named: annimalArray[indexPath.row])//便可依序從assets資料夾拿到名為cat、chicken、dog...等小縮圖
        cell.accessoryType = .DisclosureIndicator//可在最右邊新增小箭頭的圖示*/
        
        let cellImageView = cell.contentView.subviews[0] as! UIImageView//cell.contentView.subviews[0]實為imageView，所以把抓到的subView轉型成為UIImageView
        let cellText = cell.contentView.subviews[1] as! UILabel//cell.contentView.subviews[1]實為label，所以把抓到的subView轉型成為UILabel
        cellImageView.image = UIImage(named: annimalArray[indexPath.row])
        cellText.text = " " + annimalArray[indexPath.row] + " "//加上空格可以使文字黎左右邊都有一點距離
        return cell
    }
    
    override func viewDidLoad() {
        /*self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)//這段程式碼會讓整個tableView往下移動20(為了不要被上方的status bar擋住)*/
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {//判斷使用者按下了哪一列，便會觸發這裡的func
        self.performSegueWithIdentifier("showDetail" , sender: indexPath.row)//sender可以把這個func中選到的row傳出去，供下面的func prepareForSegue使用(其中indexPath.row便可知道user選到哪一列)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {//這個func()說在轉場之前應該要做些什麼事
        let vc = segue.destinationViewController//抓到轉場後的viewController
        let bigImageView = vc.view.subviews[0] as! UIImageView//回到mainStoryBoard可以發現image view為view的第一個subview(順序就只是看它左邊的排列順序而已，例如lable、button都算subview，看排列的順序決定會是第幾個subview)，再去把這個subView轉型成UIImageView(用as!)，所以這行程式碼即為抓到轉場後的view中的UIImageView
        //這邊的sender便可收到上一個func中的sender傳出的indexPath.row，但因為這邊的sender的型別為AnyObject，所以需轉型成整數
        let selectedNumber = sender as! Int//因為這邊的sender的型別為AnyObject，所以需轉型成整數(轉型後即為user所選到的列數)
        bigImageView.image = UIImage(named: annimalArray[selectedNumber])//其中annimalArray[selectedNumber]便可知道user選了哪隻動物，而動物名字剛好也就是圖檔名字。如此一來便可以把轉場後的view中的UIImageView換成所選動物的圖片
        vc.navigationItem.title = annimalArray[selectedNumber]//這邊可以設定轉場後的title為所選動物的名字
    }
    //接下來客製化我們tableView，回到mainStoryBoard將cell勾選customized ->再把列高調成200 ->再到tableView調整列高
}
