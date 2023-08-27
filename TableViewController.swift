//
//  TableViewController.swift
//  NewsTimer
//
//  Created by Nuradil Serik on 26.08.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayNews:[News] = [
        News(title: "The International 2023 Ticket Sales", imageName: "dota1", text: "The International is fast approaching, and for those of you planning on going, we wanted to give you some important dates so you can start planning your trip. Tickets to join the audience live at The International 2023 in Seattle, WA are going on sale August 25th, 2023. Whether you’re planning on attending in person, or hopping on with millions of viewers from around the world to watch our livestream broadcast, join us in cheering on the best Dota teams on the planet as they battle it out for the Aegis."),
        News(title: "Old PSG.LGD joins New PSG.LGD to represent China at The International 2023", imageName: "dota2", text: "Azure Ray is three members of the old lineup for PSG.LGD, and has just secured the regional slot for The International 2023. China only had one slot granted to the region this year via regional qualifiers. It was a tough pill to swallow for players and fans of the former powerhouse region, but a slew of retirements, underwhelming performances and a massive ban wave all impacted the region's chances too much this year.China PSG.LGD was the only team from China to secure an invite by securing enough DPC points. They ended in 6th place with 1284 points. The next Chinese team below them was Team Aster in 16th place with only 486 points."),
        News(title: "Dota 2's 10th anniversary celebration brings 13 commemorative treasures of yesteryear", imageName: "dota3", text: "A decade after Dota 2 burst out of beta, Valve is celebrating with the community by providing the chance to win an item marking each year since the launch. In Dota 2 as in life, for long stretches it feels like we are living inside Faceless Void’s Chronosphere as time seems to freeze. But in reality, time is fleeting, and the fleeting time has brought us to Dota 2’s celebration of completing a decade out of beta. Well, the actual 10-year anniversary was on the 13th of July 2023, but Valve chose to begin the celebrations now."),
        News(title: "Dota 2 over-saturation and viewer fatigue; Fact or Fiction?", imageName: "dota4", text: "'Over-saturation' and 'viewer fatigue' are often terms thrown around the Dota 2 community - but are they even real and how is it measured? For the last six months, we have been immersed in Tier 1 Dota 2 events. Since January there have been three DPC tours, three Majors, two DreamLeague Seasons, and Riyadh Masters. That includes matches played in six regions, tie-breakers, group stages (double for DreamLeague), play-in seeds (for Riyadh Masters), and playoffs for each. That's a whopping 2,486 games played. Those matches included about 14 of the same teams at any given event with a handful of other teams popping in and out. And let's not ignore that the same two teams were playing in the grand finals time and time again.")]
    
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(addNews), userInfo: nil, repeats: true)
        
    }
    
    @objc func addNews(){
        arrayNews.insert(arrayNews[3], at: 0)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Dota 2 News"
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let imageView = cell.viewWithTag(1001) as! UIImageView
        imageView.image = UIImage(named: arrayNews[indexPath.row].imageName)
        let labelTitle = cell.viewWithTag(1002) as! UILabel
        labelTitle.text = arrayNews[indexPath.row].title
        let labelDate = cell.viewWithTag(1003) as! UILabel
        
        let dateFormatter = DateFormatter()
        let todayDate = Date()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "dd.MM.y"
        let formattedDate = dateFormatter.string(from: todayDate)
        labelDate.text = String(formattedDate)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! ViewController
        navigationController?.show(detailVC, sender: self)
        
        
        
        detailVC.detailTitle = arrayNews[indexPath.row].title
        detailVC.detailImageName = arrayNews[indexPath.row].imageName
        detailVC.detailText = arrayNews[indexPath.row].text
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayNews.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
