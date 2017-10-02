/* -+-+-+----------------------------------------+-+-+-
 Soccer Coordinator
 -+-+-+----------------------------------------+-+-+- */

// --++-->> players collated into an array

let players: [[String: Any]] = [
    ["Name": "Joe Smith", "Height": 42, "Soccer Experience": true, "Guardian Name": "Jill and Jan Smith"],
    ["Name": "Jill Tanner", "Height": 36, "Soccer Experience": true, "Guardian Name": "Clara Tanner"],
    ["Name": "Bill Bon", "Height": 43, "Soccer Experience": true, "Guardian Name": "Sara and Jenny Bon"],
    ["Name": "Eva Gordon", "Height": 45, "Soccer Experience": false, "Guardian Name": "Wendy and Mike Gordon"],
    ["Name": "Matt Gill", "Height": 40, "Soccer Experience": false, "Guardian Name": "Charles and Sylvia Gill"],
    ["Name": "Kimmy Stein", "Height": 41, "Soccer Experience": false, "Guardian Name": "Bill and Hillary Stein"],
    ["Name": "Sammy Adams", "Height": 45, "Soccer Experience": false, "Guardian Name": "Jeff Adams"],
    ["Name": "Karl Saygan", "Height": 42, "Soccer Experience": true, "Guardian Name": "Heather Bledsoe"],
    ["Name": "Suzane Greenberg", "Height": 44, "Soccer Experience": true, "Guardian Name": "Henrietta Dumas"],
    ["Name": "Sal Dali", "Height": 41, "Soccer Experience": false, "Guardian Name": "Gala Dali"],
    ["Name": "Joe Kavalier", "Height": 39, "Soccer Experience": false, "Guardian Name": "Sam and Elaine Kavalier"],
    ["Name": "Ben Finkelstein", "Height": 44, "Soccer Experience": false, "Guardian Name": "Aaron and Jill Finkelstein"],
    ["Name": "Diego Soto", "Height": 41, "Soccer Experience": true, "Guardian Name": "Robin and Sarika Soto"],
    ["Name": "Chloe Alaska", "Height": 47, "Soccer Experience": false, "Guardian Name": "David and Jamie Alaska"],
    ["Name": "Arnold Willis", "Height": 43, "Soccer Experience": false, "Guardian Name": "Claire Willis"],
    ["Name": "Phillip Helm", "Height": 44, "Soccer Experience": true, "Guardian Name": "Thomas Helm and Eva Jones"],
    ["Name": "Les Clay", "Height": 42, "Soccer Experience": true, "Guardian Name": "Wynonna Brown"],
    ["Name": "Herschel Krustofski", "Height": 45, "Soccer Experience": true, "Guardian Name": "Hyman and Rachel Krustofski"]
]

// --++-->> initialising team arrays and master array (master array is used for calculating the number of teams for the modulus calculations further down - to avoid magic numbers etc)

var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

var teamMaster: [String] = ["Team Dragons", "Team Sharks", "Team Raptors"]

// --++-->> initialising experienced and inexperienced player arrays

var experiencedPlayers: [[String: Any]] = []
var inexperiencedPlayers: [[String: Any]] = []

// --++-->> initialising experienced and inexperienced counts both master and inidividual team counts

var masterExpCount: Int = 0
var masterInexpCount: Int = 0

var dragonsExpCount: Int = 0
var sharksExpCount: Int = 0
var raptorsExpCount: Int = 0

var dragonsInexpCount: Int = 0
var sharksInexpCount: Int = 0
var raptorsInexpCount: Int = 0

// --++-->> splitting up experienced and inexperienced players

for player in players {
    if player["Soccer Experience"] as! Bool == true {
        experiencedPlayers.append(player)
        masterExpCount += 1
    } else {
        inexperiencedPlayers.append(player)
        masterInexpCount += 1
    }
}

// --++-->> sorting experienced and inexperienced players to make sure heights are distributed evenly so as to keep average heights within 1.5 metres

let sortedExpPlayers = experiencedPlayers.sorted(by: {($0["Height"] as! Int) < ($1["Height"] as! Int)})
let sortedInexpPlayers = inexperiencedPlayers.sorted(by: {($0["Height"] as! Int) > ($1["Height"] as! Int)})

// --++-->> adding players to the three teams

if masterExpCount % teamMaster.count == 0 {
    for player in sortedExpPlayers {
        if dragonsExpCount < (masterExpCount / teamMaster.count) {
            teamDragons.append(player)
            dragonsExpCount += 1
        } else if sharksExpCount < (masterExpCount / teamMaster.count) {
            teamSharks.append(player)
            sharksExpCount += 1
        } else if raptorsExpCount < (masterExpCount / teamMaster.count) {
            teamRaptors.append(player)
            raptorsExpCount += 1
        }
    }
}

if masterInexpCount % teamMaster.count == 0 {
    for player in sortedInexpPlayers {
        if dragonsInexpCount < (masterInexpCount / teamMaster.count) {
            teamDragons.append(player)
            dragonsInexpCount += 1
        } else if sharksInexpCount < (masterInexpCount / teamMaster.count) {
            teamSharks.append(player)
            sharksInexpCount += 1
        } else if raptorsInexpCount < (masterInexpCount / teamMaster.count) {
            teamRaptors.append(player)
            raptorsInexpCount += 1
        }
    }
}

// --++-->> average height function that calulates the average height of each team and prints to console

func averageHeight(team: [[String: Any]], teamName: String) {
    var sum: Double = 0.0
    var avgHeight: Double = 0.0
    
    for player in team {
        let height: Double = Double(player["Height"] as! Int)
        sum += height
    }
    
    avgHeight = sum / Double(team.count)
    print("\(teamName.uppercased()) Average Height: \(avgHeight)")
}

// --++-->> calling average height function for each team

averageHeight(team: teamDragons, teamName: "Team Dragons")
averageHeight(team: teamSharks, teamName: "Team Sharks")
averageHeight(team: teamRaptors, teamName: "Team Raptors")

// --++-->> assigning team practice dates to variables

var teamDragonPracticeDate = "March 17, 1pm"
var teamSharkPracticeDate = "March 17, 3pm"
var teamRaptorPracticeDate = "March 18, 1pm"

// --++-->> initialising letters array

var letters: [String] = []

// --++-->> letters function for writing each letter

func letterWith(team: [[String: Any]], teamDate: String, teamName: String) {
    for player in team {
        letters.append("\n\n---+++--- \(teamName.uppercased()) ---+++---\nDear \(player["Guardian Name"]!),\nCongratulations! \(player["Name"]!) has been placed into the \(teamName).\nBelow is the practice date and time for team Dragon:\n\(teamName) - \(teamDate)\nPlease make sure \(player["Name"]!) brings the necessary equipment for the training.\nIf you have any queries, please email at example@example.com.\nYours sincerely,\nJohn Smith")
    }
}

// --++-->> calling letters function for each team

letterWith(team: teamDragons, teamDate: teamDragonPracticeDate, teamName: "Team Dragons")
letterWith(team: teamSharks, teamDate: teamSharkPracticeDate, teamName: "Team Sharks")
letterWith(team: teamRaptors, teamDate: teamRaptorPracticeDate, teamName: "Team Raptors")

// --++-->> printing letters to console

for letter in letters {
    print(letter)
}








































