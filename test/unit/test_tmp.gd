extends GutTest
func before_all():
	gut.p("Runs once before all tests")

func before_each():
	gut.p("Runs before each test.")

func after_each():
	gut.p("Runs after each test.")

func after_all():
	gut.p("Runs once after all tests")

func test_assert_eq_number_not_equal():
	assert_eq(1, 2, "Should fail.  1 != 2")

func test_assert_eq_number_equal():
	assert_eq('asdf', 'asdf', "Should pass")
	
func custom_sort(a : Team, b : Team):
	if typeof(a.score) == typeof(b.score):
		return a.score > b.score;
	
func test_custom_sort_equal_scores():
	# Create two teams with equal scores
	var team1 = Team.new()
	team1.score = 10
	var team2 = Team.new()
	team2.score = 10

	# Call the custom_sort function
	var result = custom_sort(team1, team2)

	# Assert that the result is false
	assert_eq(result, false)

func test_custom_sort_higher_score():
	# Create two teams with different scores
	var team1 = Team.new()
	team1.score = 10
	var team2 = Team.new()
	team2.score = 15

	# Call the custom_sort function
	var result = custom_sort(team1, team2)

	# Assert that the result is true
	assert_eq(result, false)

func test_custom_sort_lower_score():
	# Create two teams with different scores
	var team1 = Team.new()
	team1.score = 15
	var team2 = Team.new()
	team2.score = 10

	# Call the custom_sort function
	var result = custom_sort(team1, team2)

	# Assert that the result is false
	assert_eq(result, true)

func remove_team(team : Team, teamIndex: int):
	Global.teams_names.push_back(team.team_name)
	Global.teams_positions.pop_back()
	Global.teams.remove_at(teamIndex)
	team._exit_tree()

func test_remove_team_with_valid_index():
	# Create a team
	var team = Team.new()
	team.team_name = "Team 1"

	# Add the team to the list of teams
	Global.teams.push_back(team)

	# Call the remove_team function
	remove_team(team, 0)

	# Assert that the team is removed from the list of teams
	assert_eq(Global.teams.size(), 0)

func test_remove_team_with_invalid_index():
	# Create a team
	var team = Team.new()
	team.team_name = "Team 1"

	# Add the team to the list of teams
	Global.teams.push_back(team)

	# Call the remove_team function with an invalid index
	remove_team(team, 100)

	# Assert that the team is not removed from the list of teams
	assert_eq(Global.teams.size(), 1)

func yes_pressed(yes_button: Button, no_button: Button):
	yes_button.disabled = true
	no_button.disabled = false
	Global.round.current_team.score += 1

func no_pressed(yes_button: Button, no_button: Button):
	yes_button.disabled = false
	no_button.disabled = true
	Global.round.current_team.score -= 1

func test_yes_pressed():
	# Create instances of the buttons
	var yes_button = Button.new()
	var no_button = Button.new()
	
	Global.round = Round.new(30, 0, "Hard", Team.new())
	
	# Set the initial score
	Global.round.current_team.score = 0
	
	# Call the yes_pressed function
	yes_pressed(yes_button, no_button)
	
	# Assert the expected changes
	assert_eq(yes_button.disabled, true)
	assert_eq(no_button.disabled, false)
	assert_eq(Global.round.current_team.score, 1)

func test_no_pressed():
	# Create instances of the buttons
	var yes_button = Button.new()
	var no_button = Button.new()
	
	Global.round = Round.new(30, 0, "Hard", Team.new())
	
	# Set the initial score
	Global.round.current_team.score = 1
	
	# Call the no_pressed function
	no_pressed(yes_button, no_button)
	
	# Assert the expected changes
	assert_eq(yes_button.disabled, false)
	assert_eq(no_button.disabled, true)
	assert_eq(Global.round.current_team.score, 0)
