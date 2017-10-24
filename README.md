# FootballSimulator
FootballSimulator is an application which simulates small football championship between 4-8 teams.
Scenario
	•	User enters the list of teams (not less than 4, but not more than 8)
	•	User clicks “Simulate” button
	•	User see the resulting table with sorted list: first team with highest score, last team with lowest
	•	User can start over the championship
Screens
	•	Splash screen should contain application name and description
	•	Home screen should consists of the list of selected teams, button “+” to add team and button “Simulate” to proceed to results. When no teams are added screen should contain text “Please add from 4 to 8 teams to start simulation” instead of the empty list
	•	Result screen should contain a resulting table (similar to Barclay’s Premier League) with next data:
	◦	Position (#)
	◦	Team name (Team)
	◦	Games played (P)
	◦	Game won (W)
	◦	Game drawn (D)
	◦	Game Lost (L)
	◦	Points (Pts)
Main requirements
	•	Each team should play one game with all other teams. The results should be randomized
	•	Points calculation. Team gets 3 points for each won game, 1 point for drawn game and 0 points for lost one
	•	Team positioning. First place should take the team with the highest points score, last place with lowest
	•	If several teams have the same score then they should be sorted by the name in ascending order
Additional requirements (optional)
	•	Team names. Allow only alphabetic and numeric characters. Limit the team length by 25 characters. Allow adding only unique team names
	•	Allow user to edit team name and remove teams from the list
	•	Add additional columns to result table (after Game lost column and before Points column):
	◦	Goals forward (GF) - the sum of goals team has scored
	◦	Goals against (GA) - the sum of goals other teams has scored against current one
	◦	Goals difference (GD) = GF - GA
Example
User has entered 4 teams:
	•	Team 1
	•	Team 2
	•	Team 3
	•	Team 4
According to the requirements next matches should be played in championship:
	•	Team 1 vs Team 2
	•	Team 1 vs Team 3
	•	Team 1 vs Team 4
	•	Team 2 vs Team 3
	•	Team 2 vs Team 4
	•	Team 3 vs Team 4
For instance, the results are:
	•	Team 1 2:1 Team 2
	•	Team 1 3:0 Team 3
	•	Team 1 7:2 Team 4
	•	Team 2 2:0 Team 3
	•	Team 2 4:1 Team 4
	•	Team 3 1:0 Team 4
	
So, resulting table should look like:

Main requirements

| # | Team name | P | W | D | L | Pts |
|---|-----------|---|---|---|---|-----|
| 1 | Team 1    | 3 | 3 | 0 | 0 | 9   |
| 2 | Team 2    | 3 | 2 | 0 | 1 | 6   |
| 3 | Team 3    | 3 | 1 | 0 | 2 | 3   |
| 4 | Team 4    | 3 | 0 | 0 | 3 | 0   |

Additional requirements

| # | Team name | P | W | D | L | GF | GA | GD | Pts |
| 1 | Team 1    | 3 | 3 | 0 | 0 | 12 | 3  |  9 | 9   |
| 2 | Team 2    | 3 | 2 | 0 | 1 | 7  | 3  | 4  | 6   |
| 3 | Team 3    | 3 | 1 | 0 | 2 | 1  | 5  | -4 | 3   |
| 4 | Team 4    | 3 | 0 | 0 | 3 | 3  | 12 | -9 | 0   |
