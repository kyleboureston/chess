# frozen_string_literal: true

# namespace for everthing displayed to user
module Display
  # mixin for displaying the board itself
  module Board
    def self.included(_base)
      include Conversions
    end

    def display
      clear_screen
      print_letter_legend
      @data.each.with_index do |row, row_index|
        print_row_num_before(row_index)
        print_row(row, row_index)
        print_row_num_after(row_index)
      end
      print_letter_legend
    end

    private

    def clear_screen
      system 'clear'
    end

    def print_row(row, row_index)
      row.each.with_index do |cell, cell_index|
        piece = cell unless cell.nil?
        cell.nil? ? print_blank(row_index, cell_index) : print_character(piece, piece.character, row_index, cell_index)
      end
    end

    def print_character(piece, character, row_index, cell_index)
      if piece.selected
        print " #{character} ".bg_red
      elsif row_index.odd?
        print cell_index.odd? ? " #{character} ".bg_blue : " #{character} ".bg_white
      else
        print cell_index.even? ? " #{character} ".bg_blue : " #{character} ".bg_white
      end
    end

    def print_blank(row_index, cell_index)
      if row_index.odd?
        print cell_index.odd? ? '   '.bg_blue : '   '.bg_white
      else
        print cell_index.even? ? '   '.bg_blue : '   '.bg_white
      end
    end

    def print_letter_legend
      puts '   a  b  c  d  e  f  g  h'.black
    end

    def print_row_num_before(row_index)
      print "#{8 - row_index} ".black
    end

    def print_row_num_after(row_index)
      puts " #{8 - row_index}".black
    end
  end
end
