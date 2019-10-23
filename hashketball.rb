require "pry"

def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end# Write your code here!

def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attr, data|
      if attr == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end
def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attr, data|
      if attr == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end
def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end
def team_names
  game_hash.map do |place, team|
     team[:team_name]
  end
end
def player_numbers(team_name)
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            nums << player[:number]
          end
        end
      end
    end
  end
  nums
end
def player_stats(name)
  stats = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
      data.each do |player|
        if player[:player_name] == name
          stats =  player.delete_if do |k,v|
            k == :player_name
          end
        end
      end
    end
    end
  end
  stats
end
def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
        if player[:shoe] > biggest_shoe
          biggest_shoe = player[:shoe]
          rebounds = player[:rebounds]
        end
      end
    end

  rebounds
end
def most_points_scored
  points = 0
  playera = nil
  game_hash.each do |place, team|
    team[:players].each do |player|
        if player[:points] > points
          points = player[:points]
          playera = player[:player_name]
        end
      end
    end

  playera
end
def winning_team
  awaypoints = 0
  homepoints = 0
  game_hash.each do |place, team|
    if place == :away
    team[:players].each do |player|

          awaypoints = awaypoints +player[:points]


      end

    elsif place == :home

      team[:players].each do |player|
            homepoints = homepoints +player[:points]

        end

    end
  end
    if awaypoints > homepoints
      return game_hash[:away][:team_name]
    elsif homepoints > awaypoints
      return game_hash[:home][:team_name]
    end

end
def player_with_longest_name
  points = 0
  playera = nil
  game_hash.each do |place, team|
    team[:players].each do |player|
        if player[:player_name].length > points
          points = player[:player_name].length
          playera = player[:player_name]
        end
      end
    end

  playera
end

def long_name_steals_a_ton?
  steals = 0
  playera = nil
  game_hash.each do |place, team|
    team[:players].each do |player|
        if player[:steals] > steals
          steals = player[:steals]
          playera = player[:player_name]
        end
      end
    end

  if playera == player_with_longest_name
    return true
  end

end
