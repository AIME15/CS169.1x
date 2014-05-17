class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    legal = ["R", "P", "S"]
    wins  = ["P", "S", "R"]
    raise RockPaperScissors::NoSuchStrategyError, "Strategy must be one of R,P,S" if !legal.include?(player1[1]) || !legal.include?(player2[1])
    return player2 if player2[1] == wins[legal.index(player1[1])]
    return player1
  end

  def self.tournament_winner(tournament)
    return self.winner(tournament[0], tournament[1]) if tournament[0][0].instance_of?(String)
    return self.tournament_winner([self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1])])
  end

end
