# frozen_string_literal: true

# the L of lawlessness... the knight
class Knight < Piece
  attr_reader :name, :character

  def initialize(color, position, board)
    @name = 'knight'
    @character = color == 'white' ? "\u2658" : "\u265E"
    super(color, position, board)
  end

  def find_valid_moves
    @valid_moves = valid_knight_moves(@position, @color)
  end

  private

  def valid_knight_moves(position, color, response = [])
    KNIGHT_MOVES.each do |move|
      response << check_moves(position, color, move)
    end
    response.compact
  end
end
