User.create!({
  email: "scout@raysbaseball.com",
  password: "password"
})

User.create!({
  email: "otherscout@raysbaseball.com",
  password: "password"
})

Player.create!({
  id: 1,
  first_name: "Tyler",
  last_name: "Glasnow",
  org_id: 1,
  info: {
    bats: "left",
    throws: "right",
    number: "20",
    height: "6.8",
    weight: "225",
    dob: "08/23/93"
  }
})

Player.create!({
  id: 2,
  first_name: "Ji-Man",
  last_name: "Choi",
  org_id: 1,
  info: {
    bats: "left",
    throws: "right",
    number: "26",
    height: "6.1",
    weight: "260",
    dob: "05/19/91"
  }
})

Player.create!({
  id: 3,
  first_name: "Yandy",
  last_name: "Diaz",
  org_id: 1,
  info: {
    bats: "right",
    throws: "right",
    number: "2",
    height: "6.2",
    weight: "225",
    dob: "08/08/91"
  }
})

Player.create!({
  id: 4,
  first_name: "Manuel",
  last_name: "Margot",
  org_id: 1,
  info: {
    bats: "right",
    throws: "right",
    number: "13",
    height: "5.11",
    weight: "180",
    dob: "09/28/94"
  }
})

Player.create!({
  id: 5,
  first_name: "Luis",
  last_name: "Patiño",
  org_id: 1,
  info: {
    bats: "right",
    throws: "right",
    number: "61",
    height: "6.1",
    weight: "192",
    dob: "10/26/99"
  }
})

ScoutingReport.create!({
  user_id: 1,
  player_id: 1,
  report_type: 0,
  grade: 70,
  position: 'P',
  updated_at: "2019-09-21 14:53:27.795701",
  details: {
    pitcher_role: "starter",
    position: 'P',
    summary: "tall lanky RHP, POWER ARM!",
    fastball_min_velo: 89,
    fastball_max_velo: 94,
    sinker_min_velo: 87,
    sinker_max_velo: 90,
    slider_min_velo: 84,
    slider_max_velo: 86,
    curveball_min_velo: 84,
    curveball_max_velo: 85,
    changeup_min_velo: 85,
    changeup_max_velo: 86
  }
})

ScoutingReport.create!({
  user_id: 2,
  player_id: 4,
  report_type: 1,
  grade: 50,
  updated_at: "2019-09-18 14:53:27.795701",
  details: {
    position: 'CF',
    time_to_first: "4.6",
    summary: "2ND DIV REGULAR  POSSIBLE UTILITY OF GOOD TEAM-  STRONG SWING BUT STIFF- HAS LIFE IN BAT  NOT VERY PATIENT AND SWINGS HARD  FREE SWINGER  GETS HIMSELF OUT OFTEN EARLY IN COUNT.  PLAYED WELL IN CF.",
  }
})

ScoutingReport.create!({
  user_id: 1,
  player_id: 2,
  report_type: 1,
  grade: 40,
  updated_at: "2019-09-16 14:53:27.795701",
  details: {
    position: '1B',
    time_to_first: "4.8",
    summary: "Not sure he can maintain a full season...",
  }
})

ScoutingReport.create!({
  user_id: 2,
  player_id: 2,
  report_type: 1,
  grade: 50,
  updated_at: "2019-09-24 14:53:27.795701",
  details: {
    position: '1B',
    time_to_first: "4.8",
    summary: "ONLY SAW DH.  SHORT QUICK SWING  STAYS ON TOP WELL. STRONG AS OX. DRIVES BALL TO ALL FIELDS WITH SOME HR POWER.  A.L PLAYER AS ONLY DH'D",
  }
})

ScoutingReport.create!({
  user_id: 2,
  player_id: 4,
  report_type: 1,
  grade: 50,
  updated_at: "2019-09-12 14:53:27.795701",
  details: {
    position: 'CF',
    time_to_first: "4.6",
    summary: "2ND DIV REGULAR  POSSIBLE UTILITY OF GOOD TEAM-  STRONG SWING BUT STIFF- HAS LIFE IN BAT  NOT VERY PATIENT AND SWINGS HARD  FREE SWINGER  GETS HIMSELF OUT OFTEN EARLY IN COUNT.  PLAYED WELL IN CF.",
  }
})

ScoutingReport.create!({
  user_id: 1,
  player_id: 3,
  report_type: 1,
  grade: 50,
  updated_at: "2019-09-18 14:53:27.795701",
  details: {
    position: 'CF',
    time_to_first: "3.9",
    summary: "Slashing line drive hitter ",
  }
})

ScoutingReport.create!({
  user_id: 1,
  player_id: 5,
  report_type: 0,
  grade: 60,
  updated_at: "2019-04-25 14:53:27.795701",
  details: {
    pitcher_role: "starter",
    summary: "Big strong arm from young kid",
    fastball_min_velo: 89,
    fastball_max_velo: 94,
    sinker_min_velo: 87,
    sinker_max_velo: 90,
    slider_min_velo: 84,
    slider_max_velo: 86,
    curveball_min_velo: 84,
    curveball_max_velo: 85,
    changeup_min_velo: 85,
    changeup_max_velo: 86
  }
})

p "Seed file successfully imported..."
