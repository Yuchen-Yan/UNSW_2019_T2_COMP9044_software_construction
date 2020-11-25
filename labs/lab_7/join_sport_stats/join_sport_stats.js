function compare( a, b ) {
  if ( a.matches > b.matches ){
    return -1;
  }
  if ( a.matches < b.matches ){
    return 1;
  }
  return 0;
}

function makeTeamList(teamData, namesData, teamsData) {
    // Take it step by step.
    let team_info = "coached by " + teamData.team.coach;

    let list = [];
    
    for (let i = 0; i < teamsData.length; i++){
      if (teamsData[i].id == teamData.team.id){
        team_info = teamsData[i].team +", "+team_info;
      }
    }
    list.push(team_info);
    
   teamData.players.sort(compare);
  
    for (let i = 0; i < teamData.players.length; i++){
      let str = i+1 + ". ";
      for (let j = 0; j < namesData.length; j++){
        if (teamData.players[i].id == namesData[j].id){
          let n = namesData[j].name;
          str = str + n;
          list.push(str);
        }
      }
      
    }
    return list;
}

const teamJson = process.argv[2];
const namesJson = process.argv[3];
const teamsJson = process.argv[4];
if (teamJson === undefined || namesJson === undefined || teamsJson === undefined) {
  throw new Error(`input not supplied`);
}

// some sample data
const team  = require(`./${teamJson}`);
const names  = require(`./${namesJson}`);
const teams  = require(`./${teamsJson}`);

console.log(makeTeamList(team, names.names, teams.teams));